using System;
using System.Collections.Generic;
using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;

namespace WasmToBoogie.Parser.Ast
{
    public sealed class ModuleSpec
    {
        /*
         * Invariants globaux du module.
         */
        public List<SpecDirective> GlobalInvariants { get; } = new();

        /*
         * Contrats attachés aux fonctions.
         *
         * La clé conserve le nom WAT avec le '$',
         * par exemple "$acquire_request".
         */
        public Dictionary<string, List<SpecDirective>> RequiresByFunc { get; }
            = new();

        public Dictionary<string, List<SpecDirective>> EnsuresByFunc { get; }
            = new();

        /*
         * Directives placées dans le corps du programme :
         *
         *   @assert
         *   @assume
         *   @invariant
         *
         * Pour le moment, elles sont seulement collectées avec leur
         * position source. L'injection dans l'AST WAT viendra ensuite.
         */
        public List<SpecDirective> InlineDirectives { get; } = new();

        public void AddRequires(
            string functionName,
            SpecDirective directive)
        {
            ArgumentNullException.ThrowIfNull(functionName);
            ArgumentNullException.ThrowIfNull(directive);

            if (directive.Kind != SpecDirectiveKind.Requires)
            {
                throw new ArgumentException(
                    $"Expected a Requires directive, but received " +
                    $"{directive.Kind}.",
                    nameof(directive)
                );
            }

            if (!RequiresByFunc.TryGetValue(
                    functionName,
                    out List<SpecDirective>? directives))
            {
                directives = new List<SpecDirective>();
                RequiresByFunc[functionName] = directives;
            }

            directives.Add(directive);
        }

        public void AddEnsures(
            string functionName,
            SpecDirective directive)
        {
            ArgumentNullException.ThrowIfNull(functionName);
            ArgumentNullException.ThrowIfNull(directive);

            if (directive.Kind != SpecDirectiveKind.Ensures)
            {
                throw new ArgumentException(
                    $"Expected an Ensures directive, but received " +
                    $"{directive.Kind}.",
                    nameof(directive)
                );
            }

            if (!EnsuresByFunc.TryGetValue(
                    functionName,
                    out List<SpecDirective>? directives))
            {
                directives = new List<SpecDirective>();
                EnsuresByFunc[functionName] = directives;
            }

            directives.Add(directive);
        }

        public void AddInlineDirective(SpecDirective directive)
        {
            ArgumentNullException.ThrowIfNull(directive);

            if (directive.Kind is not (
                    SpecDirectiveKind.Assert
                    or SpecDirectiveKind.Assume
                    or SpecDirectiveKind.LoopInvariant))
            {
                throw new ArgumentException(
                    $"Directive {directive.Kind} is not an inline directive.",
                    nameof(directive)
                );
            }

            InlineDirectives.Add(directive);
        }

        public void PrettyPrint()
        {
            Console.WriteLine();
            Console.WriteLine(
                "========================================================="
            );
            Console.WriteLine(
                "                SafeWasm Specifications"
            );
            Console.WriteLine(
                "========================================================="
            );

            PrintGlobalInvariants();
            PrintFunctionContracts();
            PrintInlineDirectives();

            Console.WriteLine();
            Console.WriteLine(
                "========================================================="
            );
            Console.WriteLine();
        }

        private void PrintGlobalInvariants()
        {
            if (GlobalInvariants.Count == 0)
                return;

            Console.WriteLine();
            Console.WriteLine("Global invariants:");

            for (int i = 0; i < GlobalInvariants.Count; i++)
            {
                SpecDirective directive = GlobalInvariants[i];

                Console.WriteLine(
                    $"  [{i + 1}] " +
                    SpecAstPrinter.Print(directive.Expression)
                );

                Console.WriteLine(
                    $"      line {directive.Location.Line}, " +
                    $"column {directive.Location.Column}"
                );
            }
        }

        private void PrintFunctionContracts()
        {
            var functionNames = new HashSet<string>();

            foreach (string name in RequiresByFunc.Keys)
                functionNames.Add(name);

            foreach (string name in EnsuresByFunc.Keys)
                functionNames.Add(name);

            foreach (string functionName in functionNames)
            {
                Console.WriteLine();
                Console.WriteLine($"Function: {functionName}");

                if (RequiresByFunc.TryGetValue(
                        functionName,
                        out List<SpecDirective>? requires))
                {
                    Console.WriteLine("  Requires:");

                    foreach (SpecDirective directive in requires)
                    {
                        Console.WriteLine(
                            $"    - " +
                            SpecAstPrinter.Print(directive.Expression)
                        );
                    }
                }

                if (EnsuresByFunc.TryGetValue(
                        functionName,
                        out List<SpecDirective>? ensures))
                {
                    Console.WriteLine("  Ensures:");

                    foreach (SpecDirective directive in ensures)
                    {
                        Console.WriteLine(
                            $"    - " +
                            SpecAstPrinter.Print(directive.Expression)
                        );
                    }
                }
            }
        }

        private void PrintInlineDirectives()
        {
            if (InlineDirectives.Count == 0)
                return;

            Console.WriteLine();
            Console.WriteLine("Inline directives:");

            foreach (SpecDirective directive in InlineDirectives)
            {
                Console.WriteLine(
                    $"  line {directive.Location.Line}: " +
                    $"{directive.Kind} " +
                    SpecAstPrinter.Print(directive.Expression)
                );
            }
        }
    }
}