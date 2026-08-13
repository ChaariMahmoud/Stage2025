using System.Collections.Generic;
using BoogieAST;

namespace WasmToBoogie.Conversion
{
    public partial class WasmAstToBoogie
    {


private static BoogieExpr Mod(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.MOD, a, b);

private static BoogieExpr Or(BoogieExpr a, BoogieExpr b) =>
    new BoogieBinaryOperation(BoogieBinaryOperation.Opcode.OR, a, b);

private static BoogieExpr ForallReal1(string x, BoogieExpr body) =>
    new BoogieQuantifiedExpr(
        true,
        new List<BoogieIdentifierExpr> { BId(x) },
        new List<BoogieType> { BoogieType.Real },
        body
    );
private static BoogieIdentifierExpr BId(string name) =>
    new BoogieIdentifierExpr(name);

private static BoogieLiteralExpr BigIntLit(string value) =>
    new BoogieLiteralExpr(System.Numerics.BigInteger.Parse(value));

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

private static void AddUnsignedComparisonAxioms(BoogieProgram p)
{
    string[] suffixes = { "lt", "le", "gt", "ge" };

    foreach (var suffix in suffixes)
    {
        p.Declarations.Add(
            new BoogieFunction(
                $"u32_{suffix}",
                new List<BoogieVariable>
                {
                    new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int)),
                    new BoogieFormalParam(new BoogieTypedIdent("y", BoogieType.Int))
                },
                new List<BoogieVariable>
                {
                    new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
                }
            )
        );

        p.Declarations.Add(
            new BoogieFunction(
                $"u64_{suffix}",
                new List<BoogieVariable>
                {
                    new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Int)),
                    new BoogieFormalParam(new BoogieTypedIdent("y", BoogieType.Int))
                },
                new List<BoogieVariable>
                {
                    new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
                }
            )
        );
    }

    AddUnsignedComparisonAxiom(p, "u32_lt", "is_u32", BoogieBinaryOperation.Opcode.LT);
    AddUnsignedComparisonAxiom(p, "u32_le", "is_u32", BoogieBinaryOperation.Opcode.LE);
    AddUnsignedComparisonAxiom(p, "u32_gt", "is_u32", BoogieBinaryOperation.Opcode.GT);
    AddUnsignedComparisonAxiom(p, "u32_ge", "is_u32", BoogieBinaryOperation.Opcode.GE);

    AddUnsignedComparisonAxiom(p, "u64_lt", "is_u64", BoogieBinaryOperation.Opcode.LT);
    AddUnsignedComparisonAxiom(p, "u64_le", "is_u64", BoogieBinaryOperation.Opcode.LE);
    AddUnsignedComparisonAxiom(p, "u64_gt", "is_u64", BoogieBinaryOperation.Opcode.GT);
    AddUnsignedComparisonAxiom(p, "u64_ge", "is_u64", BoogieBinaryOperation.Opcode.GE);
}

private static void AddUnsignedComparisonAxiom(
    BoogieProgram p,
    string functionName,
    string domainPredicate,
    BoogieBinaryOperation.Opcode cmp
)
{
    var x = BId("x");
    var y = BId("y");

    var domain =
        And(
            Fun(domainPredicate, x),
            Fun(domainPredicate, y)
        );

    var comparison =
        new BoogieBinaryOperation(cmp, x, y);

    p.Declarations.Add(
        new BoogieAxiom(
            Forall2(
                "x",
                "y",
                Imp(
                    domain,
                    Eq(
                        Fun(functionName, x, y),
                        comparison
                    )
                )
            )
        )
    );
}

private static void AddFloatingAbstractionAxioms(BoogieProgram p)
{
    // function to_f32(x: real) returns (r: real);
    p.Declarations.Add(
        new BoogieFunction(
            "to_f32",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Real))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Real))
            }
        )
    );

    // function to_f64(x: real) returns (r: real);
    p.Declarations.Add(
        new BoogieFunction(
            "to_f64",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Real))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Real))
            }
        )
    );

    // function is_f32(x: real) returns (r: bool);
    p.Declarations.Add(
        new BoogieFunction(
            "is_f32",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Real))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
            }
        )
    );

    // function is_f64(x: real) returns (r: bool);
    p.Declarations.Add(
        new BoogieFunction(
            "is_f64",
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("x", BoogieType.Real))
            },
            new List<BoogieVariable>
            {
                new BoogieFormalParam(new BoogieTypedIdent("r", BoogieType.Bool))
            }
        )
    );

    // axiom forall x:real :: is_f32(to_f32(x));
    p.Declarations.Add(
        new BoogieAxiom(
            ForallReal1(
                "x",
                Fun("is_f32", Fun("to_f32", BId("x")))
            )
        )
    );

    // axiom forall x:real :: is_f64(to_f64(x));
    p.Declarations.Add(
        new BoogieAxiom(
            ForallReal1(
                "x",
                Fun("is_f64", Fun("to_f64", BId("x")))
            )
        )
    );

    // axiom forall x:real :: is_f32(x) ==> to_f32(x) == x;
    p.Declarations.Add(
        new BoogieAxiom(
            ForallReal1(
                "x",
                Imp(
                    Fun("is_f32", BId("x")),
                    Eq(Fun("to_f32", BId("x")), BId("x"))
                )
            )
        )
    );

    // axiom forall x:real :: is_f64(x) ==> to_f64(x) == x;
    p.Declarations.Add(
        new BoogieAxiom(
            ForallReal1(
                "x",
                Imp(
                    Fun("is_f64", BId("x")),
                    Eq(Fun("to_f64", BId("x")), BId("x"))
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
