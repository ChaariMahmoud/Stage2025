using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

record ContractResult(
    string Dataset,
    string WatFile,
    string BoogieFile,
    int TotalInstructions,
    int SupportedInstructions,
    int UnsupportedInstructions,
    double SupportedPercent,
    bool FullySupportedWat,
    string TranslationStatus,
    string BoogieNoVerifyStatus,
    double TranslationTimeMs,
    double BoogieNoVerifyTimeMs,
    string UnsupportedOps,
    string Reason
);

record CoverageStat(
    int Total,
    int Supported,
    int Unsupported,
    Dictionary<string, int> UnsupportedOps
);

class Program
{
    const int CoverageTimeoutSec = 600;
    const int TranslationTimeoutSec = 600;
    const int BoogieNoVerifyTimeoutSec = 600;

    static async Task<int> Main(string[] args)
    {
        string toolDll = GetArg(args, "--tool") ?? "bin/Debug/VeriSol.dll";
        string boogieExe = GetArg(args, "--boogie") ?? "bin/Debug/boogie";
        string boogieOutDir = GetArg(args, "--boogie-out") ?? "BoogieOutputs";
        string outDir = GetArg(args, "--out") ?? "benchmarks/results/TranslationOnly";

        var datasets = ParseDatasets(args);
        if (datasets.Count == 0)
        {
            datasets["SMALL"] = "benchmarks/wat_small_500";
            datasets["EOSIO"] = "benchmarks/WANA_EOSIO/wat";
            datasets["XRPL"] = "benchmarks/XRPL/wat";
        }

        Directory.CreateDirectory(outDir);
        Directory.CreateDirectory(Path.Combine(outDir, "logs"));

        var allResults = new List<ContractResult>();
        var globalWatch = Stopwatch.StartNew();

        foreach (var dataset in datasets)
        {
            string datasetName = dataset.Key;
            string inputDir = dataset.Value;

            Console.WriteLine();
            Console.WriteLine($"================ DATASET: {datasetName} ================");

            if (!Directory.Exists(inputDir))
            {
                Console.WriteLine($"Dataset directory not found: {inputDir}");
                continue;
            }

            var files = Directory
                .GetFiles(inputDir, "*.wat", SearchOption.AllDirectories)
                .OrderBy(x => x)
                .ToList();

            var datasetResults = new List<ContractResult>();

            foreach (var watFile in files)
            {
                string name = Path.GetFileNameWithoutExtension(watFile);
                string logBase = SafeFileName($"{datasetName}_{name}");

                try
                {
                    Console.WriteLine();
                    Console.WriteLine($"===== Translation-only benchmark {datasetName}/{name} =====");

                    var info = new FileInfo(watFile);
                    if (info.Length == 0)
                    {
                        var skipped = MakeSkippedResult(
                            datasetName,
                            watFile,
                            "SKIP_EMPTY",
                            "Empty WAT file."
                        );

                        datasetResults.Add(skipped);
                        allResults.Add(skipped);
                        PrintResultRow(skipped);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    var coverageWatch = Stopwatch.StartNew();
                    var coverageRun = await RunProcess(
                        fileName: "dotnet",
                        arguments: $"{Quote(toolDll)} --wasm {Quote(watFile)} --coverage-only",
                        timeoutMs: CoverageTimeoutSec * 1000
                    );
                    coverageWatch.Stop();

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_coverage.log"),
                        LimitText(coverageRun.Output)
                    );

                    if (coverageRun.TimedOut)
                    {
                        var result = MakeSkippedResult(
                            datasetName,
                            watFile,
                            "TIMEOUT",
                            "Coverage-only timeout."
                        );

                        datasetResults.Add(result);
                        allResults.Add(result);
                        PrintResultRow(result);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    if (coverageRun.ExitCode != 0)
                    {
                        var result = MakeSkippedResult(
                            datasetName,
                            watFile,
                            "FAIL",
                            "Coverage-only failed: " + ExtractReason(coverageRun.Output)
                        );

                        datasetResults.Add(result);
                        allResults.Add(result);
                        PrintResultRow(result);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    var stat = ParseCoverageOutput(coverageRun.Output);

                    string unsupportedOpsText = string.Join(
                        "; ",
                        stat.UnsupportedOps
                            .OrderByDescending(x => x.Value)
                            .ThenBy(x => x.Key)
                            .Select(x => $"{x.Key}:{x.Value}")
                    );

                    bool fullySupportedWat = stat.Total > 0 && stat.Unsupported == 0;

                    if (stat.Total == 0)
                    {
                        var result = new ContractResult(
                            Dataset: datasetName,
                            WatFile: watFile,
                            BoogieFile: "",
                            TotalInstructions: 0,
                            SupportedInstructions: 0,
                            UnsupportedInstructions: 0,
                            SupportedPercent: 0,
                            FullySupportedWat: false,
                            TranslationStatus: "COUNT_ERROR",
                            BoogieNoVerifyStatus: "NOT_RUN",
                            TranslationTimeMs: 0,
                            BoogieNoVerifyTimeMs: 0,
                            UnsupportedOps: "",
                            Reason: "Coverage-only produced 0 instructions."
                        );

                        datasetResults.Add(result);
                        allResults.Add(result);
                        PrintResultRow(result);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    if (!fullySupportedWat)
                    {
                        var unsupportedResult = new ContractResult(
                            Dataset: datasetName,
                            WatFile: watFile,
                            BoogieFile: "",
                            TotalInstructions: stat.Total,
                            SupportedInstructions: stat.Supported,
                            UnsupportedInstructions: stat.Unsupported,
                            SupportedPercent: Percent(stat.Supported, stat.Total),
                            FullySupportedWat: false,
                            TranslationStatus: "PARTIAL",
                            BoogieNoVerifyStatus: "NOT_RUN",
                            TranslationTimeMs: 0,
                            BoogieNoVerifyTimeMs: 0,
                            UnsupportedOps: unsupportedOpsText,
                            Reason: "WAT not fully supported according to VeriWasm coverage-only."
                        );

                        datasetResults.Add(unsupportedResult);
                        allResults.Add(unsupportedResult);
                        PrintResultRow(unsupportedResult);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    var translationWatch = Stopwatch.StartNew();
                    var translation = await RunProcess(
                        fileName: "dotnet",
                        arguments: $"{Quote(toolDll)} --wasm {Quote(watFile)} --no-boogie",
                        timeoutMs: TranslationTimeoutSec * 1000
                    );
                    translationWatch.Stop();

                    double translationTimeMs = Math.Round(
                        translationWatch.Elapsed.TotalMilliseconds,
                        2
                    );

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_translation.log"),
                        LimitText(translation.Output)
                    );

                    string boogieFile = FindGeneratedBoogieFile(
                        boogieOutDir,
                        name,
                        translation.Output
                    );

                    string translationStatus;
                    string reason;

                    if (translation.TimedOut)
                    {
                        translationStatus = "TIMEOUT";
                        reason = "Translation timeout.";
                    }
                    else if (translation.ExitCode != 0)
                    {
                        translationStatus = "FAIL";
                        reason = ExtractReason(translation.Output);
                    }
                    else if (!File.Exists(boogieFile))
                    {
                        translationStatus = "FAIL";
                        reason = "Boogie file was not generated.";
                    }
                    else
                    {
                        translationStatus = "TRANSLATED";
                        reason = "Translation successful; Boogie file generated.";
                    }

                    string noVerifyStatus = "NOT_RUN";
                    double noVerifyTimeMs = 0;

                    if (translationStatus == "TRANSLATED")
                    {
                        var noVerifyWatch = Stopwatch.StartNew();
                        var noVerify = await RunBoogie(
                            boogieExe,
                            $"/noVerify /inline:none {Quote(boogieFile)}",
                            timeoutMs: BoogieNoVerifyTimeoutSec * 1000
                        );
                        noVerifyWatch.Stop();

                        noVerifyTimeMs = Math.Round(noVerifyWatch.Elapsed.TotalMilliseconds, 2);
                        noVerifyStatus = ClassifyBoogieNoVerify(noVerify);

                        await File.WriteAllTextAsync(
                            Path.Combine(outDir, "logs", $"{logBase}_boogie_noverify.log"),
                            LimitText(noVerify.Output)
                        );
                    }

                    var translatedResult = new ContractResult(
                        Dataset: datasetName,
                        WatFile: watFile,
                        BoogieFile: File.Exists(boogieFile) ? boogieFile : "",
                        TotalInstructions: stat.Total,
                        SupportedInstructions: stat.Supported,
                        UnsupportedInstructions: stat.Unsupported,
                        SupportedPercent: Percent(stat.Supported, stat.Total),
                        FullySupportedWat: fullySupportedWat,
                        TranslationStatus: translationStatus,
                        BoogieNoVerifyStatus: noVerifyStatus,
                        TranslationTimeMs: translationTimeMs,
                        BoogieNoVerifyTimeMs: noVerifyTimeMs,
                        UnsupportedOps: unsupportedOpsText,
                        Reason: reason
                    );

                    datasetResults.Add(translatedResult);
                    allResults.Add(translatedResult);
                    PrintResultRow(translatedResult);
                    SaveProgress(outDir, datasetName, datasetResults, allResults);
                    GC.Collect();
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"ERROR_SKIP: {datasetName}/{name}");
                    Console.WriteLine(ex.Message);

                    var result = MakeSkippedResult(
                        datasetName,
                        watFile,
                        "ERROR",
                        ex.Message
                    );

                    datasetResults.Add(result);
                    allResults.Add(result);

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_error.log"),
                        ex.ToString()
                    );

                    PrintResultRow(result);
                    SaveProgress(outDir, datasetName, datasetResults, allResults);
                }
            }

            WriteCsv(
                Path.Combine(outDir, $"{datasetName}_translation_only_results.csv"),
                datasetResults
            );
            WriteSummary(
                Path.Combine(outDir, $"{datasetName}_translation_only_summary.txt"),
                datasetResults
            );

            Console.WriteLine();
            Console.WriteLine(
                File.ReadAllText(
                    Path.Combine(outDir, $"{datasetName}_translation_only_summary.txt")
                )
            );
        }

        WriteCsv(Path.Combine(outDir, "all_translation_only_results.csv"), allResults);
        WriteSummary(Path.Combine(outDir, "all_translation_only_summary.txt"), allResults);
        WriteProblemReports(outDir, allResults);

        globalWatch.Stop();

        Console.WriteLine();
        Console.WriteLine("================ GLOBAL TRANSLATION-ONLY SUMMARY ================");
        Console.WriteLine(
            File.ReadAllText(Path.Combine(outDir, "all_translation_only_summary.txt"))
        );
        Console.WriteLine($"Total benchmark time: {globalWatch.Elapsed}");

        return 0;
    }

    static CoverageStat ParseCoverageOutput(string output)
    {
        int total = ExtractInt(output, "COVERAGE_TOTAL");
        int supported = ExtractInt(output, "COVERAGE_SUPPORTED");
        int unsupported = ExtractInt(output, "COVERAGE_UNSUPPORTED");

        var unsupportedOps = new Dictionary<string, int>();

        var match = Regex.Match(output, @"COVERAGE_UNSUPPORTED_OPS=(.*)");
        if (match.Success)
        {
            string opsText = match.Groups[1].Value.Trim();

            foreach (var part in opsText.Split(';', StringSplitOptions.RemoveEmptyEntries))
            {
                var pieces = part.Trim().Split(':', 2);

                if (pieces.Length == 2 && int.TryParse(pieces[1], out int count))
                    unsupportedOps[pieces[0].Trim()] = count;
            }
        }

        return new CoverageStat(total, supported, unsupported, unsupportedOps);
    }

    static int ExtractInt(string output, string key)
    {
        var match = Regex.Match(output, $@"{key}=(\d+)");
        return match.Success ? int.Parse(match.Groups[1].Value) : 0;
    }

    static ContractResult MakeSkippedResult(
        string datasetName,
        string watFile,
        string status,
        string reason
    )
    {
        return new ContractResult(
            Dataset: datasetName,
            WatFile: watFile,
            BoogieFile: "",
            TotalInstructions: 0,
            SupportedInstructions: 0,
            UnsupportedInstructions: 0,
            SupportedPercent: 0,
            FullySupportedWat: false,
            TranslationStatus: status,
            BoogieNoVerifyStatus: "NOT_RUN",
            TranslationTimeMs: 0,
            BoogieNoVerifyTimeMs: 0,
            UnsupportedOps: "",
            Reason: reason
        );
    }

    static void SaveProgress(
        string outDir,
        string datasetName,
        List<ContractResult> datasetResults,
        List<ContractResult> allResults
    )
    {
        WriteCsv(
            Path.Combine(outDir, $"{datasetName}_translation_only_results.csv"),
            datasetResults
        );
        WriteSummary(
            Path.Combine(outDir, $"{datasetName}_translation_only_summary.txt"),
            datasetResults
        );
        WriteCsv(Path.Combine(outDir, "all_translation_only_results.csv"), allResults);
        WriteSummary(Path.Combine(outDir, "all_translation_only_summary.txt"), allResults);
    }

    static async Task<(int ExitCode, string Output, bool TimedOut)> RunBoogie(
        string boogieExe,
        string arguments,
        int timeoutMs
    )
    {
        return await RunProcess(boogieExe, arguments, timeoutMs);
    }

    static async Task<(int ExitCode, string Output, bool TimedOut)> RunProcess(
        string fileName,
        string arguments,
        int timeoutMs
    )
    {
        var psi = new ProcessStartInfo
        {
            FileName = fileName,
            Arguments = arguments,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
        };

        using var p = Process.Start(psi)!;

        var stdoutTask = p.StandardOutput.ReadToEndAsync();
        var stderrTask = p.StandardError.ReadToEndAsync();
        var waitTask = p.WaitForExitAsync();

        var completed = await Task.WhenAny(waitTask, Task.Delay(timeoutMs));

        if (completed != waitTask)
        {
            try
            {
                p.Kill(true);
            }
            catch { }

            string stdout = await SafeRead(stdoutTask);
            string stderr = await SafeRead(stderrTask);

            return (-1, LimitText(stdout + "\n" + stderr + "\nTIMEOUT"), true);
        }

        string outText = await stdoutTask;
        string errText = await stderrTask;

        return (p.ExitCode, LimitText(outText + "\n" + errText), false);
    }

    static async Task<string> SafeRead(Task<string> task)
    {
        try
        {
            return await task;
        }
        catch
        {
            return "";
        }
    }

    static string ClassifyBoogieNoVerify((int ExitCode, string Output, bool TimedOut) run)
    {
        string output = run.Output;

        if (run.TimedOut)
            return "TIMEOUT";

        if (output.Contains("Boogie program verifier finished", StringComparison.OrdinalIgnoreCase))
        {
            if (Regex.IsMatch(output, @"\b0 errors\b"))
                return "PASS";

            return "FAIL";
        }

        if (run.ExitCode == 0)
            return "PASS";

        if (output.Contains("error", StringComparison.OrdinalIgnoreCase))
            return "FAIL";

        return "FAIL";
    }

    static Dictionary<string, string> ParseDatasets(string[] args)
    {
        var datasets = new Dictionary<string, string>();

        for (int i = 0; i < args.Length; i++)
        {
            if (args[i] == "--dataset" && i + 1 < args.Length)
            {
                var parts = args[i + 1].Split('=', 2);
                if (parts.Length == 2)
                    datasets[parts[0]] = parts[1];

                i++;
            }
        }

        return datasets;
    }

    static string? GetArg(string[] args, string key)
    {
        int i = Array.IndexOf(args, key);
        return i >= 0 && i + 1 < args.Length ? args[i + 1] : null;
    }

    static string Quote(string s) => $"\"{s}\"";

    static string SafeFileName(string s)
    {
        foreach (char c in Path.GetInvalidFileNameChars())
            s = s.Replace(c, '_');

        return s.Replace("/", "_").Replace("\\", "_");
    }

    static string FindGeneratedBoogieFile(string boogieOutDir, string watName, string output)
    {
        var explicitMatch = Regex.Match(
            output,
            @"(?:Boogie|BPL|Output).*?:\s*(?<path>.*?\.bpl)",
            RegexOptions.IgnoreCase
        );

        if (explicitMatch.Success)
        {
            var p = explicitMatch.Groups["path"].Value.Trim().Trim('"');
            if (File.Exists(p))
                return p;
        }

        var exact = Path.Combine(boogieOutDir, $"{watName}.bpl");
        if (File.Exists(exact))
            return exact;

        if (!Directory.Exists(boogieOutDir))
            return "";

        var candidates = Directory
            .GetFiles(boogieOutDir, "*.bpl", SearchOption.TopDirectoryOnly)
            .Where(f =>
                Path.GetFileNameWithoutExtension(f)
                    .Contains(watName, StringComparison.OrdinalIgnoreCase)
            )
            .OrderByDescending(File.GetLastWriteTimeUtc)
            .ToList();

        if (candidates.Count > 0)
            return candidates[0];

        return Directory
            .GetFiles(boogieOutDir, "*.bpl", SearchOption.TopDirectoryOnly)
            .OrderByDescending(File.GetLastWriteTimeUtc)
            .FirstOrDefault() ?? "";
    }

    static double Percent(int value, int total)
    {
        return total == 0 ? 0.0 : Math.Round(value * 100.0 / total, 2);
    }

    static string ExtractReason(string output)
    {
        var lines = output.Split('\n');

        var important = lines.FirstOrDefault(l =>
            l.Contains("out of memory", StringComparison.OrdinalIgnoreCase)
            || l.Contains("exception", StringComparison.OrdinalIgnoreCase)
            || l.Contains("error", StringComparison.OrdinalIgnoreCase)
            || l.Contains("failed", StringComparison.OrdinalIgnoreCase)
            || l.Contains("unsupported", StringComparison.OrdinalIgnoreCase)
            || l.Contains("timeout", StringComparison.OrdinalIgnoreCase)
        );

        return important?.Trim() ?? "No explicit error message found.";
    }

    static void PrintResultRow(ContractResult r)
    {
        Console.WriteLine(
            $"Dataset={r.Dataset} | File={Path.GetFileName(r.WatFile)} | "
                + $"Supported={r.SupportedPercent}% | Translate={r.TranslationStatus} | "
                + $"NoVerify={r.BoogieNoVerifyStatus} | "
                + $"T_translate={r.TranslationTimeMs}ms | "
                + $"T_noVerify={r.BoogieNoVerifyTimeMs}ms | "
                + $"Reason={r.Reason}"
        );
    }

    static void WriteProblemReports(string outDir, List<ContractResult> results)
    {
        var partial = results
            .Where(r => r.TranslationStatus == "PARTIAL")
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.WatFile)
            .ToList();

        var failed = results
            .Where(r =>
                r.TranslationStatus == "FAIL"
                || r.TranslationStatus == "TIMEOUT"
                || r.TranslationStatus == "ERROR"
                || r.TranslationStatus == "SKIP_EMPTY"
                || r.TranslationStatus == "COUNT_ERROR"
            )
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.TranslationStatus)
            .ThenBy(r => r.WatFile)
            .ToList();

