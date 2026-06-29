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

class Program
{
    const int TranslationTimeoutSec = 600;
    const int BoogieNoVerifyTimeoutSec = 600;

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
        "i32.rem_s",
        "i64.rem_s",
        "i32.rem_u",
        "i64.rem_u",
        "i32.clz",
        "i64.clz",
        "i32.ctz",
        "i64.ctz",
        "i32.popcnt",
        "i64.popcnt",
        "f32.abs",
        "f64.abs",
        "f32.neg",
        "f64.neg",
        "f32.sqrt",
        "f64.sqrt",
        "f32.nearest",
        "f64.nearest",
        "f32.floor",
        "f64.floor",
        "f32.ceil",
        "f64.ceil",
        "f32.trunc",
        "f64.trunc",
        "f32.min",
        "f64.min",
        "f32.max",
        "f64.max",
        "f32.copysign",
        "f64.copysign",
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
        "memory.size",
        "memory.grow",
        "memory.fill",
        "memory.copy",
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
        "tag",
        "rec",
        "field",
        "struct",
        "array",
        "offset",
        "align",
        "start",
        "end",
    };

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
                    Console.WriteLine(
                        $"===== Translation-only benchmark {datasetName}/{name} ====="
                    );

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

                    var stat = CountInstructions(watFile);
                    string unsupportedOpsText = string.Join(
                        "; ",
                        stat.UnsupportedOps.OrderByDescending(x => x.Value)
                            .ThenBy(x => x.Key)
                            .Select(x => $"{x.Key}:{x.Value}")
                    );
                    bool fullySupportedWat = stat.Unsupported == 0;

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
                        translationStatus = fullySupportedWat ? "PASS" : "PARTIAL";
                        reason = fullySupportedWat
                            ? "Translation successful and all counted WAT instructions are supported."
                            : "Translation completed, but unsupported WAT instructions were detected by the benchmark counter.";
                    }

                    string noVerifyStatus = "NOT_RUN";
                    double noVerifyTimeMs = 0;

                    if (translationStatus is "PASS" or "PARTIAL")
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
                        BoogieNoVerifyTimeMs: noVerifyTimeMs,
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

        if (output.Contains("out of memory", StringComparison.OrdinalIgnoreCase))
            return "OUT_OF_MEMORY";

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
        int blockCommentDepth = 0;
        var unsupportedOps = new Dictionary<string, int>();

        var parenthesizedOpRegex = new Regex(
            @"\(([a-zA-Z][a-zA-Z0-9_\.$]*)",
            RegexOptions.Compiled
        );

        foreach (var rawLine in File.ReadLines(watFile))
        {
            string line = StripWatCommentsAndStrings(rawLine, ref blockCommentDepth);
            if (string.IsNullOrWhiteSpace(line))
                continue;

            // 1) Prefix/S-expression form, e.g. (i32.add (i32.const 1) (i32.const 2))
            foreach (Match match in parenthesizedOpRegex.Matches(line))
                AddCandidateOp(match.Groups[1].Value);

            // 2) Flat/postfix wasm2wat form, e.g. local.get 0 / i32.add / br_if 1
            string trimmed = line.TrimStart();
            if (!trimmed.StartsWith("(") && !trimmed.StartsWith(")"))
            {
                string firstToken = GetFirstWatToken(trimmed);
                if (!string.IsNullOrWhiteSpace(firstToken))
                    AddCandidateOp(firstToken);
            }
        }

        return (total, supported, unsupported, unsupportedOps);

        void AddCandidateOp(string op)
        {
            if (string.IsNullOrWhiteSpace(op))
                return;

            op = op.Trim();

            // Remove labels/comments generated by wasm2wat such as (;@1;) if they leak in.
            if (op.StartsWith(";"))
                return;

            if (Ignored.Contains(op))
                return;

            // Avoid counting symbols, local names, numeric operands, type names, and attributes.
            if (!LooksLikeWatInstruction(op))
                return;

            total++;
            if (Supported.Contains(op))
            {
                supported++;
            }
            else
            {
                unsupported++;
                unsupportedOps[op] = unsupportedOps.GetValueOrDefault(op) + 1;
            }
        }
    }

    static string GetFirstWatToken(string line)
    {
        int i = 0;
        while (i < line.Length && !char.IsWhiteSpace(line[i]) && line[i] != ')' && line[i] != '(')
            i++;
        return i == 0 ? "" : line[..i];
    }

    static bool LooksLikeWatInstruction(string op)
    {
        if (string.IsNullOrWhiteSpace(op))
            return false;

        if (op.StartsWith("$") || op.StartsWith("@"))
            return false;

        if (op.Contains('='))
            return false;

        if (int.TryParse(op, out _))
            return false;

        // Most real Wasm opcodes are either explicitly supported or contain a dot.
        // Control instructions and a few special instructions do not contain a dot.
        if (Supported.Contains(op))
            return true;

        if (op.Contains('.'))
            return true;

        return op is
            "block"
            or "loop"
            or "if"
            or "br"
            or "br_if"
            or "br_table"
            or "call"
            or "call_indirect"
            or "return_call"
            or "return_call_indirect"
            or "return"
            or "drop"
            or "select"
            or "nop"
            or "unreachable"
            or "memory.size"
            or "memory.grow"
            or "memory.fill"
            or "memory.copy";
    }

    static string StripWatCommentsAndStrings(string line, ref int blockCommentDepth)
    {
        var sb = new StringBuilder();
        bool inString = false;

        for (int i = 0; i < line.Length; i++)
        {
            char c = line[i];
            char next = i + 1 < line.Length ? line[i + 1] : '\0';

            if (blockCommentDepth > 0)
            {
                if (c == '(' && next == ';')
                {
                    blockCommentDepth++;
                    i++;
                }
                else if (c == ';' && next == ')')
                {
                    blockCommentDepth--;
                    i++;
                }
                continue;
            }

            if (inString)
            {
                if (c == '\\')
                {
                    i++;
                    continue;
                }
                if (c == '"')
                    inString = false;
                continue;
            }

            if (c == '"')
            {
                inString = true;
                continue;
            }

            if (c == ';' && next == ';')
                break;

            if (c == '(' && next == ';')
            {
                blockCommentDepth++;
                i++;
                continue;
            }

            sb.Append(c);
        }

        return sb.ToString();
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
                || r.TranslationStatus == "OUT_OF_MEMORY"
                || r.TranslationStatus == "ERROR"
                || r.TranslationStatus == "SKIP_EMPTY"
            )
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.TranslationStatus)
            .ThenBy(r => r.WatFile)
            .ToList();

        var noVerifyFailed = results
            .Where(r =>
                r.BoogieNoVerifyStatus != "PASS"
                && r.BoogieNoVerifyStatus != "NOT_RUN"
            )
            .OrderBy(r => r.Dataset)
            .ThenBy(r => r.BoogieNoVerifyStatus)
            .ThenBy(r => r.WatFile)
            .ToList();

        var problematic = results
            .Where(r =>
                r.TranslationStatus != "PASS"
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

        int translatedPass = results.Count(r => r.TranslationStatus == "PASS");
        int translatedPartial = results.Count(r => r.TranslationStatus == "PARTIAL");
        int boogieGenerated = results.Count(r =>
            r.TranslationStatus == "PASS" || r.TranslationStatus == "PARTIAL"
        );

        int translationTimeout = results.Count(r => r.TranslationStatus == "TIMEOUT");
        int translationOom = results.Count(r => r.TranslationStatus == "OUT_OF_MEMORY");
        int translationFail = results.Count(r =>
            r.TranslationStatus == "FAIL" || r.TranslationStatus == "ERROR"
        );
        int skippedEmpty = results.Count(r => r.TranslationStatus == "SKIP_EMPTY");

        int noVerifyAttempted = results.Count(r => r.BoogieNoVerifyStatus != "NOT_RUN");
        int noVerifyPass = results.Count(r => r.BoogieNoVerifyStatus == "PASS");
        int noVerifyTimeout = results.Count(r => r.BoogieNoVerifyStatus == "TIMEOUT");
        int noVerifyOom = results.Count(r => r.BoogieNoVerifyStatus == "OUT_OF_MEMORY");
        int noVerifyFail = results.Count(r =>
            r.BoogieNoVerifyStatus != "PASS"
            && r.BoogieNoVerifyStatus != "NOT_RUN"
            && r.BoogieNoVerifyStatus != "TIMEOUT"
            && r.BoogieNoVerifyStatus != "OUT_OF_MEMORY"
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
        sb.AppendLine();

        sb.AppendLine("---- WAT to Boogie translation ----");
        sb.AppendLine(
            $"Boogie files generated: {boogieGenerated} ({Percent(boogieGenerated, total)}% of total)"
        );
        sb.AppendLine(
            $"  - PASS translations: {translatedPass} ({Percent(translatedPass, total)}% of total)"
        );
        sb.AppendLine(
            $"  - PARTIAL translations: {translatedPartial} ({Percent(translatedPartial, total)}% of total)"
        );
        sb.AppendLine(
            $"Translation timeout: {translationTimeout} ({Percent(translationTimeout, total)}% of total)"
        );
        sb.AppendLine(
            $"Translation out-of-memory: {translationOom} ({Percent(translationOom, total)}% of total)"
        );
        sb.AppendLine(
            $"Translation errors/failures: {translationFail} ({Percent(translationFail, total)}% of total)"
        );
        sb.AppendLine($"Skipped empty: {skippedEmpty} ({Percent(skippedEmpty, total)}% of total)");
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
            $"Boogie /noVerify out-of-memory: {noVerifyOom} ({Percent(noVerifyOom, noVerifyAttempted)}% of attempted)"
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