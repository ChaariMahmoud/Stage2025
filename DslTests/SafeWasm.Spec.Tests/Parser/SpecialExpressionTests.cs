using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class SpecialExpressionTests
    {
        [Fact]
        public void ParseResultExpression_ReturnsResultNode()
        {
            SpecDirective directive = SpecParser.Parse(
                "@ensures result >= 0"
            );

            SpecBinaryExpression comparison =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            Assert.IsType<SpecResultExpression>(
                comparison.Left
            );

            Assert.Equal(
                SpecBinaryOperator.GreaterThanOrEqual,
                comparison.Operator
            );
        }

        [Fact]
        public void ParseOldExpression_ReturnsOldNode()
        {
            SpecDirective directive = SpecParser.Parse(
                "@ensures x == old(x) + 1"
            );

            Assert.Equal(
                "(x == (old(x) + 1))",
                SpecAstPrinter.Print(directive.Expression)
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecBinaryExpression addition =
                Assert.IsType<SpecBinaryExpression>(
                    equality.Right
                );

            SpecOldExpression oldExpression =
                Assert.IsType<SpecOldExpression>(
                    addition.Left
                );

            SpecIdentifierExpression identifier =
                Assert.IsType<SpecIdentifierExpression>(
                    oldExpression.Expression
                );

            Assert.Equal("x", identifier.Name);
        }

        [Fact]
        public void ParseLogicalNot_ReturnsUnaryExpression()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert !(x == 0)"
            );

            SpecUnaryExpression unary =
                Assert.IsType<SpecUnaryExpression>(
                    directive.Expression
                );

            Assert.Equal(
                SpecUnaryOperator.LogicalNot,
                unary.Operator
            );

            Assert.IsType<SpecBinaryExpression>(
                unary.Operand
            );
        }

        [Fact]
        public void ParseArithmeticNegation_ReturnsUnaryExpression()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert -x < 0"
            );

            SpecBinaryExpression comparison =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecUnaryExpression unary =
                Assert.IsType<SpecUnaryExpression>(
                    comparison.Left
                );

            Assert.Equal(
                SpecUnaryOperator.Negate,
                unary.Operator
            );
        }

        [Fact]
        public void ParseDollarIdentifier_NormalizesName()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert $active_requests >= 0"
            );

            SpecBinaryExpression comparison =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecIdentifierExpression identifier =
                Assert.IsType<SpecIdentifierExpression>(
                    comparison.Left
                );

            Assert.Equal(
                "active_requests",
                identifier.Name
            );
        }

        [Fact]
        public void ParseBooleanLiterals_ReturnsBooleanNodes()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert true == false"
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecBooleanExpression left =
                Assert.IsType<SpecBooleanExpression>(
                    equality.Left
                );

            SpecBooleanExpression right =
                Assert.IsType<SpecBooleanExpression>(
                    equality.Right
                );

            Assert.True(left.Value);
            Assert.False(right.Value);
        }
    }
}