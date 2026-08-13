using System;
using System.Text.RegularExpressions;
using WasmToBoogie.Parser.Ast;
using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;

namespace WasmToBoogie.Parser
{
    public static class SpecExtractor
    {
        /*
         * Extrait les commentaires de spécification :
         *
         *   (;@requires expression;)
         *   (;@ensures expression;)
         *   (;@inv expression;)
         *   (;@invariant expression;)
         *   (;@assert expression;)
         *   (;@assume expression;)
         *
         * Le groupe "directive" contient le texte complet :
         *
         *   @assert expression
         */
        private static readonly Regex SpecRegex = new(
            @"\(\s*;\s*(?<directive>@[A-Za-z_][A-Za-z0-9_]*\s+.*?)\s*;\s*\)",
            RegexOptions.Singleline | RegexOptions.Compiled
        );

        /*
         * Recherche une fonction WAT nommée :
         *
         *   (func $function_name ...)
         */
        private static readonly Regex NextFuncRegex = new(
            @"\(\s*func\s+(?<name>\$[^\s\(\)]+)",
            RegexOptions.Singleline | RegexOptions.Compiled
        );

        public static ModuleSpec ExtractFromWat(
            string watText,
            bool strict = false)
        {
            ArgumentNullException.ThrowIfNull(watText);

            var moduleSpec = new ModuleSpec();

            foreach (Match match in SpecRegex.Matches(watText))
            {
                string directiveText =
                    match.Groups["directive"].Value.Trim();

                if (string.IsNullOrWhiteSpace(directiveText))
                    continue;

                try
                {
                    (int line, int column) =
                        GetLineAndColumn(watText, match.Index);

                    SpecDirective directive = SpecParser.Parse(
                        directiveText,
                        sourceLine: line,
                        sourceColumn: column,
                        sourceIndex: match.Index
                    );

                    AttachDirective(
                        moduleSpec,
                        directive,
                        watText,
                        match.Index + match.Length,
                        strict
                    );
                }
                catch (Exception exception)
                {
                    if (strict)
                    {
                        throw new InvalidOperationException(
                            $"Failed to process specification at " +
                            $"character index {match.Index}: " +
                            $"{directiveText}",
                            exception
                        );
                    }

                    Console.Error.WriteLine(
                        $"Warning: ignored specification " +
                        $"'{directiveText}'. " +
                        $"Reason: {exception.Message}"
                    );
                }
            }

            /*
             * L'ordre produit par Regex.Matches est déjà l'ordre source.
             * On trie néanmoins explicitement pour garantir l'ordre.
             */
            moduleSpec.InlineDirectives.Sort(
                static (left, right) =>
                    left.Location.StartIndex.CompareTo(
                        right.Location.StartIndex
                    )
            );

            return moduleSpec;
        }

        private static void AttachDirective(
            ModuleSpec moduleSpec,
            SpecDirective directive,
            string watText,
            int positionAfterDirective,
            bool strict)
        {
            switch (directive.Kind)
            {
                case SpecDirectiveKind.GlobalInvariant:
                    moduleSpec.GlobalInvariants.Add(directive);
                    return;

                case SpecDirectiveKind.Requires:
                {
                    string? functionName = FindNextFuncName(
                        watText,
                        positionAfterDirective
                    );

                    if (functionName is null)
                    {
                        HandleMissingFunction(directive, strict);
                        return;
                    }

                    moduleSpec.AddRequires(
                        functionName,
                        directive
                    );

                    return;
                }

                case SpecDirectiveKind.Ensures:
                {
                    string? functionName = FindNextFuncName(
                        watText,
                        positionAfterDirective
                    );

                    if (functionName is null)
                    {
                        HandleMissingFunction(directive, strict);
                        return;
                    }

                    moduleSpec.AddEnsures(
                        functionName,
                        directive
                    );

                    return;
                }

                case SpecDirectiveKind.Assert:
                case SpecDirectiveKind.Assume:
                case SpecDirectiveKind.LoopInvariant:
                    moduleSpec.AddInlineDirective(directive);
                    return;

                default:
                    throw new ArgumentOutOfRangeException(
                        nameof(directive.Kind),
                        directive.Kind,
                        "Unsupported specification directive."
                    );
            }
        }

        private static void HandleMissingFunction(
            SpecDirective directive,
            bool strict)
        {
            string message =
                $"Directive {directive.Kind} at line " +
                $"{directive.Location.Line} has no following named function.";

            if (strict)
                throw new InvalidOperationException(message);

            Console.Error.WriteLine($"Warning: {message}");
        }

        private static string? FindNextFuncName(
            string watText,
            int startIndex)
        {
            Match match = NextFuncRegex.Match(
                watText,
                startIndex
            );

            if (!match.Success)
                return null;

            /*
             * Conserver le '$' pour rester compatible avec les noms
             * utilisés dans ton AST WAT.
             */
            return match.Groups["name"].Value.Trim();
        }

        private static (int Line, int Column) GetLineAndColumn(
            string text,
            int index)
        {
            int line = 1;
            int column = 0;

            for (int i = 0; i < index && i < text.Length; i++)
            {
                if (text[i] == '\n')
                {
                    line++;
                    column = 0;
                }
                else
                {
                    column++;
                }
            }

            return (line, column);
        }
    }
}