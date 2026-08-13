namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecIntegerExpression(
        long Value
    ) : SpecExpression;
}