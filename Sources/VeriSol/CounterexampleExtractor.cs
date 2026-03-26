namespace VeriSolRunner
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Text.RegularExpressions;

    internal class CounterexampleExtractor
    {
        private readonly string corralOutputFile;
        private readonly string boogieFile;
        private readonly string summaryFile;

        public CounterexampleExtractor(
            string corralOutputFile = "corral.txt",
            string boogieFile = "",
            string summaryFile = "counterexample_summary.txt"
        )
        {
            this.corralOutputFile = corralOutputFile;
            this.boogieFile = boogieFile;
            this.summaryFile = summaryFile;
        }

        public void GenerateSummary(bool printToConsole = true)
        {
            if (!File.Exists(corralOutputFile))
            {
                Console.WriteLine("⚠️ corral.txt not found, cannot build counterexample summary.");
                return;
            }

            var lines = File.ReadAllLines(corralOutputFile);

            string file = string.IsNullOrWhiteSpace(boogieFile) ? "unknown" : boogieFile;
            string lineNo = "unknown";
            string failingProcedure = "unknown";
            string failingCall = "unknown";
            string reason = "assertion failure";

            var transactionSequence = new List<string>();

            foreach (var line in lines)
            {
                var errMatch = Regex.Match(
                    line,
                    @"(?<file>BoogieOutputs/[^\s]+\.bpl)\((?<line>\d+),\d+\): error PF5001: This assertion can fail"
                );

                if (errMatch.Success)
                {
                    file = errMatch.Groups["file"].Value;
                    lineNo = errMatch.Groups["line"].Value;
                    break;
                }
            }

            foreach (var line in lines)
            {
                var callMatch = Regex.Match(line, @"\(CALL\s+(?<func>[A-Za-z0-9_]+)\)");
                if (callMatch.Success)
                {
                    string func = callMatch.Groups["func"].Value.Trim();

                    if (ShouldKeepInTransactionSequence(func))
                    {
                        transactionSequence.Add(func);
                    }
                }
            }

            if (transactionSequence.Count > 0)
            {
                failingProcedure = transactionSequence[transactionSequence.Count - 1];
            }

            foreach (var line in lines)
            {
                if (line.Contains("ASSERTION FAILS"))
                {
                    reason = "assertion failure";

                    var callFailMatch = Regex.Match(
                        line,
                        @"ASSERTION FAILS\s+call\s+(?<call>.+?)\s*: Ensures"
                    );
                    if (callFailMatch.Success)
                    {
                        failingCall = callFailMatch.Groups["call"].Value.Trim();
                        break;
                    }

                    var callFailMatch2 = Regex.Match(
                        line,
                        @"ASSERTION FAILS\s+call\s+(?<call>.+)$"
                    );
                    if (callFailMatch2.Success)
                    {
                        failingCall = callFailMatch2.Groups["call"].Value.Trim();
                        break;
                    }
                }
            }

            if (failingCall == "unknown" && lineNo != "unknown" && File.Exists(file))
            {
                try
                {
                    var boogieLines = File.ReadAllLines(file);
                    if (int.TryParse(lineNo, out int ln))
                    {
                        int index = ln - 1;
                        if (index >= 0 && index < boogieLines.Length)
                        {
                            failingCall = boogieLines[index].Trim();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"⚠️ Failed to read failing call from {file}: {ex.Message}");
                }
            }

            var summaryLines = new List<string>
            {
                "=== Counterexample Summary ===",
                $"File: {file}",
                $"Line: {lineNo}",
                $"Failing procedure: {failingProcedure}",
                $"Failing call: {failingCall}",
                $"Reason: {reason}",
                $"Transaction sequence: {(transactionSequence.Count > 0 ? string.Join(" -> ", transactionSequence) : "unknown")}",
                "",
                "        See raw Corral output inside corral.txt"
            };

            File.WriteAllLines(summaryFile, summaryLines);

            if (printToConsole)
            {
                Console.WriteLine();
                foreach (var line in summaryLines)
                {
                    Console.WriteLine(line);
                }
                Console.WriteLine();
            }

            Console.WriteLine($"📝 Counterexample summary written to {summaryFile}");
        }

        private bool ShouldKeepInTransactionSequence(string func)
        {
            if (string.IsNullOrWhiteSpace(func))
                return false;

            return !func.StartsWith("CorralChoice_")
                && !func.StartsWith("CorralEntry_")
                && !func.StartsWith("BoogieEntry_")
                && !func.StartsWith("InitRuntime")
                && !func.StartsWith("initGlobals")
                && !func.StartsWith("push")
                && !func.StartsWith("pop")
                && !func.StartsWith("popToTmp")
                && !func.StartsWith("popArgs")
                && !func.StartsWith("popDiscard")
                && !func.StartsWith("boogie_si_");
        }
    }
}