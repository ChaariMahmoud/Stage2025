using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

record ContractResult(
    string File,
    string Status,
    int TotalInstructions,
    int SupportedInstructions,
    int UnsupportedInstructions,
    double SupportedPercent,
    double UnsupportedPercent,
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
        "i64.wrap_i64",
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
        "f32.min",
        "f64.min",
        "f32.max",
        "f64.max",
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
    };

    static async Task<int> Main(string[] args)
    {
        var totalStopwatch = Stopwatch.StartNew();
        string inputDir = GetArg(args, "--input") ?? "benchmarks/WANA_EOSIO/wat";
        string toolDll = GetArg(args, "--tool") ?? "bin/Debug/VeriSol.dll";
        string outDir = GetArg(args, "--out") ?? "benchmarks/results/WANA_EOSIO";

        Directory.CreateDirectory(outDir);
        Directory.CreateDirectory(Path.Combine(outDir, "logs"));

        var files = Directory
            .GetFiles(inputDir, "*.wat", SearchOption.AllDirectories)
            .OrderBy(x => x)
            .ToList();

        var results = new List<ContractResult>();

        foreach (var file in files)
        {
            string name = Path.GetFileNameWithoutExtension(file);
            Console.WriteLine($"===== Benchmarking {name} =====");

            var stat = CountInstructions(file);

            string unsupportedOpsText = string.Join(
                "; ",
                stat.UnsupportedOps.OrderByDescending(x => x.Value)
                    .ThenBy(x => x.Key)
                    .Select(x => $"{x.Key}:{x.Value}")
            );

            var translationStopwatch = Stopwatch.StartNew();
            var run = await RunTool(toolDll, file);
            translationStopwatch.Stop();

            double translationTimeMs = Math.Round(
                translationStopwatch.Elapsed.TotalMilliseconds,
                2
            );

            string logPath = Path.Combine(outDir, "logs", $"{name}.log");
            await File.WriteAllTextAsync(logPath, run.Output);

            bool conversionOk =
                run.ExitCode == 0 && run.Output.Contains("WAT → Boogie conversion completed");
            bool boogieSuccess =
                run.Output.Contains("Proof found")
                || run.Output.Contains("verified")
                || run.Output.Contains("0 errors");
            bool hasUnsupportedInLog =
                run.Output.Contains("unsupported", StringComparison.OrdinalIgnoreCase)
                || run.Output.Contains(
                    "unhandled raw instruction",
                    StringComparison.OrdinalIgnoreCase
                )
                || run.Output.Contains("not implemented", StringComparison.OrdinalIgnoreCase);

            bool hasUnsupportedStat = stat.Unsupported > 0;

            string status;
            string reason;

            if (!conversionOk)
            {
                status = "Failed";
                reason = ExtractReason(run.Output);
            }
            else if (hasUnsupportedInLog || hasUnsupportedStat)
            {
                status = "PartiallyTranslated";
                reason =
                    "Translation completed, but unsupported instructions/features were detected.";
            }
            else if (!boogieSuccess)
            {
                status = "TranslatedOnly";
                reason = "Boogie code generated, but formal verification success was not detected.";
            }
            else
            {
                status = "FullyVerified";
                reason = "Boogie code generated and verified successfully.";
            }

            results.Add(
                new ContractResult(
                    File: file,
                    Status: status,
                    TotalInstructions: stat.Total,
                    SupportedInstructions: stat.Supported,
                    UnsupportedInstructions: stat.Unsupported,
                    SupportedPercent: Percent(stat.Supported, stat.Total),
                    UnsupportedPercent: Percent(stat.Unsupported, stat.Total),
                    TranslationTimeMs: translationTimeMs,
                    UnsupportedOps: unsupportedOpsText,
                    Reason: reason.Replace("\n", " ").Replace("\r", " ")
                )
            );
        }

        WriteCsv(Path.Combine(outDir, "benchmark_results.csv"), results);
        WriteSummary(Path.Combine(outDir, "summary.txt"), results);
        WriteUnsupportedSummary(Path.Combine(outDir, "unsupported_summary.csv"), results);

        Console.WriteLine();
        Console.WriteLine(File.ReadAllText(Path.Combine(outDir, "summary.txt")));
        totalStopwatch.Stop();

        Console.WriteLine($"Total benchmark time: {totalStopwatch.Elapsed}");
        return 0;
    }

    static string? GetArg(string[] args, string key)
    {
        int i = Array.IndexOf(args, key);
        return i >= 0 && i + 1 < args.Length ? args[i + 1] : null;
    }

    static async Task<(int ExitCode, string Output)> RunTool(string toolDll, string watFile)
    {
        var psi = new ProcessStartInfo
        {
            FileName = "dotnet",
            Arguments = $"{Quote(toolDll)} --wasm {Quote(watFile)}",
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
        };

        var p = Process.Start(psi)!;

        string stdout = await p.StandardOutput.ReadToEndAsync();
        string stderr = await p.StandardError.ReadToEndAsync();

        await p.WaitForExitAsync();

        return (p.ExitCode, stdout + "\n" + stderr);
    }

    static string Quote(string s) => $"\"{s}\"";

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
            || l.Contains("not implemented", StringComparison.OrdinalIgnoreCase)
            || l.Contains("unhandled raw instruction", StringComparison.OrdinalIgnoreCase)
        );

        return important?.Trim() ?? "No explicit error message found.";
    }

    static void WriteCsv(string path, List<ContractResult> results)
    {
        var sb = new StringBuilder();

        sb.AppendLine(
            "file,status,total_instructions,supported_instructions,unsupported_instructions,supported_percent,unsupported_percent,translation_time_ms,unsupported_ops,reason"
        );

        foreach (var r in results)
        {
            sb.AppendLine(
                $"{Csv(r.File)},{r.Status},{r.TotalInstructions},{r.SupportedInstructions},{r.UnsupportedInstructions},{r.SupportedPercent},{r.UnsupportedPercent},{r.TranslationTimeMs},{Csv(r.UnsupportedOps)},{Csv(r.Reason)}"
            );
        }

        File.WriteAllText(path, sb.ToString());
    }

    static void WriteSummary(string path, List<ContractResult> results)
    {
        int total = results.Count;
        int fullVerified = results.Count(r => r.Status == "FullyVerified");
        int translatedOnly = results.Count(r => r.Status == "TranslatedOnly");
        int partial = results.Count(r => r.Status == "PartiallyTranslated");
        int failed = results.Count(r => r.Status == "Failed");
        double avgTimeMs =
            results.Count == 0 ? 0 : Math.Round(results.Average(r => r.TranslationTimeMs), 2);
        double minTimeMs =
            results.Count == 0 ? 0 : Math.Round(results.Min(r => r.TranslationTimeMs), 2);
        double maxTimeMs =
            results.Count == 0 ? 0 : Math.Round(results.Max(r => r.TranslationTimeMs), 2);
        double totalTimeSec =
            results.Count == 0 ? 0 : Math.Round(results.Sum(r => r.TranslationTimeMs) / 1000.0, 2);
        var partialFailed = results
            .Where(r => r.Status == "PartiallyTranslated" || r.Status == "Failed")
            .ToList();

        double avgSupportedPF =
            partialFailed.Count == 0
                ? 0
                : Math.Round(partialFailed.Average(r => r.SupportedPercent), 2);

        double avgUnsupportedPF =
            partialFailed.Count == 0
                ? 0
                : Math.Round(partialFailed.Average(r => r.UnsupportedPercent), 2);

        var sb = new StringBuilder();

        sb.AppendLine("===== VeriWasm Benchmark Summary =====");
        sb.AppendLine($"Total contracts: {total}");
        sb.AppendLine($"Fully verified: {fullVerified} ({Percent(fullVerified, total)}%)");
        sb.AppendLine($"Translated only: {translatedOnly} ({Percent(translatedOnly, total)}%)");
        sb.AppendLine($"Partially translated: {partial} ({Percent(partial, total)}%)");
        sb.AppendLine($"Failed: {failed} ({Percent(failed, total)}%)");
        sb.AppendLine();
        sb.AppendLine("Instruction coverage for partial/failed contracts:");
        sb.AppendLine($"Average translated instructions/features: {avgSupportedPF}%");
        sb.AppendLine($"Average unsupported instructions/features: {avgUnsupportedPF}%");
        sb.AppendLine();
        sb.AppendLine("Translation time:");
        sb.AppendLine($"Total translation time: {totalTimeSec} s");
        sb.AppendLine($"Average time per contract: {avgTimeMs} ms");
        sb.AppendLine($"Min time: {minTimeMs} ms");
        sb.AppendLine($"Max time: {maxTimeMs} ms");
        File.WriteAllText(path, sb.ToString());
    }

    static void WriteUnsupportedSummary(string path, List<ContractResult> results)
    {
        var global = new Dictionary<string, int>();

        foreach (var r in results)
        {
            if (string.IsNullOrWhiteSpace(r.UnsupportedOps))
                continue;

            var parts = r.UnsupportedOps.Split(';', StringSplitOptions.RemoveEmptyEntries);

            foreach (var part in parts)
            {
                var p = part.Trim();
                var split = p.Split(':');

                if (split.Length != 2)
                    continue;

                string op = split[0].Trim();

                if (!int.TryParse(split[1].Trim(), out int count))
                    continue;

                if (!global.ContainsKey(op))
                    global[op] = 0;

                global[op] += count;
            }
        }

        var sb = new StringBuilder();
        sb.AppendLine("unsupported_instruction_or_feature,count");

        foreach (var kv in global.OrderByDescending(x => x.Value).ThenBy(x => x.Key))
        {
            sb.AppendLine($"{Csv(kv.Key)},{kv.Value}");
        }

        File.WriteAllText(path, sb.ToString());
    }

    static string Csv(string s)
    {
        return "\"" + s.Replace("\"", "\"\"") + "\"";
    }
}
