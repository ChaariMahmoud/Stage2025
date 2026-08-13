using System.Collections.Generic;
using BoogieAST;

namespace WasmToBoogie.Conversion
{
    public partial class WasmAstToBoogie
    {

        
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
