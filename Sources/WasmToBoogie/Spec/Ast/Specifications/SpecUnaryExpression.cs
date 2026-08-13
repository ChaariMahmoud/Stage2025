namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecUnaryExpression(
        SpecUnaryOperator Operator,
        SpecExpression Operand
    ) : SpecExpression;
}