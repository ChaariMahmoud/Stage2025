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
    string UnsupportedOps,
    string Reason
);

class Program
{
    // Phase actuelle du benchmark :
    // 1) mesurer la couverture des instructions WAT ;
    // 2) tester la traduction WAT -> Boogie ;
    // 3) vérifier que le fichier Boogie généré est syntaxiquement/type-correct avec /noVerify.
    //
    // La vérification complète SMT/Z3 est volontairement supprimée pour cette phase.

    const long MaxWatSizeBytes = 5L * 1024 * 1024; // 5 MB
    const int MaxInstructions = 200_000;

    static readonly HashSet<string> Supported = new()
    {
        // Constants
        "i32.const",
        "i64.const",
        "f32.const",
        "f64.const",

        // Locals
        "local.get",
        "local.set",
        "local.tee",

        // Globals
        "global.get",
        "global.set",

        // Calls
        "call",
        "call_indirect",
        "return_call",
        "return_call_indirect",

        // Control flow
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

        // Integer and float arithmetic
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

        // Remainder
        "i32.rem_s",
        "i64.rem_s",
        "i32.rem_u",
        "i64.rem_u",

        // Comparisons
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

        // Integer unary
        "i32.clz",
        "i64.clz",
        "i32.ctz",
        "i64.ctz",
        "i32.popcnt",
        "i64.popcnt",

        // Bitwise
        "i32.and",
        "i64.and",
        "i32.or",
        "i64.or",
        "i32.xor",
        "i64.xor",
        "i32.shl",
        "i64.shl",
        "i32.shr_s",
        "i64.shr_s",
        "i32.shr_u",
        "i64.shr_u",
        "i32.rotl",
        "i64.rotl",
        "i32.rotr",
        "i64.rotr",

        // Float unary / math
        "f32.abs",
        "f64.abs",
        "f32.neg",
        "f64.neg",
        "f32.sqrt",
        "f64.sqrt",
        "f32.ceil",
        "f64.ceil",
        "f32.floor",
        "f64.floor",
        "f32.trunc",
        "f64.trunc",
        "f32.nearest",
        "f64.nearest",

        // Float min/max/copysign
        "f32.min",
        "f64.min",
        "f32.max",
        "f64.max",
        "f32.copysign",
        "f64.copysign",

        // Numeric casts / conversions
        "i32.wrap_i64",

        "i64.extend_i32_s",
        "i64.extend_i32_u",

        "i32.trunc_f32_s",
        "i32.trunc_f32_u",
        "i32.trunc_f64_s",
        "i32.trunc_f64_u",

        "i64.trunc_f32_s",
        "i64.trunc_f32_u",
        "i64.trunc_f64_s",
        "i64.trunc_f64_u",

        "f32.convert_i32_s",
        "f32.convert_i32_u",
        "f32.convert_i64_s",
        "f32.convert_i64_u",

        "f64.convert_i32_s",
        "f64.convert_i32_u",
        "f64.convert_i64_s",
        "f64.convert_i64_u",

        "f32.demote_f64",
        "f64.promote_f32",

        // Memory load
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

        // Memory store
        "i32.store",
        "i64.store",
        "f32.store",
        "f64.store",

        "i32.store8",
        "i32.store16",

        "i64.store8",
        "i64.store16",
        "i64.store32",

        // Memory management
        "memory.size",
        "memory.grow",
        "memory.fill",
        "memory.copy",

        // Table instructions supported by the current translator
        "table.get",
        "table.set",
        "table.size",
        "table.grow",
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
                    Console.WriteLine($"===== Benchmarking {datasetName}/{name} =====");

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

                    if (info.Length > MaxWatSizeBytes)
                    {
                        var skipped = MakeSkippedResult(
                            datasetName,
                            watFile,
                            "SKIP_TOO_LARGE",
                            $"WAT file too large: {info.Length / 1024 / 1024} MB."
                        );

                        datasetResults.Add(skipped);
                        allResults.Add(skipped);
                        PrintResultRow(skipped);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    var stat = CountInstructions(watFile);

                    if (stat.Total > MaxInstructions)
                    {
                        var skipped = new ContractResult(
                            Dataset: datasetName,
                            WatFile: watFile,
                            BoogieFile: "",
                            TotalInstructions: stat.Total,
                            SupportedInstructions: stat.Supported,
                            UnsupportedInstructions: stat.Unsupported,
                            SupportedPercent: Percent(stat.Supported, stat.Total),
                            FullySupportedWat: false,
                            TranslationStatus: "SKIP_TOO_COMPLEX",
                            BoogieNoVerifyStatus: "NOT_RUN",
                            TranslationTimeMs: 0,
                            UnsupportedOps: string.Join(
                                "; ",
                                stat.UnsupportedOps.Select(x => $"{x.Key}:{x.Value}")
                            ),
                            Reason: $"Too many instructions: {stat.Total}."
                        );

                        datasetResults.Add(skipped);
                        allResults.Add(skipped);
                        PrintResultRow(skipped);
                        SaveProgress(outDir, datasetName, datasetResults, allResults);
                        continue;
                    }

                    string unsupportedOpsText = string.Join(
                        "; ",
                        stat.UnsupportedOps
                            .OrderByDescending(x => x.Value)
                            .ThenBy(x => x.Key)
                            .Select(x => $"{x.Key}:{x.Value}")
                    );

                    bool fullySupportedWat = stat.Unsupported == 0;

                    var sw = Stopwatch.StartNew();

                    var translation = await RunProcess(
                        fileName: "dotnet",
                        arguments: $"{Quote(toolDll)} --wasm {Quote(watFile)} --no-boogie",
                        timeoutMs: 1000000
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

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_translation.log"),
                        LimitText(translation.Output)
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
                            ? "Translation successful and all detected WAT instructions are listed as supported."
                            : "Translation completed but unsupported WAT instructions were detected by the benchmark.";
                    }

                    string noVerifyStatus = "NOT_RUN";

                    if (translationStatus is "PASS" or "PARTIAL")
                    {
                        var noVerify = await RunBoogie(
                            boogieExe,
                            $"/noVerify /inline:none {Quote(boogieFile)}",
                            timeoutMs: 1000000
                        );

                        noVerifyStatus = ClassifyBoogieNoVerify(noVerify);

                        await File.WriteAllTextAsync(
                            Path.Combine(outDir, "logs", $"{logBase}_boogie_noverify.log"),
                            LimitText(noVerify.Output)
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
                        TranslationTimeMs: translationTimeMs,
                        UnsupportedOps: unsupportedOpsText,
                        Reason: reason
                    );

                    datasetResults.Add(result);
                    allResults.Add(result);

                    PrintResultRow(result);
                    SaveProgress(outDir, datasetName, datasetResults, allResults);

                    GC.Collect();
                }
                catch (OutOfMemoryException ex)
                {
                    Console.WriteLine($"OOM_SKIP: {datasetName}/{name}");

                    var result = MakeSkippedResult(
                        datasetName,
                        watFile,
                        "OUT_OF_MEMORY",
                        ex.Message
                    );

                    datasetResults.Add(result);
                    allResults.Add(result);

                    await File.WriteAllTextAsync(
                        Path.Combine(outDir, "logs", $"{logBase}_oom.log"),
                        ex.ToString()
                    );

                    PrintResultRow(result);
                    SaveProgress(outDir, datasetName, datasetResults, allResults);

                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"ERROR_SKIP: {datasetName}/{name}");
                    Console.WriteLine(ex.Message);

                    var result = MakeSkippedResult(datasetName, watFile, "ERROR", ex.Message);

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
        WriteCsv(Path.Combine(outDir, $"{datasetName}_benchmark_results.csv"), datasetResults);
        WriteSummary(Path.Combine(outDir, $"{datasetName}_summary.txt"), datasetResults);

        WriteCsv(Path.Combine(outDir, "all_benchmark_results.csv"), allResults);
        WriteSummary(Path.Combine(outDir, "all_summary.txt"), allResults);
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

        if (output.Contains("out of memory", StringComparison.OrdinalIgnoreCase))
            return "OUT_OF_MEMORY";

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
        int total = 0;
        int supported = 0;
        int unsupported = 0;

        var unsupportedOps = new Dictionary<string, int>();

        // This regex detects operators written as:
        //   (i32.add ...)
        //   (local.get ...)
        //   (memory.copy ...)
        //
        // It does not parse the full WAT grammar. It is a practical benchmark-level scanner.
        var regex = new Regex(@"\(([a-zA-Z0-9_\.$]+)", RegexOptions.Compiled);

        foreach (var line in File.ReadLines(watFile))
        {
            foreach (Match match in regex.Matches(line))
            {
                string op = match.Groups[1].Value;

                if (Ignored.Contains(op))
                    continue;

                total++;

                if (total > MaxInstructions)
                {
                    unsupportedOps["__TOO_MANY_INSTRUCTIONS__"] = total;
                    return (total, supported, unsupported, unsupportedOps);
                }

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
            l.Contains("out of memory", StringComparison.OrdinalIgnoreCase)
            || l.Contains("exception", StringComparison.OrdinalIgnoreCase)
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
                + $"NoVerify={r.BoogieNoVerifyStatus} | "
                + $"Reason={r.Reason}"
        );
    }

    static void WriteCsv(string path, List<ContractResult> results)
    {
        var sb = new StringBuilder();

        sb.AppendLine(
            "dataset,wat_file,boogie_file,total_instructions,supported_instructions,unsupported_instructions,supported_percent,fully_supported_wat,translation_to_boogie,boogie_noverify,translation_time_ms,unsupported_ops,reason"
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

        int skippedLarge = results.Count(r => r.TranslationStatus == "SKIP_TOO_LARGE");
        int skippedComplex = results.Count(r => r.TranslationStatus == "SKIP_TOO_COMPLEX");
        int empty = results.Count(r => r.TranslationStatus == "SKIP_EMPTY");
        int oom = results.Count(r => r.TranslationStatus == "OUT_OF_MEMORY");
        int errors = results.Count(r => r.TranslationStatus == "ERROR");
        int translationFail = results.Count(r => r.TranslationStatus == "FAIL");
        int translationTimeout = results.Count(r => r.TranslationStatus == "TIMEOUT");

        int noVerifyPass = results.Count(r => r.BoogieNoVerifyStatus == "PASS");
        int noVerifyFail = results.Count(r => r.BoogieNoVerifyStatus == "FAIL");
        int noVerifyTimeout = results.Count(r => r.BoogieNoVerifyStatus == "TIMEOUT");
        int noVerifyOom = results.Count(r => r.BoogieNoVerifyStatus == "OUT_OF_MEMORY");

        double avgTranslationMs = results.Count == 0
            ? 0
            : Math.Round(results.Average(r => r.TranslationTimeMs), 2);

        double avgSupportedPercent = results.Count == 0
            ? 0
            : Math.Round(results.Average(r => r.SupportedPercent), 2);

        var unsupportedSummary = results
            .Where(r => !string.IsNullOrWhiteSpace(r.UnsupportedOps))
            .SelectMany(r => r.UnsupportedOps.Split(';', StringSplitOptions.RemoveEmptyEntries))
            .Select(x => x.Trim())
            .Select(x =>
            {
                var parts = x.Split(':', 2);
                if (parts.Length != 2)
                    return (Op: x, Count: 1);

                return int.TryParse(parts[1], out int c)
                    ? (Op: parts[0], Count: c)
                    : (Op: parts[0], Count: 1);
            })
            .GroupBy(x => x.Op)
            .Select(g => new { Op = g.Key, Count = g.Sum(x => x.Count) })
            .OrderByDescending(x => x.Count)
            .ThenBy(x => x.Op)
            .Take(30)
            .ToList();

        var sb = new StringBuilder();

        sb.AppendLine("===== SafeWasm Benchmark Summary =====");
        sb.AppendLine("Phase: WAT instruction coverage + WAT-to-Boogie translation + Boogie /noVerify");
        sb.AppendLine();
        sb.AppendLine($"Total WAT programs: {total}");
        sb.AppendLine();

        sb.AppendLine("=== WAT instruction coverage ===");
        sb.AppendLine($"Fully supported WAT: {fullySupported} ({Percent(fullySupported, total)}%)");
        sb.AppendLine($"Average supported instruction percentage: {avgSupportedPercent}%");
        sb.AppendLine();

        sb.AppendLine("=== Translation WAT -> Boogie ===");
        sb.AppendLine($"Translated to Boogie: {translated} ({Percent(translated, total)}%)");
        sb.AppendLine($"Partially translated: {partial} ({Percent(partial, total)}%)");
        sb.AppendLine($"Translation failed: {translationFail} ({Percent(translationFail, total)}%)");
        sb.AppendLine($"Translation timeout: {translationTimeout} ({Percent(translationTimeout, total)}%)");
        sb.AppendLine();

        sb.AppendLine("=== Skipped programs ===");
        sb.AppendLine($"Skipped empty: {empty} ({Percent(empty, total)}%)");
        sb.AppendLine($"Skipped too large: {skippedLarge} ({Percent(skippedLarge, total)}%)");
        sb.AppendLine($"Skipped too complex: {skippedComplex} ({Percent(skippedComplex, total)}%)");
        sb.AppendLine($"Out of memory skipped: {oom} ({Percent(oom, total)}%)");
        sb.AppendLine($"Unexpected errors skipped: {errors} ({Percent(errors, total)}%)");
        sb.AppendLine();

        sb.AppendLine("=== Boogie validity check ===");
        sb.AppendLine($"Boogie /noVerify PASS: {noVerifyPass} ({Percent(noVerifyPass, total)}%)");
        sb.AppendLine($"Boogie /noVerify FAIL: {noVerifyFail} ({Percent(noVerifyFail, total)}%)");
        sb.AppendLine($"Boogie /noVerify TIMEOUT: {noVerifyTimeout} ({Percent(noVerifyTimeout, total)}%)");
        sb.AppendLine($"Boogie /noVerify OUT_OF_MEMORY: {noVerifyOom} ({Percent(noVerifyOom, total)}%)");
        sb.AppendLine();

        sb.AppendLine("=== Performance ===");
        sb.AppendLine($"Average translation time: {avgTranslationMs} ms");
        sb.AppendLine();

        sb.AppendLine("=== Top unsupported instructions ===");
        if (unsupportedSummary.Count == 0)
        {
            sb.AppendLine("None.");
        }
        else
        {
            foreach (var x in unsupportedSummary)
                sb.AppendLine($"{x.Op}: {x.Count}");
        }

        File.WriteAllText(path, sb.ToString());
    }

    static string Csv(string s)
    {
        return "\"" + s.Replace("\"", "\"\"") + "\"";
    }

    static string LimitText(string text, int maxChars = 2_000_000_000)
    {
        if (text.Length <= maxChars)
            return text;

        return text[..maxChars] + "\n\n--- LOG TRUNCATED ---\n";
    }
}