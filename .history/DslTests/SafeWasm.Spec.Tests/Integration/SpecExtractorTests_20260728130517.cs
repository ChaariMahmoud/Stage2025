using WasmToBoogie.Parser;
using WasmToBoogie.Parser.Ast;
using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Integration
{
    public sealed class SpecExtractorTests
    {
        private const string Wat = """
            (module
              (;@inv 0 <= active_requests &&
                       active_requests <= MAX_REQUESTS;)

              (global $MAX_REQUESTS i32 (i32.const 10))
              (global $active_requests (mut i32) (i32.const 0))

              (;@requires active_requests >= 0;)
              (;@ensures result == 0 || result == 1;)

              (func $acquire_request (result i32)
                (local $current i32)

                (local.set $current
                  (global.get $active_requests)
                )

                (;@assert current >= 0;)
                (;@assume current <= MAX_REQUESTS;)

                (i32.const 1)
              )
            )
            """;

        [Fact]
        public void ExtractFromWat_ExtractsGlobalInvariant()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            SpecDirective invariant = Assert.Single(moduleSpec.GlobalInvariants);

            Assert.Equal(SpecDirectiveKind.GlobalInvariant, invariant.Kind);

            Assert.Equal(
                "((0 <= active_requests) && " + "(active_requests <= MAX_REQUESTS))",
                SpecAstPrinter.Print(invariant.Expression)
            );
        }

        [Fact]
        public void ExtractFromWat_AttachesRequiresToFunction()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            Assert.True(moduleSpec.RequiresByFunc.ContainsKey("$acquire_request"));

            SpecDirective requires = Assert.Single(moduleSpec.RequiresByFunc["$acquire_request"]);

            Assert.Equal(SpecDirectiveKind.Requires, requires.Kind);

            Assert.Equal("(active_requests >= 0)", SpecAstPrinter.Print(requires.Expression));
        }

        [Fact]
        public void ExtractFromWat_AttachesEnsuresToFunction()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            SpecDirective ensures = Assert.Single(moduleSpec.EnsuresByFunc["$acquire_request"]);

            Assert.Equal(SpecDirectiveKind.Ensures, ensures.Kind);

            Assert.Equal(
                "((result == 0) || (result == 1))",
                SpecAstPrinter.Print(ensures.Expression)
            );
        }

        [Fact]
        public void ExtractFromWat_CollectsAssertAndAssume()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            Assert.Equal(2, moduleSpec.InlineDirectives.Count);

            Assert.Equal(SpecDirectiveKind.Assert, moduleSpec.InlineDirectives[0].Kind);

            Assert.Equal(SpecDirectiveKind.Assume, moduleSpec.InlineDirectives[1].Kind);
        }

        [Fact]
        public void ExtractFromWat_PreservesInlineOrder()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            SpecDirective assertDirective = moduleSpec.InlineDirectives[0];

            SpecDirective assumeDirective = moduleSpec.InlineDirectives[1];

            Assert.True(assertDirective.Location.StartIndex < assumeDirective.Location.StartIndex);
        }

        [Fact]
        public void ExtractFromWat_PreservesSourceLocations()
        {
            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(Wat, strict: true);

            foreach (SpecDirective directive in moduleSpec.InlineDirectives)
            {
                Assert.True(directive.Location.Line > 0);
                Assert.True(directive.Location.Column >= 0);
                Assert.True(directive.Location.StartIndex >= 0);
                Assert.True(directive.Location.Length > 0);
            }
        }

        [Fact]
        public void ExtractFromWat_ParsesDatatypeAccess()
        {
            const string wat = """
                (module
                  (;@ensures $stack[old($sp)].value_i32 == 3;)

                  (func $get_result (result i32)
                    (i32.const 3)
                  )
                )
                """;

            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(wat, strict: true);

            SpecDirective ensures = Assert.Single(moduleSpec.EnsuresByFunc["$get_result"]);

            Assert.Equal(
                "(stack[old(sp)].value_i32 == 3)",
                SpecAstPrinter.Print(ensures.Expression)
            );

            SpecBinaryExpression equality = Assert.IsType<SpecBinaryExpression>(ensures.Expression);

            SpecFieldAccessExpression field = Assert.IsType<SpecFieldAccessExpression>(
                equality.Left
            );

            Assert.Equal("value_i32", field.FieldName);

            Assert.IsType<SpecIndexExpression>(field.Target);
        }

        [Fact]
        public void ExtractFromWat_AttachesContractsToCorrectFunctions()
        {
            const string wat = """
                (module
                  (;@requires x >= 0;)
                  (;@ensures result >= 0;)
                  (func $first (param $x i32) (result i32)
                    (local.get $x)
                  )

                  (;@requires y <= 10;)
                  (;@ensures result <= 10;)
                  (func $second (param $y i32) (result i32)
                    (local.get $y)
                  )
                )
                """;

            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(wat, strict: true);

            Assert.Single(moduleSpec.RequiresByFunc["$first"]);

            Assert.Single(moduleSpec.EnsuresByFunc["$first"]);

            Assert.Single(moduleSpec.RequiresByFunc["$second"]);

            Assert.Single(moduleSpec.EnsuresByFunc["$second"]);

            Assert.Equal(
                "(x >= 0)",
                SpecAstPrinter.Print(moduleSpec.RequiresByFunc["$first"][0].Expression)
            );

            Assert.Equal(
                "(y <= 10)",
                SpecAstPrinter.Print(moduleSpec.RequiresByFunc["$second"][0].Expression)
            );
        }

        [Fact]
        public void ExtractFromWat_StrictModeRejectsInvalidSpecification()
        {
            const string wat = """
                (module
                  (;@requires x + <= 10;)

                  (func $invalid
                    nop
                  )
                )
                """;

            Assert.Throws<InvalidOperationException>(() =>
                SpecExtractor.ExtractFromWat(wat, strict: true)
            );
        }

        [Fact]
        public void ExtractFromWat_NonStrictModeIgnoresInvalidSpecification()
        {
            const string wat = """
                (module
                  (;@requires x + <= 10;)

                  (func $invalid
                    nop
                  )
                )
                """;

            ModuleSpec moduleSpec = SpecExtractor.ExtractFromWat(wat, strict: false);

            Assert.Empty(moduleSpec.RequiresByFunc);
        }
    }
}
