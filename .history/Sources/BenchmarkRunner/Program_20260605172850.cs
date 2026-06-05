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
    string SmtGenerationStatus,
    string Verify5Status,
    string Verify20Status,
    string Verify60Status,
    double TranslationTimeMs,
    string UnsupportedOps,
    string Reason
);

class Program
{
    static readonly HashSet<string> Supported = new()
    {
        "i32.const",
        "i64.const",
        "f32.const",
        "f64.const",
        "local.get",
        "local.set",
        "local.tee",
        "global.get",
        "global.set",
        "call",
        "call_indirect",
        "return_call",
        "return_call_indirect",
        "block",
        "loop",
        "if",
        "br",
        "br_if",
        "br_table",
        "return",
        "drop",
        "select",
        "nop",
        "unreachable",
        "i32.add",
        "i64.add",
        "f32.add",
        "f64.add",
        "i32.sub",
        "i64.sub",
        "f32.sub",
        "f64.sub",
        "i32.mul",
        "i64.mul",
        "f32.mul",
        "f64.mul",
        "i32.div_s",
        "i64.div_s",
        "i32.div_u",
        "i64.div_u",
        "f32.div",
        "f64.div",
        "i32.eq",
        "i64.eq",
        "f32.eq",
        "f64.eq",
        "i32.ne",
        "i64.ne",
        "f32.ne",
        "f64.ne",
        "i32.lt_s",
        "i64.lt_s",
        "i32.lt_u",
        "i64.lt_u",
        "f32.lt",
        "f64.lt",
        "i32.le_s",
        "i64.le_s",
        "i32.le_u",
        "i64.le_u",
        "f32.le",
        "f64.le",
        "i32.gt_s",
        "i64.gt_s",
        "i32.gt_u",
        "i64.gt_u",
        "f32.gt",
        "f64.gt",
        "i32.ge_s",
        "i64.ge_s",
        "i32.ge_u",
        "i64.ge_u",
        "f32.ge",
        "f64.ge",
        "i32.eqz",
        "i64.eqz",
        "i32.wrap_i64",
        "i32.load",
        "i64.load",
        "f32.load",
        "f64.load",
        "i32.load8_s",
        "i32.load8_u",
        "i32.load16_s",
        "i32.load16_u",
        "i64.load8_s",
        "i64.load8_u",
        "i64.load16_s",
        "i64.load16_u",
        "i64.load32_s",
        "i64.load32_u",
        "i32.store",
        "i64.store",
        "f32.store",
        "f64.store",
        "i32.store8",
        "i32.store16",
        "i64.store8",
        "i64.store16",
        "i64.store32",
    };

    static readonly HashSet<string> Ignored = new()
    {
        "module",
        "type",
        "func",
        "param",
        "result",
        "local",
        "global",
        "mut",
        "then",
        "else",
        "memory",
        "data",
        "export",
        "import",
        "table",
        "elem",
    };

