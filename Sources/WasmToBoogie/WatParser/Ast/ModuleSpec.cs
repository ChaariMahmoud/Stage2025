using System.Collections.Generic;

namespace WasmToBoogie.Parser.Ast
{
    public class ModuleSpec
    {
        // invariants globaux du module
        public List<string> GlobalInvariants { get; } = new();

        // requires/ensures par fonction (clé = nom wasm, ex: "$acquire_request")
        public Dictionary<string, List<string>> RequiresByFunc { get; } = new();
        public Dictionary<string, List<string>> EnsuresByFunc { get; } = new();

        // (optionnel pour plus tard) invariants par loop
        // public Dictionary<string, List<string>> InvariantsByLoopId { get; } = new();

        public void AddRequires(string funcName, string expr)
        {
            if (!RequiresByFunc.TryGetValue(funcName, out var list))
                RequiresByFunc[funcName] = list = new List<string>();
            list.Add(expr);
        }

        public void AddEnsures(string funcName, string expr)
        {
            if (!EnsuresByFunc.TryGetValue(funcName, out var list))
                EnsuresByFunc[funcName] = list = new List<string>();
            list.Add(expr);
        }

        public void PrettyPrint()
        {
            Console.WriteLine();
            Console.WriteLine("=========================================================");
            Console.WriteLine("                Wasm Specifications");
            Console.WriteLine("=========================================================");

            if (GlobalInvariants.Count > 0)
            {
                Console.WriteLine("\n📦 Global Invariants:");
                for (int i = 0; i < GlobalInvariants.Count; i++)
                {
                    Console.WriteLine($"  [{i + 1}] {GlobalInvariants[i]}");
                }
            }

            var allFuncs = new HashSet<string>();
            foreach (var k in RequiresByFunc.Keys)
                allFuncs.Add(k);
            foreach (var k in EnsuresByFunc.Keys)
                allFuncs.Add(k);

            foreach (var fn in allFuncs)
            {
                Console.WriteLine($"\n🔹 Function: {fn}");

                if (RequiresByFunc.TryGetValue(fn, out var reqs) && reqs.Count > 0)
                {
                    Console.WriteLine("   Requires:");
                    foreach (var r in reqs)
                        Console.WriteLine($"     - {r}");
                }

                if (EnsuresByFunc.TryGetValue(fn, out var enss) && enss.Count > 0)
                {
                    Console.WriteLine("   Ensures:");
                    foreach (var e in enss)
                        Console.WriteLine($"     - {e}");
                }
            }

            Console.WriteLine("\n=========================================================");
            Console.WriteLine();
        }
    }
}
