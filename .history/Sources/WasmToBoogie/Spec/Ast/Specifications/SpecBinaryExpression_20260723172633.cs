namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecBinaryExpression(
        SpecExpression Left,
        SpecBinaryOperator Operator,
        SpecExpression Right
    ) : SpecExpression;
}