    static async Task<int> Main(string[] args)
    {
        string toolDll = GetArg(args, "--tool") ?? "bin/Debug/VeriSol.dll";
        string boogieExe = GetArg(args, "--boogie") ?? "bin/Debug/boogie";
        string boogieOutDir = GetArg(args, "--boogie-out") ?? "BoogieOutputs";
        string outDir = GetArg(args, "--out") ?? "benchmarks/results";

        var datasets = ParseDatasets(args);

        if (datasets.Count == 0)
        {
            datasets["WasmBench"] = "benchmarks/WasmBench/wat";
            datasets["EOSIO"] = "benchmarks/WANA_EOSIO/wat";
            datasets["XRPL"] = "benchmarks/XRPL/wat";
        }

        Directory.CreateDirectory(outDir);
        Directory.CreateDirectory(Path.Combine(outDir, "logs"));
        Directory.CreateDirectory(Path.Combine(outDir, "smt"));

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
                Console.WriteLine();
                Console.WriteLine($"===== Benchmarking {datasetName}/{name} =====");

                var stat = CountInstructions(watFile);

                string unsupportedOpsText = string.Join(
                    "; ",
                    stat.UnsupportedOps.OrderByDescending(x => x.Value)
                        .ThenBy(x => x.Key)
                        .Select(x => $"{x.Key}:{x.Value}")
                );

                bool fullySupportedWat = stat.Unsupported == 0;

                var sw = Stopwatch.StartNew();

                var translation = await RunProcess(
                    fileName: "dotnet",
                    arguments: $"{Quote(toolDll)} --wasm {Quote(watFile)} --no-boogie",
                    timeoutMs: 10000
                );

                sw.Stop();

                double translationTimeMs = Math.Round(sw.Elapsed.TotalMilliseconds, 2);

                string boogieFile = Path.Combine(boogieOutDir, $"{name}.bpl");

                if (!File.Exists(boogieFile))
                {
                    var candidates = Directory.Exists(boogieOutDir)
                        ? Directory
                            .GetFiles(boogieOutDir, "*.bpl", SearchOption.TopDirectoryOnly)
                            .Where(f => Path.GetFileNameWithoutExtension(f).Contains(name))
                            .OrderByDescending(File.GetLastWriteTimeUtc)
                            .ToList()
                        : new List<string>();

                    if (candidates.Count > 0)
                        boogieFile = candidates[0];
                }

                string logBase = SafeFileName($"{datasetName}_{name}");
                await File.WriteAllTextAsync(
                    Path.Combine(outDir, "logs", $"{logBase}_translation.log"),
                    translation.Output
                );

                string translationStatus;
                string reason = "";

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
                    translationStatus = fullySupportedWat ? "PASS" : "PARTIAL";
                    reason = fullySupportedWat
                        ? "Translation successful and all WAT instructions are supported."
                        : "Translation completed but unsupported WAT instructions were detected.";
                }

                string noVerifyStatus = "NOT_RUN";
                string smtStatus = "NOT_RUN";
                string verify5Status = "NOT_RUN";
                string verify20Status = "NOT_RUN";
                string verify60Status = "NOT_RUN";

                if (translationStatus is "PASS" or "PARTIAL")
                {
                    var noVerify = await RunBoogie(
                        boogieExe,
                        $"/noVerify /inline:none {Quote(boogieFile)}",
                        timeoutMs: 10000
                    );

                    noVerifyStatus = ClassifyBoogie(noVerify, expectVerification: false);

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_boogie_noverify.log"),
                        noVerify.Output
                    );

                    string smtFile = Path.Combine(outDir, "smt", $"{logBase}.smt2");

                    var smt = await RunBoogie(
                        boogieExe,
                        $"/proc:BoogieEntry_* /proverLog:{Quote(smtFile)} {Quote(boogieFile)}",
                        timeoutMs: 70000
                    );

                    smtStatus = File.Exists(smtFile)
                        ? "PASS"
                        : ClassifyBoogie(smt, expectVerification: true);

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_smt.log"),
                        smt.Output
                    );

                    verify5Status = await RunVerification(
                        boogieExe,
                        boogieFile,
                        datasetName,
                        name,
                        outDir,
                        5
                    );

                    verify20Status = await RunVerification(
                        boogieExe,
                        boogieFile,
                        datasetName,
                        name,
                        outDir,
                        20
                    );

                    verify60Status = await RunVerification(
                        boogieExe,
                        boogieFile,
                        datasetName,
                        name,
                        outDir,
                        60
                    );
                }

                var result = new ContractResult(
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
                    SmtGenerationStatus: smtStatus,
                    Verify5Status: verify5Status,
                    Verify20Status: verify20Status,
                    Verify60Status: verify60Status,
                    TranslationTimeMs: translationTimeMs,
                    UnsupportedOps: unsupportedOpsText,
                    Reason: reason
                );

                datasetResults.Add(result);
                allResults.Add(result);

                PrintResultRow(result);
                WriteCsv(Path.Combine(outDir, $"{datasetName}_benchmark_results.csv"), datasetResults);
WriteCsv(Path.Combine(outDir, "all_benchmark_results.csv"), allResults);

