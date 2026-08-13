using System;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class InvalidSpecificationTests
    {
        [Theory]
        [InlineData("@assert x + <= 10")]
        [InlineData("@requires")]
        [InlineData("@ensures result ==")]
        [InlineData("@assert (x >= 0")]
        [InlineData("@assume x &&")]
        [InlineData("@unknown x == 0")]
        public void ParseInvalidSpecification_ThrowsSyntaxException(
            string specification)
        {
            Assert.Throws<SpecSyntaxException>(
                () => SpecParser.Parse(specification)
            );
        }

        [Theory]
        [InlineData("")]
        [InlineData("   ")]
        public void ParseEmptySpecification_ThrowsArgumentException(
            string specification)
        {
            Assert.Throws<ArgumentException>(
                () => SpecParser.Parse(specification)
            );
        }

        [Fact]
        public void ParseUnexpectedIndexSyntax_ThrowsSyntaxException()
        {
            Assert.Throws<SpecSyntaxException>(
                () => SpecParser.Parse(
                    "@ensures $stack[old($sp)].value_i32 == 3"
                )
            );
        }
    }
}