using System.Collections.Generic;
using BoogieAST;

namespace WasmToBoogie.Conversion
{
    public partial class WasmAstToBoogie
    {

        private static void AddIntegerWidthAxioms(BoogieProgram p)
{
    p.Declarations.Add(
        new BoogieRawDecl(
@"const TWO32: int;
const TWO31: int;
const TWO64: int;
const TWO63: int;

axiom TWO32 == 4294967296;
axiom TWO31 == 2147483648;
axiom TWO64 == 18446744073709551616;
axiom TWO63 == 9223372036854775808;

function to_u32(x: int) returns (int);
function to_u64(x: int) returns (int);

axiom (forall x:int :: 0 <= to_u32(x));
axiom (forall x:int :: to_u32(x) < TWO32);

axiom (forall x:int :: 0 <= to_u64(x));
axiom (forall x:int :: to_u64(x) < TWO64);

function is_u32(x: int) returns (bool);
function is_u64(x: int) returns (bool);

axiom (forall x:int ::
  is_u32(x) == (0 <= x && x < TWO32)
);

axiom (forall x:int ::
  is_u64(x) == (0 <= x && x < TWO64)
);

function i32_signed(x: int) returns (int);
function i64_signed(x: int) returns (int);

axiom (forall x:int ::
  is_u32(x) ==>
    i32_signed(x) == (if x < TWO31 then x else x - TWO32)
);

axiom (forall x:int ::
  is_u64(x) ==>
    i64_signed(x) == (if x < TWO63 then x else x - TWO64)
);

function u32_lt(x: int, y: int) returns (bool);
function u32_le(x: int, y: int) returns (bool);
function u32_gt(x: int, y: int) returns (bool);
function u32_ge(x: int, y: int) returns (bool);

axiom (forall x:int, y:int ::
  is_u32(x) && is_u32(y) ==>
    u32_lt(x, y) == (x < y)
);

axiom (forall x:int, y:int ::
  is_u32(x) && is_u32(y) ==>
    u32_le(x, y) == (x <= y)
);

axiom (forall x:int, y:int ::
  is_u32(x) && is_u32(y) ==>
    u32_gt(x, y) == (x > y)
);

axiom (forall x:int, y:int ::
  is_u32(x) && is_u32(y) ==>
    u32_ge(x, y) == (x >= y)
);

function u64_lt(x: int, y: int) returns (bool);
function u64_le(x: int, y: int) returns (bool);
function u64_gt(x: int, y: int) returns (bool);
function u64_ge(x: int, y: int) returns (bool);

axiom (forall x:int, y:int ::
  is_u64(x) && is_u64(y) ==>
    u64_lt(x, y) == (x < y)
);

axiom (forall x:int, y:int ::
  is_u64(x) && is_u64(y) ==>
    u64_le(x, y) == (x <= y)
);

axiom (forall x:int, y:int ::
  is_u64(x) && is_u64(y) ==>
    u64_gt(x, y) == (x > y)
);

axiom (forall x:int, y:int ::
  is_u64(x) && is_u64(y) ==>
    u64_ge(x, y) == (x >= y)
);"
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
