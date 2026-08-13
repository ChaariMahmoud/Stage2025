namespace WasmToBoogie.Spec.Ast.Specifications
{
    public sealed record SpecFieldAccessExpression(
        SpecExpression Target,
        string FieldName
    ) : SpecExpression;
}