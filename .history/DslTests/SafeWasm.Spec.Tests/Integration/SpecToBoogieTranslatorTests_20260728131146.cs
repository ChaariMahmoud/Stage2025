using WasmToBoogie.Conversion;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Integration
{
    public sealed class SpecToBoogieTranslatorTests
    {
        private static SpecToBoogieTranslator CreateTranslator()
        {
            return new SpecToBoogieTranslator(
                name => name switch
                {
                    "stack" => "$stack",
                    "sp" => "$sp",
                    "active_requests" => "$active_requests",
                    "MAX_REQUESTS" => "$MAX_REQUESTS",
                    "result" => "$result",
                    _ => "$" + name
                }
            );
        }

        [Fact]
        public void TranslateIntegerComparison_Succeeds()
        {
            var directive = SpecParser.Parse(
                "@assert active_requests >= 0"
            );

            var expression =
                CreateTranslator().Translate(directive);

            Assert.NotNull(expression);
        }

        [Fact]
        public void TranslateLogicalExpression_Succeeds()
        {
            var directive = SpecParser.Parse(
                "@assert active_requests >= 0 && " +
                "active_requests <= MAX_REQUESTS"
            );

            var expression =
                CreateTranslator().Translate(directive);

            Assert.NotNull(expression);
        }

        [Fact]
        public void TranslateUnaryExpressions_Succeeds()
        {
            var negative = SpecParser.Parse(
                "@assert -x < 0"
            );

            var logicalNot = SpecParser.Parse(
                "@assert !(x == 0)"
            );

            var translator = CreateTranslator();

            Assert.NotNull(
                translator.Translate(negative)
            );

            Assert.NotNull(
                translator.Translate(logicalNot)
            );
        }

        [Fact]
        public void TranslateOldExpression_Succeeds()
        {
            var directive = SpecParser.Parse(
                "@ensures x == old(x) + 1"
            );

            var expression =
                CreateTranslator().Translate(directive);

            Assert.NotNull(expression);
        }

        [Fact]
        public void TranslateIndexedDatatypeField_Succeeds()
        {
            var directive = SpecParser.Parse(
                "@ensures $stack[old($sp)].value_i32 == 3"
            );

            var expression =
                CreateTranslator().Translate(directive);

            Assert.NotNull(expression);
        }
    }
}