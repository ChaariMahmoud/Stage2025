using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class ExpressionParsingTests
    {
        [Fact]
        public void ParseComparison_ReturnsExpectedExpression()
        {
            var directive = SpecParser.Parse(
                "@assert current >= 0"
            );

            Assert.Equal(
                "(current >= 0)",
                SpecAstPrinter.Print(directive.Expression)
            );
        }

        [Fact]
        public void ParseArithmeticExpression_RespectsPrecedence()
        {
            var directive = SpecParser.Parse(
                "@assert x + 2 * y == 10"
            );

            Assert.Equal(
                "((x + (2 * y)) == 10)",
                SpecAstPrinter.Print(directive.Expression)
            );
        }

        [Fact]
        public void ParseLogicalExpression_RespectsPrecedence()
        {
            var directive = SpecParser.Parse(
                "@assert x == 0 || y == 1 && z == 2"
            );

            Assert.Equal(
                "((x == 0) || ((y == 1) && (z == 2)))",
                SpecAstPrinter.Print(directive.Expression)
            );
        }

        [Fact]
        public void ParseParentheses_ChangesPrecedence()
        {
            var directive = SpecParser.Parse(
                "@assert (x + 2) * y == 10"
            );

            Assert.Equal(
                "(((x + 2) * y) == 10)",
                SpecAstPrinter.Print(directive.Expression)
            );
        }
    }
}