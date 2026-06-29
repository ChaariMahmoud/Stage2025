namespace VeriSolRunner
{using WasmToBoogie.Parser.Ast;
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.IO;
    using System.Linq;
    using System.Runtime.InteropServices;
    using Microsoft.Extensions.Logging;
    using SharedConfig;
    using SolToBoogie;
    using VeriSolRunner.ExternalTools;
    using WasmToBoogie;

    class Program
    {
        public static int Main(string[] args)
        {
            // ✅ Tool configuration and validation mode
            if (args.Length >= 1 && args[0] == "--config")
            {
                ToolPaths.PrintConfiguration();
                Console.WriteLine(ToolPaths.GetConfigurationInstructions());
                return 0;
            }

            // ✅ Tool validation mode
            if (args.Length >= 1 && args[0] == "--validate")
            {
                Console.WriteLine("🔍 Validating tool paths...");
                if (ToolPaths.ValidateTools())
                {
                    Console.WriteLine("✅ All tools are properly configured!");
                    return 0;
                }
                else
                {
                    Console.WriteLine("❌ Some tools are missing. Please check the configuration.");
                    Console.WriteLine(ToolPaths.GetConfigurationInstructions());
                    return 1;
                }
            }

            // ✅ Mode WebAssembly
            if (args.Length >= 2 && args[0] == "--wasm")
            {
                string wasmFile = args[1];
                string contractName = Path.GetFileNameWithoutExtension(wasmFile);

                bool noVerify = args.Contains("--no-verify");
                bool coverageOnly = args.Contains("--coverage-only");

                bool wasmTryProofFlag = true;
                bool wasmTryRefutation = true;



                if (noVerify)
                {
                    Console.WriteLine("🚀 Translation-only mode enabled (--no-verify)");
                    wasmTryProofFlag = false;
                    wasmTryRefutation = false;
                }

                if (coverageOnly)
{
                        Console.WriteLine("🚀 Coverage-only Mode Enabled (--coverage-only)");
                    wasmTryProofFlag = false;
                    wasmTryRefutation = false;
                                    var parser = new WasmParser(wasmFile);
var wasmModule = parser.Parse();
    var coverage = WasmCoverageAnalyzer.Analyze(wasmModule);
    WasmCoverageAnalyzer.Print(coverage);
      return 0;
}

                var wasmTranslator = new WasmToBoogieMain(wasmFile, contractName);
                var program = wasmTranslator.Translate();

                var executor = new VeriSolExecutor(
                    program,
                    contractName,
                    corralRecursionLimit: 10,
                    ignoreMethods: new HashSet<Tuple<string, string>>(),
                    tryRefutation: wasmTryRefutation,
                    tryProofFlag: wasmTryProofFlag,
                    logger: LoggerFactory
                        .Create(builder => builder.AddConsole())
                        .CreateLogger("WasmMode")
                );

                Console.WriteLine("✅ WasmToBoogieMain call successful!");
                return executor.Execute();
            }

            // ✅ Classic Solidity mode
            if (args.Length < 2)
            {
                ShowUsage();
                return 1;
            }

            ExternalToolsManager.EnsureAllExisted();

            string solidityFile,
                entryPointContractName;
            bool tryProofFlag,
                tryRefutation;
            int recursionBound;
            ILogger logger;
            HashSet<Tuple<string, string>> ignoredMethods;
            bool printTransactionSequence = false;
            TranslatorFlags translatorFlags = new TranslatorFlags();

            SolToBoogie.ParseUtils.ParseCommandLineArgs(
                args,
                out solidityFile,
                out entryPointContractName,
                out tryProofFlag,
                out tryRefutation,
                out recursionBound,
                out logger,
                out ignoredMethods,
                out printTransactionSequence,
                ref translatorFlags
            );

            var verisolExecuter = new VeriSolExecutor(
                Path.Combine(Directory.GetCurrentDirectory(), solidityFile),
                entryPointContractName,
                recursionBound,
                ignoredMethods,
                tryRefutation,
                tryProofFlag,
                logger,
                printTransactionSequence, // ✅ Argument added here too
                translatorFlags
            );

            return verisolExecuter.Execute();
        }

        private static void ShowUsage()
        {
            Console.WriteLine(
                "VeriSol Extended: Formal specification and verification tool for Solidity and WebAssembly smart contracts"
            );
            Console.WriteLine();
            Console.WriteLine("Usage:");
            Console.WriteLine(
                "  VeriSol <solidity-file.sol> <contract-name> [options]     # Solidity mode"
            );
            Console.WriteLine(
                "  VeriSol --wasm <wat-file.wat>                            # WebAssembly mode"
            );
            Console.WriteLine(
                "  VeriSol --config                                          # Show tool configuration"
            );
            Console.WriteLine(
                "  VeriSol --validate                                        # Validate tool paths"
            );
            Console.WriteLine();
            Console.WriteLine("Solidity Options:");
            Console.WriteLine(
                "   /noChk                  don't perform verification, default: false"
            );
            Console.WriteLine(
                "   /noPrf                  don't perform inductive verification, default: false"
            );
            Console.WriteLine("   /txBound:k              max transaction depth, default: 4");
            Console.WriteLine("   /noTxSeq                don't print transaction sequence");
            Console.WriteLine("   /contractInfer          perform module invariant inference");
            Console.WriteLine("   /inlineDepth:k          inline nested calls upto depth k");
            Console.WriteLine();
            Console.WriteLine("Examples:");
            Console.WriteLine("  VeriSol contract.sol MyContract");
            Console.WriteLine("  VeriSol --wasm contract.wat");
            Console.WriteLine("  VeriSol --config");
            Console.WriteLine("  VeriSol --validate");
        }
    }
}
