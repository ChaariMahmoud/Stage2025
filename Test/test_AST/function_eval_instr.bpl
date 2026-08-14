// ==============================================================================
// 1. TYPES ET DATATYPES DE BASE
// ==============================================================================

datatype Option<T> { NoneOpt(), SomeOpt(val: T) }
type Ident;
datatype ValType { I32Type(), I64Type(), F32Type(), F64Type() }
datatype ValTypeList { VTNil(), VTCons(head: ValType, tail: ValTypeList) }

datatype Value {
  UndefVal(),
  I32Val(i: int),
  I64Val(i: int),
  F32Val(f: real),
  F64Val(f: real)
}

// ==============================================================================
// 2. ÉTAT DU SYSTÈME
// ==============================================================================

datatype Stack {
  NilStack(),
  ConsStack(top: Value, rest: Stack)
}

datatype State {
  State(
    stStack: Stack,
    stMemory: [int]int,
    stMemSize: int,
    stLocals: [int]Value,
    stGlobals: [int]Value,
    stTables: [int]Value
  )
}

// ==============================================================================
// 3. DATATYPES D'OPÉRATIONS ET AST
// ==============================================================================

datatype UnOp {
  Clz(), Ctz(), Popcnt(),
  Eqz(), Abs(), Neg(), Sqrt(), Ceil(), Floor(), Trunc(), Nearest()
}

datatype BinOp {
  Add(), Sub(), Mul(),
  DivS(), DivU(), RemS(), RemU(),
  And(), Or(), Xor(), Shl(), ShrS(), ShrU(), Rotl(), Rotr(),
  Eq(), Ne(), LtS(), LtU(), LeS(), LeU(), GtS(), GtU(), GeS(), GeU()
}

datatype MemOp {
  Load(), Load8S(), Load8U(), Load16S(), Load16U(), Load32S(), Load32U(),
  Store(), Store8(), Store16(), Store32()
}

datatype TableOp {
  TableGet(), TableSet(), TableSize(), TableGrow(), TableFill(), TableCopy()
}

datatype Instr {
  ConstI32(val: int),
  ConstNode(cType: Ident, cValue: Ident),

  UnaryOpNode(uOp: UnOp, uOperand: Instr),
  BinaryOpNode(bOp: BinOp, bLeft: Instr, bRight: Instr),

  IfNode(ifResultType: Option ValType, ifCondition: Instr, ifThenBody: InstrList, ifElseBody: Option InstrList),
  BlockNode(blkResultType: Option ValType, blkLabel: Option Ident, blkBody: InstrList),
  LoopNode(loopResultType: Option ValType, loopLabel: Option Ident, loopBody: InstrList),
  BrNode(brLabel: Ident),
  BrIfNode(brifLabel: Ident, brifCondition: Instr),
  BrTableNode(btTargets: IdentList, btDefault: Ident, btSelector: Option Instr),
  ReturnNode(),

  LocalGetNode(lgIndex: Option int, lgName: Option Ident),
  LocalSetNode(lsIndex: Option int, lsName: Option Ident, lsValue: Option Instr),
  LocalTeeNode(ltIndex: Option int, ltName: Option Ident),
  GlobalDeclNode(gdIndex: Option int, gdName: Option Ident, gdIsMutable: bool, gdValType: ValType, gdInit: Option Instr),
  GlobalGetNode(ggIndex: Option int, ggName: Option Ident),
  GlobalSetNode(gsIndex: Option int, gsName: Option Ident, gsValue: Option Instr),

  CallNode(callTarget: Ident, callArgs: InstrList),
  CallIndirectNode(ciTypeUse: Option Ident, ciCalleeIndex: Instr, ciArgs: InstrList),

  MemoryOpNode(moOp: MemOp, moOffset: int, moAlign: int, moAddress: Option Instr, moValue: Option Instr, moLength: Option Instr, moMemoryIndex: int),
  TableOpNode(toOp: TableOp, toIndex: Option Instr, toValue: Option Instr, toDelta: Option Instr),

  SelectNode(selV1: Instr, selV2: Instr, selCond: Instr),
  NopNode(),
  UnreachableNode(),
  RawInstructionNode(rawInstruction: Ident)
}

datatype InstrList { INil(), ICons(head: Instr, tail: InstrList) }
datatype IdentList { IdNil(), IdCons(head: Ident, tail: IdentList) }

datatype Param { Param(pName: Option Ident, pType: ValType) }
datatype ParamList { PNil(), PCons(head: Param, tail: ParamList) }

