namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SourceLocation(
        int Line,
        int Column,
        int StartIndex,
        int Length
    );
}