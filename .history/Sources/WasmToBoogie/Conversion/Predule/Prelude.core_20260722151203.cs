using System.Collections.Generic;
using BoogieAST;

namespace WasmToBoogie.Conversion
{
    public partial class WasmAstToBoogie
    {


private static BoogieIdentifierExpr BId(string name) =>
    new BoogieIdentifierExpr(name);

private static BoogieLiteralExpr BigIntLit(string value) =>
    new BoogieLiteralExpr(System.Numerics.BigInteger.Parse(value));

private static BoogieExpr Eq(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.EQ, a, b);

private static BoogieExpr Lt(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.LT, a, b);

private static BoogieExpr Le(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.LE, a, b);

private static BoogieExpr Ge(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.GE, a, b);

private static BoogieExpr And(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.AND, a, b);

private static BoogieExpr Imp(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.IMP, a, b);

private static BoogieExpr Sub(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.SUB, a, b);

private static BoogieExpr Fun(string name, params BoogieExpr[] args) =>
    new BoogieFunctionCall(name, args.ToList());

private static BoogieExpr Forall1(string x, BoogieExpr body) =>
    new BoogieQuantifiedExpr(
        true,
        new List<BoogieIdentifierExpr> { BId(x) },
        new List<BoogieType> { BoogieType.Int },
        body
    );

private static BoogieExpr Forall2(string x, string y, BoogieExpr body) =>
    new BoogieQuantifiedExpr(
        true,
        new List<BoogieIdentifierExpr> { BId(x), BId(y) },
        new List<BoogieType> { BoogieType.Int, BoogieType.Int },
        body
    );
private static void AddIntegerWidthAxioms(BoogieProgram p)
{
    // const TWO32: int;
    // const TWO31: int;
    // const TWO64: int;
    // const TWO63: int;
    p.Declarations.Add(new BoogieConstant(new BoogieTypedIdent("TWO32", BoogieType.Int)));
    p.Declarations.Add(new BoogieConstant(new BoogieTypedIdent("TWO31", BoogieType.Int)));
    p.Declarations.Add(new BoogieConstant(new BoogieTypedIdent("TWO64", BoogieType.Int)));
    p.Declarations.Add(new BoogieConstant(new BoogieTypedIdent("TWO63", BoogieType.Int)));

    // axiom TWO32 == 4294967296;
    p.Declarations.Add(new BoogieAxiom(Eq(BId("TWO32"), BigIntLit("4294967296"))));
    p.Declarations.Add(new BoogieAxiom(Eq(BId("TWO31"), BigIntLit("2147483648"))));
    p.Declarations.Add(new BoogieAxiom(Eq(BId("TWO64"), BigIntLit("18446744073709551616"))));
    p.Declarations.Add(new BoogieAxiom(Eq(BId("TWO63"), BigIntLit("9223372036854775808"))));

    // function to_u32(x: int) returns (int);
    p.Declarations.Add(
        new BoogieFunction(
            "to_u32",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Int))
            }
        )
    );

    // function to_u64(x: int) returns (int);
    p.Declarations.Add(
        new BoogieFunction(
            "to_u64",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Int))
            }
        )
    );

    // function is_u32(x: int) returns (bool);
    p.Declarations.Add(
        new BoogieFunction(
            "is_u32",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
            }
        )
    );

    // function is_u64(x: int) returns (bool);
    p.Declarations.Add(
        new BoogieFunction(
            "is_u64",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
            }
        )
    );

    // function i32_signed(x: int) returns (int);
    p.Declarations.Add(
        new BoogieFunction(
            "i32_signed",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Int))
            }
        )
    );

    // function i64_signed(x: int) returns (int);
    p.Declarations.Add(
        new BoogieFunction(
            "i64_signed",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Int))
            }
        )
    );

    // axiom forall x :: 0 <= to_u32(x) && to_u32(x) < TWO32
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                And(
                    Le(BigIntLit("0"), Fun("to_u32", BId("x"))),
                    Lt(Fun("to_u32", BId("x")), BId("TWO32"))
                )
            )
        )
    );

    // axiom forall x :: 0 <= to_u64(x) && to_u64(x) < TWO64
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                And(
                    Le(BigIntLit("0"), Fun("to_u64", BId("x"))),
                    Lt(Fun("to_u64", BId("x")), BId("TWO64"))
                )
            )
        )
    );

    // axiom forall x :: is_u32(x) == (0 <= x && x < TWO32)
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                Eq(
                    Fun("is_u32", BId("x")),
                    And(
                        Le(BigIntLit("0"), BId("x")),
                        Lt(BId("x"), BId("TWO32"))
                    )
                )
            )
        )
    );

    // axiom forall x :: is_u64(x) == (0 <= x && x < TWO64)
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                Eq(
                    Fun("is_u64", BId("x")),
                    And(
                        Le(BigIntLit("0"), BId("x")),
                        Lt(BId("x"), BId("TWO64"))
                    )
                )
            )
        )
    );

    // axiom forall x :: is_u32(x) ==> i32_signed(x) == if x < TWO31 then x else x - TWO32
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                Imp(
                    Fun("is_u32", BId("x")),
                    Eq(
                        Fun("i32_signed", BId("x")),
                        new BoogieITE(
                            Lt(BId("x"), BId("TWO31")),
                            BId("x"),
                            Sub(BId("x"), BId("TWO32"))
                        )
                    )
                )
            )
        )
    );

    // axiom forall x :: is_u64(x) ==> i64_signed(x) == if x < TWO63 then x else x - TWO64
    p.Declarations.Add(
        new BoogieAxiom(
            Forall1(
                "x",
                Imp(
                    Fun("is_u64", BId("x")),
                    Eq(
                        Fun("i64_signed", BId("x")),
                        new BoogieITE(
                            Lt(BId("x"), BId("TWO63")),
                            BId("x"),
                            Sub(BId("x"), BId("TWO64"))
                        )
                    )
                )
            )
        )
    );
}


        private void AddPreludeCoreGlobals(BoogieProgram program)
        {
            var wasmValueType = new BoogieCtorType("WasmValue");

            program.Declarations.Add(
                new BoogieDatatypeDecl(
                    "WasmValue",
                    new List<BoogieDatatypeConstructor>
                    {
                        new BoogieDatatypeConstructor("Undef"),
                        new BoogieDatatypeConstructor(
                            "I32",
                            new List<BoogieDatatypeField>
                            {
                                new BoogieDatatypeField("value_i32", BoogieType.Int),
                            }
                        ),
                        new BoogieDatatypeConstructor(
                            "I64",
                            new List<BoogieDatatypeField>
                            {
                                new BoogieDatatypeField("value_i64", BoogieType.Int),
                            }
                        ),
                        new BoogieDatatypeConstructor(
                            "F32",
                            new List<BoogieDatatypeField>
                            {
                                new BoogieDatatypeField("value_f32", BoogieType.Real),
                            }
                        ),
                        new BoogieDatatypeConstructor(
                            "F64",
                            new List<BoogieDatatypeField>
                            {
                                new BoogieDatatypeField("value_f64", BoogieType.Real),
                            }
                        ),
                    }
                )
            );

            // Stack: [int]WasmValue
            program.Declarations.Add(
                new BoogieGlobalVariable(
                    new BoogieTypedIdent("$stack", new BoogieMapType(BoogieType.Int, wasmValueType))
                )
            );

            // Stack pointer
            program.Declarations.Add(
                new BoogieGlobalVariable(new BoogieTypedIdent("$sp", BoogieType.Int))
            );

            // Temporaries: WasmValue
            program.Declarations.Add(
                new BoogieGlobalVariable(new BoogieTypedIdent("$tmp1", wasmValueType))
            );

            program.Declarations.Add(
                new BoogieGlobalVariable(new BoogieTypedIdent("$tmp2", wasmValueType))
            );

            program.Declarations.Add(
                new BoogieGlobalVariable(new BoogieTypedIdent("$tmp3", wasmValueType))
            );
        }
    }
}
