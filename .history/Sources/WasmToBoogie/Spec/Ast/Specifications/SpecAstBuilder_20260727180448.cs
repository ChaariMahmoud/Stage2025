using System;
using System.Globalization;
using WasmToBoogie.Spec.Ast.Specifications;

namespace WasmToBoogie.Spec.Specifications
{
    public sealed class SpecAstBuilder
        : SafeWasmSpecBaseVisitor<SpecExpression>
    {
        public override SpecExpression VisitIntegerExpression(
            SafeWasmSpecParser.IntegerExpressionContext context)
        {
            string text = context.INTEGER().GetText();

            if (!long.TryParse(
                    text,
                    NumberStyles.None,
                    CultureInfo.InvariantCulture,
                    out long value))
            {
                throw new FormatException(
                    $"Invalid integer literal '{text}'."
                );
            }

            return new SpecIntegerExpression(value);
        }

        public override SpecExpression VisitTrueExpression(
            SafeWasmSpecParser.TrueExpressionContext context)
        {
            return new SpecBooleanExpression(true);
        }

        public override SpecExpression VisitFalseExpression(
            SafeWasmSpecParser.FalseExpressionContext context)
        {
            return new SpecBooleanExpression(false);
        }

        public override SpecExpression VisitIdentifierExpression(
            SafeWasmSpecParser.IdentifierExpressionContext context)
        {
            string name = context.identifier().GetText();

            // On normalise "$active_requests" vers "active_requests".
            if (name.StartsWith('$'))
                name = name[1..];

            return new SpecIdentifierExpression(name);
        }

        public override SpecExpression VisitResultExpression(
            SafeWasmSpecParser.ResultExpressionContext context)
        {
            return new SpecResultExpression();
        }

        public override SpecExpression VisitOldExpression(
            SafeWasmSpecParser.OldExpressionContext context)
        {
            SpecExpression expression = Visit(context.expression());

            return new SpecOldExpression(expression);
        }

        public override SpecExpression VisitParenthesizedExpression(
            SafeWasmSpecParser.ParenthesizedExpressionContext context)
        {
            return Visit(context.expression());
        }

        public override SpecExpression VisitLogicalNotExpression(
            SafeWasmSpecParser.LogicalNotExpressionContext context)
        {
            return new SpecUnaryExpression(
                SpecUnaryOperator.LogicalNot,
                Visit(context.unaryExpression())
            );
        }

        public override SpecExpression VisitNegationExpression(
            SafeWasmSpecParser.NegationExpressionContext context)
        {
            return new SpecUnaryExpression(
                SpecUnaryOperator.Negate,
                Visit(context.unaryExpression())
            );
        }

public override SpecExpression VisitPostfixUnaryExpression(
    SafeWasmSpecParser.PostfixUnaryExpressionContext context)
{
    return Visit(context.postfixExpression());
}

public override SpecExpression VisitPostfixExpression(
    SafeWasmSpecParser.PostfixExpressionContext context)
{
    SpecExpression result =
        Visit(context.primaryExpression());

    foreach (
        SafeWasmSpecParser.PostfixOperationContext operation
        in context.postfixOperation())
    {
        switch (operation)
        {
            case SafeWasmSpecParser.IndexPostfixOperationContext index:
                result = new SpecIndexExpression(
                    result,
                    Visit(index.expression())
                );
                break;

            case SafeWasmSpecParser.FieldPostfixOperationContext field:
                result = new SpecFieldAccessExpression(
                    result,
                    field.identifier().GetText()
                );
                break;

            default:
                throw new InvalidOperationException(
                    $"Unsupported postfix operation: " +
                    $"{operation.GetType().Name}"
                );
        }
    }

    return result;
}

        public override SpecExpression VisitMultiplicativeExpression(
            SafeWasmSpecParser.MultiplicativeExpressionContext context)
        {
            SpecExpression result = Visit(context.unaryExpression(0));

            for (int i = 1; i < context.unaryExpression().Length; i++)
            {
                string op = context.GetChild((i * 2) - 1).GetText();
                SpecExpression right = Visit(context.unaryExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    ParseMultiplicativeOperator(op),
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitAdditiveExpression(
            SafeWasmSpecParser.AdditiveExpressionContext context)
        {
            SpecExpression result =
                Visit(context.multiplicativeExpression(0));

            for (int i = 1;
                 i < context.multiplicativeExpression().Length;
                 i++)
            {
                string op = context.GetChild((i * 2) - 1).GetText();

                SpecExpression right =
                    Visit(context.multiplicativeExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    ParseAdditiveOperator(op),
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitRelationalExpression(
            SafeWasmSpecParser.RelationalExpressionContext context)
        {
            SpecExpression result =
                Visit(context.additiveExpression(0));

            for (int i = 1;
                 i < context.additiveExpression().Length;
                 i++)
            {
                string op = context.GetChild((i * 2) - 1).GetText();

                SpecExpression right =
                    Visit(context.additiveExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    ParseRelationalOperator(op),
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitEqualityExpression(
            SafeWasmSpecParser.EqualityExpressionContext context)
        {
            SpecExpression result =
                Visit(context.relationalExpression(0));

            for (int i = 1;
                 i < context.relationalExpression().Length;
                 i++)
            {
                string op = context.GetChild((i * 2) - 1).GetText();

                SpecExpression right =
                    Visit(context.relationalExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    ParseEqualityOperator(op),
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitLogicalAndExpression(
            SafeWasmSpecParser.LogicalAndExpressionContext context)
        {
            SpecExpression result =
                Visit(context.equalityExpression(0));

            for (int i = 1;
                 i < context.equalityExpression().Length;
                 i++)
            {
                SpecExpression right =
                    Visit(context.equalityExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    SpecBinaryOperator.LogicalAnd,
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitLogicalOrExpression(
            SafeWasmSpecParser.LogicalOrExpressionContext context)
        {
            SpecExpression result =
                Visit(context.logicalAndExpression(0));

            for (int i = 1;
                 i < context.logicalAndExpression().Length;
                 i++)
            {
                SpecExpression right =
                    Visit(context.logicalAndExpression(i));

                result = new SpecBinaryExpression(
                    result,
                    SpecBinaryOperator.LogicalOr,
                    right
                );
            }

            return result;
        }

        public override SpecExpression VisitExpression(
            SafeWasmSpecParser.ExpressionContext context)
        {
            return Visit(context.logicalOrExpression());
        }

        private static SpecBinaryOperator ParseMultiplicativeOperator(
            string op)
        {
            return op switch
            {
                "*" => SpecBinaryOperator.Multiply,
                "/" => SpecBinaryOperator.Divide,
                "%" => SpecBinaryOperator.Modulo,

                _ => throw new InvalidOperationException(
                    $"Unsupported multiplicative operator '{op}'."
                )
            };
        }

        private static SpecBinaryOperator ParseAdditiveOperator(string op)
        {
            return op switch
            {
                "+" => SpecBinaryOperator.Add,
                "-" => SpecBinaryOperator.Subtract,

                _ => throw new InvalidOperationException(
                    $"Unsupported additive operator '{op}'."
                )
            };
        }

        private static SpecBinaryOperator ParseRelationalOperator(string op)
        {
            return op switch
            {
                "<"  => SpecBinaryOperator.LessThan,
                "<=" => SpecBinaryOperator.LessThanOrEqual,
                ">"  => SpecBinaryOperator.GreaterThan,
                ">=" => SpecBinaryOperator.GreaterThanOrEqual,

                _ => throw new InvalidOperationException(
                    $"Unsupported relational operator '{op}'."
                )
            };
        }

        private static SpecBinaryOperator ParseEqualityOperator(string op)
        {
            return op switch
            {
                "==" => SpecBinaryOperator.Equal,
                "!=" => SpecBinaryOperator.NotEqual,

                _ => throw new InvalidOperationException(
                    $"Unsupported equality operator '{op}'."
                )
            };
        }
    }
}