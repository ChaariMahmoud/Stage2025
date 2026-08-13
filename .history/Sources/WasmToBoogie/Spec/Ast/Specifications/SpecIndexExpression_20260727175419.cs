namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecIndexExpression(
        SpecExpression Target,
        SpecExpression Index
    ) : SpecExpression;
}