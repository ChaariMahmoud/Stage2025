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

datatype BinOp { Add(), Sub(), Mul(), DivS() }
datatype UnOp  { Neg(), Eqz() }
datatype MemOp { Load(), Store() }
datatype TableOp { TableGet(), TableSet() }

datatype Instr {
  ConstI32(val: int),
  UnaryOpNode(uOp: UnOp, uOperand: Instr),
  BinaryOpNode(bOp: BinOp, bLeft: Instr, bRight: Instr),
  MemoryOpNode(moOp: MemOp, moOffset: int, moAlign: int, moAddress: Option Instr, moValue: Option Instr, moLength: Option Instr, moMemoryIndex: int)
  // J'ai retiré les noeuds inutilisés ici pour garder le code concis, 
  // tu pourras recoller le reste de ton AST complet sans problème.
}

// ==============================================================================
// 4. FONCTIONS SÉMANTIQUES PURES (Avec {:inline})
// ==============================================================================

function {:inline} eval_Add(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(st->stStack->rest->top->i + st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function {:inline} eval_Mul(st: State): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && st->stStack->rest->top is I32Val && st->stStack->top is I32Val) then
    State(ConsStack(I32Val(st->stStack->rest->top->i * st->stStack->top->i), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function {:inline} eval_BinOp(op: BinOp, st: State): State {
  if (op is Add) then eval_Add(st)
  else if (op is Mul) then eval_Mul(st)
  else st // Remplacer par DivS et Sub si nécessaire
}

function {:inline} eval_StoreI32(st: State, offset: int): State {
  if (st->stStack is ConsStack && st->stStack->rest is ConsStack && 
      st->stStack->top is I32Val && st->stStack->rest->top is I32Val &&
      st->stStack->rest->top->i + offset >= 0 && 
      st->stStack->rest->top->i + offset + 4 <= st->stMemSize) then
    State(st->stStack->rest->rest, (st->stMemory)[st->stStack->rest->top->i + offset := st->stStack->top->i], st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack && st->stStack->rest is ConsStack) then
    State(st->stStack->rest->rest, st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

function {:inline} eval_LoadI32(st: State, offset: int): State {
  if (st->stStack is ConsStack && st->stStack->top is I32Val &&
      st->stStack->top->i + offset >= 0 && 
      st->stStack->top->i + offset + 4 <= st->stMemSize) then
    State(ConsStack(I32Val((st->stMemory)[st->stStack->top->i + offset]), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else if (st->stStack is ConsStack) then
    State(ConsStack(UndefVal(), st->stStack->rest), st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables)
  else st
}

// ==============================================================================
// 5. NOUVELLE PROCÉDURE D'ÉVALUATION (Remplacement de la fonction)
// ==============================================================================

// On met un {:inline} pour que lors des tests, Boogie déploie le code 
// de la procédure et puisse vérifier les assertions de fin.
procedure {:inline 1} eval_Instr(e: Instr, st: State) returns (outSt: State)
{
  if (e is ConstI32) {
    outSt := State(
      ConsStack(I32Val(e->val), st->stStack),
      st->stMemory, st->stMemSize, st->stLocals, st->stGlobals, st->stTables
    );
  } 
  else if (e is BinaryOpNode) {
    // Les appels récursifs sont sérialisés via la variable de retour outSt
    call outSt := eval_Instr(e->bLeft, st);
    call outSt := eval_Instr(e->bRight, outSt);
    // On appelle la fonction pure finale pour résoudre le calcul
    outSt := eval_BinOp(e->bOp, outSt);
  } 
  else if (e is MemoryOpNode && e->moOp is Store) {
    outSt := eval_StoreI32(st, e->moOffset);
  } 
  else if (e is MemoryOpNode && e->moOp is Load) {
    outSt := eval_LoadI32(st, e->moOffset);
  } 
  else {
    outSt := st;
  }
}

// ==============================================================================
// 6. TESTS SÉPARÉS
// ==============================================================================

procedure TestArithI32()
{
  var initSt: State;
  var outSt: State;
  var ast: Instr;

  initSt := State(NilStack(), (lambda k: int :: 0), 1024, (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()));

  // On veut évaluer l'AST : (10 + 2) * 3 = 36
  ast := BinaryOpNode(Mul(), BinaryOpNode(Add(), ConstI32(10), ConstI32(2)), ConstI32(3));
  
  // Utilisation de 'call' et stockage dans 'outSt'
  call outSt := eval_Instr(ast, initSt);

  // Z3 vérifie mathématiquement que la pile finale contient 36
  assert outSt->stStack == ConsStack(I32Val(36), NilStack());
}

procedure TestMemoryI32()
{
  var initSt: State;
  var currentSt: State;

  initSt := State(NilStack(), (lambda k: int :: 0), 1024, (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()), (lambda k: int :: UndefVal()));

  // 1. On écrit la valeur 42 à l'adresse 100
  call currentSt := eval_Instr(ConstI32(100), initSt);    // Empile l'adresse (100)
  call currentSt := eval_Instr(ConstI32(42), currentSt);  // Empile la valeur (42)
  call currentSt := eval_Instr(MemoryOpNode(Store(), 0, 0, NoneOpt(), NoneOpt(), NoneOpt(), 0), currentSt);

  // La mémoire à l'adresse 100 doit valoir 42, et la pile doit être vide
  assert (currentSt->stMemory)[100] == 42;
  assert currentSt->stStack == NilStack();

  // 2. On relit la mémoire à l'adresse 100
  call currentSt := eval_Instr(ConstI32(100), currentSt); // Empile l'adresse (100)
  call currentSt := eval_Instr(MemoryOpNode(Load(), 0, 0, NoneOpt(), NoneOpt(), NoneOpt(), 0), currentSt);

  // La pile doit maintenant contenir la valeur lue (42)
  assert currentSt->stStack == ConsStack(I32Val(42), NilStack());
}