WriteSummary(Path.Combine(outDir, $"{datasetName}_summary.txt"), datasetResults);
WriteSummary(Path.Combine(outDir, "all_summary.txt"), allResults);
            }

            WriteCsv(Path.Combine(outDir, $"{datasetName}_benchmark_results.csv"), datasetResults);

            WriteSummary(Path.Combine(outDir, $"{datasetName}_summary.txt"), datasetResults);

            Console.WriteLine();
            Console.WriteLine(File.ReadAllText(Path.Combine(outDir, $"{datasetName}_summary.txt")));
        }

        WriteCsv(Path.Combine(outDir, "all_benchmark_results.csv"), allResults);

        WriteSummary(Path.Combine(outDir, "all_summary.txt"), allResults);

        globalWatch.Stop();

        Console.WriteLine();
        Console.WriteLine("================ GLOBAL SUMMARY ================");
        Console.WriteLine(File.ReadAllText(Path.Combine(outDir, "all_summary.txt")));
        Console.WriteLine($"Total benchmark time: {globalWatch.Elapsed}");

        return 0;
    }

    static async Task<string> RunVerification(
        string boogieExe,
        string boogieFile,
        string dataset,
        string name,
        string outDir,
        int timeLimitSec
    )
    {
        int processTimeoutMs = (timeLimitSec + 15) * 1000;

        var run = await RunBoogie(
            boogieExe,
            $"/proc:BoogieEntry_* /timeLimit:{timeLimitSec} {Quote(boogieFile)}",
            timeoutMs: processTimeoutMs
        );

        string logBase = SafeFileName($"{dataset}_{name}");
        await File.WriteAllTextAsync(
            Path.Combine(outDir, "logs", $"{logBase}_verify_{timeLimitSec}s.log"),
            run.Output
        );

        return ClassifyBoogie(run, expectVerification: true);
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

        var p = Process.Start(psi)!;

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

            return (-1, stdout + "\n" + stderr + "\nTIMEOUT", true);
        }

        string outText = await stdoutTask;
        string errText = await stderrTask;

        return (p.ExitCode, outText + "\n" + errText, false);
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

    static string ClassifyBoogie(
        (int ExitCode, string Output, bool TimedOut) run,
        bool expectVerification
    )
    {
        string output = run.Output;

        if (run.TimedOut)
        {
            if (output.Contains("Inlining", StringComparison.OrdinalIgnoreCase))
                return "TIMEOUT_INLINING";

            if (output.Contains("Verifying", StringComparison.OrdinalIgnoreCase))
                return "TIMEOUT_SMT_OR_VC";

            return "TIMEOUT";
        }

        if (output.Contains("Boogie program verifier finished", StringComparison.OrdinalIgnoreCase))
        {
            if (Regex.IsMatch(output, @"\b0 errors\b"))
                return "PASS";

            return "FAIL";
        }

        if (!expectVerification && run.ExitCode == 0)
            return "PASS";

        if (output.Contains("error", StringComparison.OrdinalIgnoreCase))
            return "FAIL";

        if (output.Contains("unknown", StringComparison.OrdinalIgnoreCase))
            return "UNKNOWN";

        return run.ExitCode == 0 ? "PASS" : "FAIL";
    }

    static Dictionary<string, string> ParseDatasets(string[] args)
    {
        var datasets = new Dictionary<string, string>();

        for (int i = 0; i < args.Length; i++)
        {
            if (args[i] == "--dataset" && i + 1 < args.Length)
            {
                var value = args[i + 1];

                var parts = value.Split('=', 2);

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

    static string Quote(string s)
    {
        return $"\"{s}\"";
    }

    static string SafeFileName(string s)
    {
        foreach (char c in Path.GetInvalidFileNameChars())
            s = s.Replace(c, '_');

        return s.Replace("/", "_").Replace("\\", "_");
    }

    static (
        int Total,
        int Supported,
        int Unsupported,
        Dictionary<string, int> UnsupportedOps
    ) CountInstructions(string watFile)
    {
        string text = File.ReadAllText(watFile);

        var matches = Regex
            .Matches(text, @"\(([a-zA-Z0-9_\.$]+)")
            .Select(m => m.Groups[1].Value)
            .ToList();

        int total = 0;
        int supported = 0;
        int unsupported = 0;

        var unsupportedOps = new Dictionary<string, int>();

        foreach (var op in matches)
        {
            if (Ignored.Contains(op))
                continue;

            total++;

            if (Supported.Contains(op))
            {
                supported++;
            }
            else
            {
                unsupported++;

                if (!unsupportedOps.ContainsKey(op))
                    unsupportedOps[op] = 0;

                unsupportedOps[op]++;
            }
        }

        return (total, supported, unsupported, unsupportedOps);
    }

    static double Percent(int value, int total)
    {
        return total == 0 ? 0.0 : Math.Round(value * 100.0 / total, 2);
    }

    static string ExtractReason(string output)
    {
        var lines = output.Split('\n');

        var important = lines.FirstOrDefault(l =>
            l.Contains("exception", StringComparison.OrdinalIgnoreCase)
            || l.Contains("error", StringComparison.OrdinalIgnoreCase)
            || l.Contains("failed", StringComparison.OrdinalIgnoreCase)
            || l.Contains("unsupported", StringComparison.OrdinalIgnoreCase)
        );

        return important?.Trim() ?? "No explicit error message found.";
    }

    static void PrintResultRow(ContractResult r)
    {
        Console.WriteLine(
            $"Dataset={r.Dataset} | File={Path.GetFileName(r.WatFile)} | "
                + $"Supported={r.SupportedPercent}% | Translate={r.TranslationStatus} | "
                + $"NoVerify={r.BoogieNoVerifyStatus} | SMT={r.SmtGenerationStatus} | "
                + $"T5={r.Verify5Status} | T20={r.Verify20Status} | T60={r.Verify60Status}"
        );
    }

    static void WriteCsv(string path, List<ContractResult> results)
    {
        var sb = new StringBuilder();

        sb.AppendLine(
            "dataset,wat_file,boogie_file,total_instructions,supported_instructions,unsupported_instructions,supported_percent,fully_supported_wat,translation_to_boogie,boogie_noverify,smt_generation,verify_5s,verify_20s,verify_60s,translation_time_ms,unsupported_ops,reason"
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
                    + $"{Csv(r.SmtGenerationStatus)},"
                    + $"{Csv(r.Verify5Status)},"
                    + $"{Csv(r.Verify20Status)},"
                    + $"{Csv(r.Verify60Status)},"
                    + $"{r.TranslationTimeMs},"
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
        int translated = results.Count(r => r.TranslationStatus == "PASS");
        int partial = results.Count(r => r.TranslationStatus == "PARTIAL");

        int noVerifyPass = results.Count(r => r.BoogieNoVerifyStatus == "PASS");
        int smtPass = results.Count(r => r.SmtGenerationStatus == "PASS");

        int v5Pass = results.Count(r => r.Verify5Status == "PASS");
        int v20Pass = results.Count(r => r.Verify20Status == "PASS");
        int v60Pass = results.Count(r => r.Verify60Status == "PASS");

        int inliningTimeouts = results.Count(r =>
            r.SmtGenerationStatus == "TIMEOUT_INLINING"
            || r.Verify5Status == "TIMEOUT_INLINING"
            || r.Verify20Status == "TIMEOUT_INLINING"
            || r.Verify60Status == "TIMEOUT_INLINING"
        );

        double avgTranslationMs =
            results.Count == 0 ? 0 : Math.Round(results.Average(r => r.TranslationTimeMs), 2);

        var sb = new StringBuilder();

        sb.AppendLine("===== SafeWasm Benchmark Summary =====");
        sb.AppendLine($"Total WAT programs: {total}");
        sb.AppendLine();

        sb.AppendLine($"Fully supported WAT: {fullySupported} ({Percent(fullySupported, total)}%)");
        sb.AppendLine($"Translated to Boogie: {translated} ({Percent(translated, total)}%)");
        sb.AppendLine($"Partially translated: {partial} ({Percent(partial, total)}%)");
        sb.AppendLine();

        sb.AppendLine($"Boogie /noVerify PASS: {noVerifyPass} ({Percent(noVerifyPass, total)}%)");
        sb.AppendLine($"SMT generated with inlining: {smtPass} ({Percent(smtPass, total)}%)");
        sb.AppendLine();

        sb.AppendLine($"Verified with 5s timeout: {v5Pass} ({Percent(v5Pass, total)}%)");
        sb.AppendLine($"Verified with 20s timeout: {v20Pass} ({Percent(v20Pass, total)}%)");
        sb.AppendLine($"Verified with 60s timeout: {v60Pass} ({Percent(v60Pass, total)}%)");
        sb.AppendLine();

        sb.AppendLine(
            $"Inlining timeouts: {inliningTimeouts} ({Percent(inliningTimeouts, total)}%)"
        );
        sb.AppendLine($"Average translation time: {avgTranslationMs} ms");

        File.WriteAllText(path, sb.ToString());
    }

    static string Csv(string s)
    {
        return "\"" + s.Replace("\"", "\"\"") + "\"";
    }
}