datatype Function {
  Function(
    fnName: Option Ident,
    fnParams: ParamList,
    fnResultTypes: ValTypeList,
    fnBody: InstrList
  )
}

datatype FunctionList { FNil(), FCons(head: Function, tail: FunctionList) }
datatype Module { Module(mdFunctions: FunctionList) }

// ==============================================================================
// 4. FONCTIONS SÉMANTIQUES PURES (SANS INLINE)
// ==============================================================================

// --- OPÉRATIONS BINAIRES ---

function eval_Add(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(st->stStack->rest->top->i + st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_Sub(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(st->stStack->rest->top->i - st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_Mul(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(st->stStack->rest->top->i * st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_DivS(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val && st->stStack->top->i != 0) then
    State(ConsStack(I32Val(st->stStack->rest->top->i div st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_BinOp(op: BinOp, st: State): State {
  if (op is Add) then eval_Add(st)
  else if (op is Sub) then eval_Sub(st)
  else if (op is Mul) then eval_Mul(st)
  else if (op is DivS) then eval_DivS(st)
  else st
}

// --- OPÉRATIONS UNAIRES ---

function eval_Neg(st: State): State {
  if (st->stStack is ConsStack && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(-(st->stStack->top->i)), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_Eqz(st: State): State {
  if (st->stStack is ConsStack && st->stStack->top is I32Val && st->stStack->top->i == 0) then
    State(ConsStack(I32Val(1), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(0), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_UnOp(op: UnOp, st: State): State {
  if (op is Neg) then eval_Neg(st)
  else if (op is Eqz) then eval_Eqz(st)
  else st
}

// --- OPÉRATIONS MÉMOIRE ---

function eval_StoreI32(st: State, offset: int): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && 
      st->stStack->top is I32Val && st->stStack->rest->top is I32Val &&
      st->stStack->rest->top->i + offset >= 0 && 
      st->stStack->rest->top->i + offset + 4 <= st->stMemSize) then
    State(st->stStack->rest->rest, (st->stMemory)[st->stStack->rest->top->i + offset := st->stStack->top->i], st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(st->stStack->rest->rest, st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_LoadI32(st: State, offset: int): State {
  if (st->stStack is ConsStack && st->stStack->top is I32Val &&
      st->stStack->top->i + offset >= 0 && 
      st->stStack->top->i + offset + 4 <= st->stMemSize) then
    State(ConsStack(I32Val((st->stMemory)[st->stStack->top->i + offset]), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

// --- OPÉRATIONS TABLES ---

function eval_TableSet(st: State): State {
  // Wasm Stack : [..., Index, Value] -> Value au sommet, Index en dessous
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && 
      st->stStack->rest->top is I32Val && st->stStack->rest->top->i >= 0) then
    State(
      st->stStack->rest->rest, 
      st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, 
      (st->stTables)[st->stStack->rest->top->i := st->stStack->top] // MAJ de la table
    )
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(st->stStack->rest->rest, st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function eval_TableGet(st: State): State {
  // Wasm Stack : [..., Index]
  if (st->stStack is ConsStack && st->stStack->top is I32Val && st->stStack->top->i >= 0) then
    State(
      ConsStack((st->stTables)[st->stStack->top->i], st->stStack->rest), 
      st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables
    )
  else if (st->stStack is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}


// --- ÉVALUATEUR AST ---

function eval_Instr(e: Instr, st: State): State
{
  if (e is ConstI32) then
    State(ConsStack(I32Val(e->val), st->stStack), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (e is UnaryOpNode) then
    eval_UnOp(e->uOp, eval_Instr(e->uOperand, st))
  else if (e is BinaryOpNode) then
    eval_BinOp(e->bOp, eval_Instr(e->bRight, eval_Instr(e->bLeft, st)))
  else if (e is MemoryOpNode && e->moOp is Store) then
    eval_StoreI32(st, e->moOffset)
  else if (e is MemoryOpNode && e->moOp is Load) then
    eval_LoadI32(st, e->moOffset)
  else if (e is TableOpNode && e->toOp is TableSet) then
    eval_TableSet(st)
  else if (e is TableOpNode && e->toOp is TableGet) then
    eval_TableGet(st)
  else
    st
}


// ==============================================================================
// 5. BATTERIE DE TESTS CATÉGORISÉS (Vérifiés par Z3)
// ==============================================================================

// Helper pour générer un état initial vide
function get_InitState(): State {
  State(NilStack(), (lambda k: int :: 0), 1024, (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()))
}


// ---------------------------------------------------------
// CATÉGORIE 1 : Arithmétique de base (Add / Mul)
// ---------------------------------------------------------
procedure Test_Arith_Add_Mul() {
  var outSt: State;
  var ast: Instr;
  ast := BinaryOpNode(Mul(), BinaryOpNode(Add(), ConstI32(10), ConstI32(2)), ConstI32(3));
  outSt := eval_Instr(ast, get_InitState());
  assert outSt->stStack == ConsStack(I32Val(36), NilStack());
}


// ---------------------------------------------------------
// CATÉGORIE 2 : Arithmétique avancée (Sub / DivS)
// ---------------------------------------------------------
procedure Test_Arith_Sub_Div() {
  var outSt: State;
  var ast: Instr;
  ast := BinaryOpNode(DivS(), BinaryOpNode(Sub(), ConstI32(20), ConstI32(4)), ConstI32(2));
  outSt := eval_Instr(ast, get_InitState());
  assert outSt->stStack == ConsStack(I32Val(8), NilStack());
}


// ---------------------------------------------------------
// CATÉGORIE 3 : Sécurité (Division par zéro)
// ---------------------------------------------------------
procedure Test_Arith_Div_Zero() {
  var outSt: State;
  var ast: Instr;
  ast := BinaryOpNode(DivS(), ConstI32(10), ConstI32(0));
  outSt := eval_Instr(ast, get_InitState());
  assert outSt->stStack == ConsStack(UndefVal(), NilStack());
}


// ---------------------------------------------------------
// CATÉGORIE 4 : Opérations Unaires (Neg / Eqz)
// ---------------------------------------------------------
procedure Test_Unary_Neg_Eqz() {
  var outSt1: State;
  var outSt2: State;
  
  var ast1: Instr;
  ast1 := UnaryOpNode(Eqz(), UnaryOpNode(Neg(), ConstI32(0)));
  outSt1 := eval_Instr(ast1, get_InitState());
  assert outSt1->stStack == ConsStack(I32Val(1), NilStack());

  var ast2: Instr;
  ast2 := UnaryOpNode(Eqz(), UnaryOpNode(Neg(), ConstI32(5)));
  outSt2 := eval_Instr(ast2, get_InitState());
  assert outSt2->stStack == ConsStack(I32Val(0), NilStack());
}


// ---------------------------------------------------------
// CATÉGORIE 5 : Mémoire (Store / Load)
// ---------------------------------------------------------
procedure Test_Memory_Store_Load() {
  var currentSt: State;

  // Écrire 42 à l'adresse mémoire 100
  currentSt := eval_Instr(
    MemoryOpNode(Store(), 0, 0, NoneOpt(), NoneOpt(), NoneOpt(), 0), 
    eval_Instr(ConstI32(42), eval_Instr(ConstI32(100), get_InitState()))
  );
  assert (currentSt->stMemory)[100] == 42;
  assert currentSt->stStack == NilStack();

  // Lire la mémoire à l'adresse 100
  currentSt := eval_Instr(
    MemoryOpNode(Load(), 0, 0, NoneOpt(), NoneOpt(), NoneOpt(), 0), 
    eval_Instr(ConstI32(100), currentSt)
  );
  assert currentSt->stStack == ConsStack(I32Val(42), NilStack());
}


// ---------------------------------------------------------
// CATÉGORIE 6 : Opérations sur les Tables (TableSet / TableGet)
// ---------------------------------------------------------
procedure Test_Table_Set_Get() {
  var currentSt: State;

  // 1. TableSet : Écrire la valeur (I32Val(99)) à l'index 10 de la table.
  // Ordre d'empilement Wasm : Index (10) d'abord, Valeur (99) ensuite.
  currentSt := eval_Instr(
    TableOpNode(TableSet(), NoneOpt(), NoneOpt(), NoneOpt()), 
    eval_Instr(ConstI32(99), 
      eval_Instr(ConstI32(10), get_InitState()))
  );

  // Vérification de l'écriture
  assert (currentSt->stTables)[10] == I32Val(99);
  assert currentSt->stStack == NilStack(); // Les deux opérandes ont été dépilés

  // 2. TableGet : Lire la valeur de la table à l'index 10.
  // Ordre d'empilement Wasm : Index (10).
  currentSt := eval_Instr(
    TableOpNode(TableGet(), NoneOpt(), NoneOpt(), NoneOpt()), 
    eval_Instr(ConstI32(10), currentSt)
  );

  // Vérification de la lecture (on doit récupérer I32Val(99))
  assert currentSt->stStack == ConsStack(I32Val(99), NilStack());
}