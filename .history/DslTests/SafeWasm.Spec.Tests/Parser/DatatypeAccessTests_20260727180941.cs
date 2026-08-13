using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class DatatypeAccessTests
    {
        [Fact]
        public void ParseIndexExpression_ReturnsIndexNode()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert $stack[$sp] == 0"
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecIndexExpression index =
                Assert.IsType<SpecIndexExpression>(
                    equality.Left
                );

            SpecIdentifierExpression target =
                Assert.IsType<SpecIdentifierExpression>(
                    index.Target
                );

            SpecIdentifierExpression indexExpression =
                Assert.IsType<SpecIdentifierExpression>(
                    index.Index
                );

            Assert.Equal("stack", target.Name);
            Assert.Equal("sp", indexExpression.Name);
        }

        [Fact]
        public void ParseFieldAccess_ReturnsFieldAccessNode()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert value.value_i32 == 3"
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecFieldAccessExpression field =
                Assert.IsType<SpecFieldAccessExpression>(
                    equality.Left
                );

            SpecIdentifierExpression target =
                Assert.IsType<SpecIdentifierExpression>(
                    field.Target
                );

            Assert.Equal("value", target.Name);
            Assert.Equal("value_i32", field.FieldName);
        }

        [Fact]
        public void ParseIndexedDatatypeField_ReturnsNestedAst()
        {
            SpecDirective directive = SpecParser.Parse(
                "@ensures $stack[old($sp)].value_i32 == 3"
            );

            Assert.Equal(
                "(stack[old(sp)].value_i32 == 3)",
                SpecAstPrinter.Print(directive.Expression)
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecFieldAccessExpression field =
                Assert.IsType<SpecFieldAccessExpression>(
                    equality.Left
                );

            Assert.Equal("value_i32", field.FieldName);

            SpecIndexExpression index =
                Assert.IsType<SpecIndexExpression>(
                    field.Target
                );

            SpecIdentifierExpression stack =
                Assert.IsType<SpecIdentifierExpression>(
                    index.Target
                );

            Assert.Equal("stack", stack.Name);

            SpecOldExpression old =
                Assert.IsType<SpecOldExpression>(
                    index.Index
                );

            SpecIdentifierExpression sp =
                Assert.IsType<SpecIdentifierExpression>(
                    old.Expression
                );

            Assert.Equal("sp", sp.Name);
        }

        [Fact]
        public void ParseMultipleIndexes_ReturnsNestedIndexNodes()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert memory[i][j] == 0"
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecIndexExpression outerIndex =
                Assert.IsType<SpecIndexExpression>(
                    equality.Left
                );

            SpecIndexExpression innerIndex =
                Assert.IsType<SpecIndexExpression>(
                    outerIndex.Target
                );

            Assert.Equal(
                "memory[i][j]",
                SpecAstPrinter.Print(outerIndex)
            );

            Assert.IsType<SpecIdentifierExpression>(
                innerIndex.Target
            );
        }

        [Fact]
        public void ParseMultipleFields_ReturnsNestedFieldNodes()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert object.inner.value_i32 == 3"
            );

            SpecBinaryExpression equality =
                Assert.IsType<SpecBinaryExpression>(
                    directive.Expression
                );

            SpecFieldAccessExpression valueField =
                Assert.IsType<SpecFieldAccessExpression>(
                    equality.Left
                );

            Assert.Equal("value_i32", valueField.FieldName);

            SpecFieldAccessExpression innerField =
                Assert.IsType<SpecFieldAccessExpression>(
                    valueField.Target
                );

            Assert.Equal("inner", innerField.FieldName);

            Assert.Equal(
                "object.inner.value_i32",
                SpecAstPrinter.Print(valueField)
            );
        }

        [Fact]
        public void ParseIndexAfterField_ReturnsNestedExpression()
        {
            SpecDirective directive = SpecParser.Parse(
                "@assert object.values[i].value_i32 >= 0"
            );

            Assert.Equal(
                "(object.values[i].value_i32 >= 0)",
                SpecAstPrinter.Print(directive.Expression)
            );
        }
    }
}