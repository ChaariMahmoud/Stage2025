using System;
using WasmToBoogie.Spec.Ast.Specifications;

namespace WasmToBoogie.Spec.Specifications
{
    public static class SpecAstPrinter
    {
        public static string Print(SpecExpression expression)
        {
            return expression switch
            {
                SpecIntegerExpression integer =>
                    integer.Value.ToString(),

                SpecBooleanExpression boolean =>
                    boolean.Value ? "true" : "false",

                SpecIdentifierExpression identifier =>
                    identifier.Name,

                SpecResultExpression =>
                    "result",

                SpecOldExpression old =>
                    $"old({Print(old.Expression)})",

                SpecUnaryExpression unary =>
                    $"({PrintUnaryOperator(unary.Operator)}" +
                    $"{Print(unary.Operand)})",

                SpecBinaryExpression binary =>
                    $"({Print(binary.Left)} " +
                    $"{PrintBinaryOperator(binary.Operator)} " +
                    $"{Print(binary.Right)})",

                _ => throw new NotSupportedException(
                    $"Unsupported expression: " +
                    $"{expression.GetType().Name}"
                )
            };
        }

        private static string PrintUnaryOperator(
            SpecUnaryOperator op)
        {
            return op switch
            {
                SpecUnaryOperator.LogicalNot => "!",
                SpecUnaryOperator.Negate => "-",
                _ => throw new ArgumentOutOfRangeException(nameof(op))
            };
        }

        private static string PrintBinaryOperator(
            SpecBinaryOperator op)
        {
            return op switch
            {
                SpecBinaryOperator.Add => "+",
                SpecBinaryOperator.Subtract => "-",
                SpecBinaryOperator.Multiply => "*",
                SpecBinaryOperator.Divide => "/",
                SpecBinaryOperator.Modulo => "%",

                SpecBinaryOperator.Equal => "==",
                SpecBinaryOperator.NotEqual => "!=",

                SpecBinaryOperator.LessThan => "<",
                SpecBinaryOperator.LessThanOrEqual => "<=",
                SpecBinaryOperator.GreaterThan => ">",
                SpecBinaryOperator.GreaterThanOrEqual => ">=",

                SpecBinaryOperator.LogicalAnd => "&&",
                SpecBinaryOperator.LogicalOr => "||",

                _ => throw new ArgumentOutOfRangeException(nameof(op))
            };
        }
    }
}