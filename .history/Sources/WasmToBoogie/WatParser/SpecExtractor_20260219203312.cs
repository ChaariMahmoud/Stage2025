using System;
using System.Text.RegularExpressions;
using WasmToBoogie.Parser.Ast;

namespace WasmToBoogie.Parser
{
    public static class SpecExtractor
    {
        // Matches: (;@requires ...;)  (;@ensures ...;)  (;@inv ...;)
        // Works with or without spaces.
        private static readonly Regex SpecRegex = new Regex(
            @"\(\s*;\s*@(?<kind>[A-Za-z_][A-Za-z0-9_]*)\s+(?<expr>.*?)\s*;\s*\)",
            RegexOptions.Singleline | RegexOptions.Compiled
        );

        // Matches next function name: (func $name ...)
        private static readonly Regex NextFuncRegex = new Regex(
            @"\(\s*func\s+(?<name>\$[^\s\(\)]+)",
            RegexOptions.Singleline | RegexOptions.Compiled
        );

        public static ModuleSpec ExtractFromWat(string watText, bool strict = false)
        {
            var spec = new ModuleSpec();

            foreach (Match m in SpecRegex.Matches(watText))
            {
                string kind = m.Groups["kind"].Value.Trim();
                string expr = m.Groups["expr"].Value.Trim();

                if (string.IsNullOrWhiteSpace(expr))
                    continue;

                switch (kind)
                {
                    // Global invariant (module-level)
                    case "inv":
                    case "global_invariant":
                        spec.GlobalInvariants.Add(expr);
                        break;

                    // Requires / Ensures attached to the NEXT (func $name ...)
                    case "requires":
                    case "ensures":
                    {
                        string? fn = FindNextFuncName(watText, m.Index + m.Length);
                        if (fn == null)
                        {
                            if (strict)
                                throw new Exception(
                                    $"Spec @{kind} has no following (func ...). Expr: {expr}"
                                );
                            // else ignore
                            break;
                        }

                        if (kind == "requires")
                            spec.AddRequires(fn, expr);
                        else
                            spec.AddEnsures(fn, expr);

                        break;
                    }

                    // For later: loop invariants, etc.
                    case "invariant":
                        // We'll implement when we start supporting loop-level injection.
                        // For now, treat as global if you want:
                        // spec.GlobalInvariants.Add(expr);
                        break;

                    default:
                        if (strict)
                            throw new Exception($"Unknown spec directive '@{kind}'");
                        break;
                }
            }

            return spec;
        }

        private static string? FindNextFuncName(string watText, int startIndex)
        {
            var m = NextFuncRegex.Match(watText, startIndex);
            if (!m.Success)
                return null;
            return m.Groups["name"].Value.Trim(); // includes '$'
        }
    }
}
