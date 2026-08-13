using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class SourceLocationTests
    {
        [Fact]
        public void ParseDirective_PreservesSourceLocation()
        {
            const string text = "@assert x >= 0";

            SpecDirective directive = SpecParser.Parse(
                text,
                sourceLine: 12,
                sourceColumn: 8,
                sourceIndex: 250
            );

            Assert.Equal(12, directive.Location.Line);
            Assert.Equal(8, directive.Location.Column);
            Assert.Equal(250, directive.Location.StartIndex);
            Assert.Equal(text.Length, directive.Location.Length);
        }

        [Fact]
        public void ParseDirective_PreservesOriginalText()
        {
            const string text =
                "@ensures result == old(x) + 1";

            SpecDirective directive = SpecParser.Parse(text);

            Assert.Equal(text, directive.OriginalText);
        }

        [Fact]
        public void SourceLocation_AllowsComputingEndIndex()
        {
            const string text = "@assume x <= 100";

            SpecDirective directive = SpecParser.Parse(
                text,
                sourceIndex: 300
            );

            int endIndex =
                directive.Location.StartIndex +
                directive.Location.Length;

            Assert.Equal(300 + text.Length, endIndex);
        }
    }
}