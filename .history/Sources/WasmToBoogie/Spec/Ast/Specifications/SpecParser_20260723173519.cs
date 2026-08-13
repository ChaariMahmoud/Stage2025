using System;
using Antlr4.Runtime;
using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Generated;
using Antlr4.Runtime.Misc;

namespace WasmToBoogie.Spec.Specifications
{
    public static class SpecSpec
    {
        public static SpecDirective Parse(
            string directiveText,
            int sourceLine = 1,
            int sourceColumn = 0,
            int sourceIndex = 0)
        {
            if (string.IsNullOrWhiteSpace(directiveText))
            {
                throw new ArgumentException(
                    "The specification cannot be empty.",
                    nameof(directiveText)
                );
            }

            var inputStream = new AntlrInputStream(directiveText);

            var lexer = new SafeWasmSpecLexer(inputStream);
            lexer.RemoveErrorListeners();
            lexer.AddErrorListener(SpecErrorListener.Instance);

            var tokenStream = new CommonTokenStream(lexer);

            var parser = new SafeWasmSpecSpec(tokenStream);
            parser.RemoveErrorListeners();
            parser.AddErrorListener(SpecErrorListener.Instance);

            // Empêche ANTLR de tenter de continuer silencieusement
            // après certaines erreurs.
            parser.ErrorHandler = new BailErrorStrategy();

            SafeWasmSpecSpec.SpecificationContext tree;

            try
            {
                tree = parser.specification();
            }
            catch (ParseCanceledException ex)
            {
                throw new SpecSyntaxException(
                    sourceLine,
                    sourceColumn,
                    ex.InnerException?.Message ?? ex.Message
                );
            }

            var builder = new SpecAstBuilder();

            SpecExpression expression;
            SpecDirectiveKind kind;

            switch (tree.directive())
            {
                case SafeWasmSpecSpec.RequiresDirectiveContext ctx:
                    kind = SpecDirectiveKind.Requires;
                    expression = builder.Visit(ctx.expression());
                    break;

                case SafeWasmSpecSpec.EnsuresDirectiveContext ctx:
                    kind = SpecDirectiveKind.Ensures;
                    expression = builder.Visit(ctx.expression());
                    break;

                case SafeWasmSpecSpec.GlobalInvariantDirectiveContext ctx:
                    kind = SpecDirectiveKind.GlobalInvariant;
                    expression = builder.Visit(ctx.expression());
                    break;

                case SafeWasmSpecSpec.InvariantDirectiveContext ctx:
                    kind = SpecDirectiveKind.LoopInvariant;
                    expression = builder.Visit(ctx.expression());
                    break;

                case SafeWasmSpecSpec.AssertDirectiveContext ctx:
                    kind = SpecDirectiveKind.Assert;
                    expression = builder.Visit(ctx.expression());
                    break;

                case SafeWasmSpecSpec.AssumeDirectiveContext ctx:
                    kind = SpecDirectiveKind.Assume;
                    expression = builder.Visit(ctx.expression());
                    break;

                default:
                    throw new InvalidOperationException(
                        "Unknown specification directive."
                    );
            }

            var location = new SourceLocation(
                sourceLine,
                sourceColumn,
                sourceIndex,
                directiveText.Length
            );

            return new SpecDirective(
                kind,
                expression,
                location,
                directiveText
            );
        }
    }
}