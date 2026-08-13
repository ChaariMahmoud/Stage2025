using WasmToBoogie.Spec.Ast.Specifications;
using WasmToBoogie.Spec.Specifications;
using Xunit;

namespace SafeWasm.Spec.Tests.Parser
{
    public sealed class DirectiveParsingTests
    {
        [Theory]
        [InlineData(
            "@requires x >= 0",
            SpecDirectiveKind.Requires)]
        [InlineData(
            "@ensures result >= 0",
            SpecDirectiveKind.Ensures)]
        [InlineData(
            "@inv active_requests <= MAX_REQUESTS",
            SpecDirectiveKind.GlobalInvariant)]
        [InlineData(
            "@global_invariant active_requests >= 0",
            SpecDirectiveKind.GlobalInvariant)]
        [InlineData(
            "@invariant i >= 0",
            SpecDirectiveKind.LoopInvariant)]
        [InlineData(
            "@assert current >= 0",
            SpecDirectiveKind.Assert)]
        [InlineData(
            "@assume current <= MAX_REQUESTS",
            SpecDirectiveKind.Assume)]
        public void ParseDirective_ReturnsExpectedKind(
            string text,
            SpecDirectiveKind expectedKind)
        {
            SpecDirective directive = SpecParser.Parse(text);

            Assert.Equal(expectedKind, directive.Kind);
        }
    }
}