        var noVerifyFailed = results
            .Where(r => r.BoogieNoVerifyStatus != "PASS" && r.BoogieNoVerifyStatus != "NOT_RUN")
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.BoogieNoVerifyStatus)
            .ThenBy(r => r.WatFile)
            .ToList();

        var problematic = results
            .Where(r =>
                r.TranslationStatus != "TRANSLATED"
                || (r.BoogieNoVerifyStatus != "PASS" && r.BoogieNoVerifyStatus != "NOT_RUN")
            )
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.TranslationStatus)
            .ThenBy(r => r.BoogieNoVerifyStatus)
            .ThenBy(r => r.WatFile)
            .ToList();

        WriteCsv(Path.Combine(outDir, "partial_translations.csv"), partial);
        WriteCsv(Path.Combine(outDir, "failed_translations.csv"), failed);
        WriteCsv(Path.Combine(outDir, "boogie_noverify_failed.csv"), noVerifyFailed);
        WriteCsv(Path.Combine(outDir, "problematic_files.csv"), problematic);
    }

    static void WriteCsv(string path, List<ContractResult> results)
    {
        var sb = new StringBuilder();

        sb.AppendLine(
            "dataset,wat_file,boogie_file,total_instructions,supported_instructions,unsupported_instructions,supported_percent,fully_supported_wat,translation_to_boogie,boogie_noverify,translation_time_ms,boogie_noverify_time_ms,unsupported_ops,reason"
        );

        foreach (var r in results)
        {
            sb.AppendLine(
                $"{Csv(r.Dataset)},"
                    + $"{Csv(r.WatFile)},"
                    + $"{Csv(r.BoogieFile)},"
                    + $"{r.TotalInstructions},"
                    + $"{r.SupportedInstructions},"
                    + $"{r.UnsupportedInstructions},"
                    + $"{r.SupportedPercent},"
                    + $"{r.FullySupportedWat},"
                    + $"{Csv(r.TranslationStatus)},"
                    + $"{Csv(r.BoogieNoVerifyStatus)},"
                    + $"{r.TranslationTimeMs},"
                    + $"{r.BoogieNoVerifyTimeMs},"
                    + $"{Csv(r.UnsupportedOps)},"
                    + $"{Csv(r.Reason)}"
            );
        }

        File.WriteAllText(path, sb.ToString());
    }

    static void WriteSummary(string path, List<ContractResult> results)
    {
        int total = results.Count;

        int fullySupported = results.Count(r => r.FullySupportedWat);
        int partialUnsupported = results.Count(r => r.TranslationStatus == "PARTIAL");
        int countError = results.Count(r => r.TranslationStatus == "COUNT_ERROR");

        int translated = results.Count(r => r.TranslationStatus == "TRANSLATED");
        int boogieGenerated = translated;

        int translationTimeout = results.Count(r => r.TranslationStatus == "TIMEOUT");
        int translationFail = results.Count(r =>
            r.TranslationStatus == "FAIL" || r.TranslationStatus == "ERROR"
        );
        int skippedEmpty = results.Count(r => r.TranslationStatus == "SKIP_EMPTY");

        int noVerifyAttempted = results.Count(r => r.BoogieNoVerifyStatus != "NOT_RUN");
        int noVerifyPass = results.Count(r => r.BoogieNoVerifyStatus == "PASS");
        int noVerifyTimeout = results.Count(r => r.BoogieNoVerifyStatus == "TIMEOUT");
        int noVerifyFail = results.Count(r =>
            r.BoogieNoVerifyStatus != "PASS"
            && r.BoogieNoVerifyStatus != "NOT_RUN"
            && r.BoogieNoVerifyStatus != "TIMEOUT"
        );

        double avgTranslationMs =
            results.Count == 0 ? 0 : Math.Round(results.Average(r => r.TranslationTimeMs), 2);

        var noVerifyTimes = results
            .Where(r => r.BoogieNoVerifyStatus != "NOT_RUN")
            .Select(r => r.BoogieNoVerifyTimeMs)
            .ToList();

        double avgNoVerifyMs =
            noVerifyTimes.Count == 0 ? 0 : Math.Round(noVerifyTimes.Average(), 2);

        var sb = new StringBuilder();

        sb.AppendLine("===== SafeWasm Translation-Only Benchmark Summary =====");
        sb.AppendLine($"Total WAT programs: {total}");
        sb.AppendLine();

        sb.AppendLine("---- WAT instruction coverage ----");
        sb.AppendLine(
            $"Fully supported WAT: {fullySupported} ({Percent(fullySupported, total)}% of total)"
        );
        sb.AppendLine(
            $"PARTIAL unsupported WAT not translated: {partialUnsupported} ({Percent(partialUnsupported, total)}% of total)"
        );
        sb.AppendLine(
            $"Coverage counting errors: {countError} ({Percent(countError, total)}% of total)"
        );
        sb.AppendLine();

        sb.AppendLine("---- WAT to Boogie translation ----");
        sb.AppendLine(
            $"Boogie files generated: {boogieGenerated} ({Percent(boogieGenerated, total)}% of total)"
        );
        sb.AppendLine(
            $"Translation timeout: {translationTimeout} ({Percent(translationTimeout, total)}% of total)"
        );
        sb.AppendLine(
            $"Translation errors/failures: {translationFail} ({Percent(translationFail, total)}% of total)"
        );
        sb.AppendLine(
            $"Skipped empty: {skippedEmpty} ({Percent(skippedEmpty, total)}% of total)"
        );
        sb.AppendLine();

        sb.AppendLine("---- Boogie well-formedness check ----");
        sb.AppendLine($"Boogie /noVerify attempted: {noVerifyAttempted}");
        sb.AppendLine(
            $"Boogie /noVerify PASS: {noVerifyPass} ({Percent(noVerifyPass, noVerifyAttempted)}% of attempted, {Percent(noVerifyPass, boogieGenerated)}% of Boogie files)"
        );
        sb.AppendLine(
            $"Boogie /noVerify timeout: {noVerifyTimeout} ({Percent(noVerifyTimeout, noVerifyAttempted)}% of attempted)"
        );
        sb.AppendLine(
            $"Boogie /noVerify failed: {noVerifyFail} ({Percent(noVerifyFail, noVerifyAttempted)}% of attempted)"
        );
        sb.AppendLine();

        sb.AppendLine("---- Timing ----");
        sb.AppendLine($"Average translation time: {avgTranslationMs} ms");
        sb.AppendLine($"Average Boogie /noVerify time: {avgNoVerifyMs} ms");

        File.WriteAllText(path, sb.ToString());
    }

    static string Csv(string s)
    {
        return "\"" + s.Replace("\"", "\"\"") + "\"";
    }

    static string LimitText(string text, int maxChars = 10_000_000)
    {
        if (text.Length <= maxChars)
            return text;

        return text[..maxChars] + "\n\n--- LOG TRUNCATED ---\n";
    }
}