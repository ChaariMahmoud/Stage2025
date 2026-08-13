namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecDirective(
        SpecDirectiveKind Kind,
        SpecExpression Expression,
        SourceLocation Location,
        string OriginalText
    );
}