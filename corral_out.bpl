var $stack: [int]real;

var $sp: int;

var $tmp1: real;

var $tmp2: real;

var $tmp3: real;

var $mem: [int]int;

var $mem_pages: int;

function to_u8(x: int) : int;

axiom (forall x: int :: 0 <= to_u8(x) && to_u8(x) < 256);

procedure mem_read_u8(a: int) returns (result: int);



procedure mem_read_s8(a: int) returns (result: int);



procedure mem_read_u16(a: int) returns (result: int);



procedure mem_read_s16(a: int) returns (result: int);



procedure mem_read_u32(a: int) returns (result: int);



procedure mem_read_s32(a: int) returns (result: int);



procedure mem_read_u64(a: int) returns (result: int);



procedure mem_read_s64(a: int) returns (result: int);



function byte0_16(x: int) : int;

axiom (forall x: int :: 0 <= byte0_16(x) && byte0_16(x) < 256);

function byte1_16(x: int) : int;

axiom (forall x: int :: 0 <= byte1_16(x) && byte1_16(x) < 256);

function byte0_32(x: int) : int;

axiom (forall x: int :: 0 <= byte0_32(x) && byte0_32(x) < 256);

function byte1_32(x: int) : int;

axiom (forall x: int :: 0 <= byte1_32(x) && byte1_32(x) < 256);

function byte2_32(x: int) : int;

axiom (forall x: int :: 0 <= byte2_32(x) && byte2_32(x) < 256);

function byte3_32(x: int) : int;

axiom (forall x: int :: 0 <= byte3_32(x) && byte3_32(x) < 256);

function byte0_64(x: int) : int;

axiom (forall x: int :: 0 <= byte0_64(x) && byte0_64(x) < 256);

function byte1_64(x: int) : int;

axiom (forall x: int :: 0 <= byte1_64(x) && byte1_64(x) < 256);

function byte2_64(x: int) : int;

axiom (forall x: int :: 0 <= byte2_64(x) && byte2_64(x) < 256);

function byte3_64(x: int) : int;

axiom (forall x: int :: 0 <= byte3_64(x) && byte3_64(x) < 256);

function byte4_64(x: int) : int;

axiom (forall x: int :: 0 <= byte4_64(x) && byte4_64(x) < 256);

function byte5_64(x: int) : int;

axiom (forall x: int :: 0 <= byte5_64(x) && byte5_64(x) < 256);

function byte6_64(x: int) : int;

axiom (forall x: int :: 0 <= byte6_64(x) && byte6_64(x) < 256);

function byte7_64(x: int) : int;

axiom (forall x: int :: 0 <= byte7_64(x) && byte7_64(x) < 256);

procedure mem_write_u8(a: int, v: int);
  modifies $mem;



procedure mem_write_u16(a: int, v: int);
  modifies $mem;



procedure mem_write_u32(a: int, v: int);
  modifies $mem;



procedure mem_write_u64(a: int, v: int);
  modifies $mem;



procedure memory_size() returns (result: int);



procedure memory_grow(delta: int) returns (oldSize: int);
  modifies $mem_pages;



procedure memory_fill(dst: int, value: int, len: int);
  modifies $mem;



procedure memory_copy(dst: int, src: int, len: int);
  modifies $mem;



function nd_real() : real;

function bool_to_real(b: bool) : real;

axiom (forall b: bool :: { bool_to_real(b): real } bool_to_real(b): real == (if b then 1e0 else 0e0));

function real_to_bool(r: real) : bool;

axiom (forall r: real :: { real_to_bool(r): bool } real_to_bool(r): bool <==> (if r == 0e0 then false else true));

axiom (forall b: bool :: { bool_to_real(b) } bool_to_real(b) == 0e0 || bool_to_real(b) == 1e0);

axiom (forall b: bool :: { real_to_bool(bool_to_real(b)) } real_to_bool(bool_to_real(b)) <==> b);

axiom (forall r: real :: { real_to_bool(r) } real_to_bool(r) <==> false <==> r == 0e0);

function real_to_int(r: real) : int;

function int_to_real(i: int) : real;

function bits32_to_real(i: int) : real;

function bits64_to_real(i: int) : real;

function min_real(x: real, y: real) : real;

axiom (forall x: real, y: real :: { min_real(x, y): real } min_real(x, y): real == (if x <= y then x else y));

function max_real(x: real, y: real) : real;

axiom (forall x: real, y: real :: { max_real(x, y): real } max_real(x, y): real == (if x >= y then x else y));

function abs_real(x: real) : real;

axiom (forall x: real :: { abs_real(x): real } abs_real(x): real == (if x >= 0e0 then x else -x));

function sqrt_real(r: real) : real;

axiom (forall r: real :: { sqrt_real(r) } r >= 0e0 ==> sqrt_real(r) >= 0e0);

axiom (forall r: real :: { sqrt_real(r) } r >= 0e0 ==> sqrt_real(r) * sqrt_real(r) == r);

function nearest_real(r: real) : real;

axiom (forall r: real :: { nearest_real(r) } nearest_real(r) - 5e-1 <= r && r <= nearest_real(r) + 5e-1);

axiom (forall r: real :: { nearest_real(r) } nearest_real(nearest_real(r)) == nearest_real(r));

function floor_real(r: real) : real;

axiom (forall r: real :: floor_real(r) <= r);

axiom (forall r: real :: r < floor_real(r) + 1e0);

function ceil_real(x: real) : real;

function trunc_real(x: real) : real;

function copysign_real(x: real, y: real) : real;

function bv_and(x: real, y: real) : real;

function bv_or(x: real, y: real) : real;

function bv_xor(x: real, y: real) : real;

function bv_shl(x: real, y: real) : real;

function bv_shr_s(x: real, y: real) : real;

function bv_shr_u(x: real, y: real) : real;

function bv_rotl(x: real, y: real) : real;

function bv_rotr(x: real, y: real) : real;

function int_rem_s(x: real, y: real) : real;

function int_rem_u(x: real, y: real) : real;

function int_clz(x: real) : real;

function int_ctz(x: real) : real;

function int_popcnt(x: real) : real;

procedure InitRuntime();
  modifies $sp, $tmp1, $tmp2, $tmp3;
  ensures $sp == 0;
  ensures 0 <= $sp;



implementation {:ForceInline} InitRuntime()
{

  anon0:
    $sp := 0;
    $tmp1 := 0e0;
    $tmp2 := 0e0;
    $tmp3 := 0e0;
    return;
}



procedure push(val: real);
  requires 0 <= $sp;
  modifies $stack, $sp;
  ensures $sp == old($sp) + 1;
  ensures $stack[old($sp)] == val;
  ensures (forall i: int :: i != old($sp) ==> $stack[i] == old($stack)[i]);
  ensures 0 <= $sp;



implementation {:ForceInline} push(val: real)
{

  anon0:
    $stack[$sp] := val;
    $sp := $sp + 1;
    return;
}



procedure popToTmp1();
  requires $sp > 0;
  modifies $sp, $tmp1;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp1 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation {:ForceInline} popToTmp1()
{

  anon0:
    $sp := $sp - 1;
    $tmp1 := $stack[$sp];
    return;
}



procedure popToTmp2();
  requires $sp > 0;
  modifies $sp, $tmp2;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp2 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation {:ForceInline} popToTmp2()
{

  anon0:
    $sp := $sp - 1;
    $tmp2 := $stack[$sp];
    return;
}



procedure popToTmp3();
  requires $sp > 0;
  modifies $sp, $tmp3;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp3 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



procedure pop();
  requires $sp > 0;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;



implementation {:ForceInline} pop()
{

  anon0:
    $sp := $sp - 1;
    return;
}



var $table: [int]real;

var $table_size: int;

procedure table_get(idx: int) returns (result: real);



implementation {:ForceInline} table_get(idx: int) returns (result: real)
{

  anon0:
    result := $table[idx];
    return;
}



procedure table_set(idx: int, value: real);
  modifies $table;



implementation {:ForceInline} table_set(idx: int, value: real)
{

  anon0:
    $table[idx] := value;
    return;
}



procedure table_size() returns (result: int);



implementation {:ForceInline} table_size() returns (result: int)
{

  anon0:
    result := $table_size;
    return;
}



procedure table_grow(value: real, delta: int) returns (oldSize: int);
  modifies $table_size;



implementation {:ForceInline} table_grow(value: real, delta: int) returns (oldSize: int)
{

  anon0:
    oldSize := $table_size;
    $table_size := $table_size + delta;
    return;
}



procedure initGlobals();
  modifies $mem_pages;
  ensures $mem_pages == 0;



implementation {:ForceInline} initGlobals()
{

  anon0:
    $mem_pages := 0;
    return;
}



procedure func_0();
  modifies $stack, $sp, $tmp1, $tmp2, $table, $table_size;



implementation {:ForceInline} func_0()
{
  var entry_sp: int;
  var idx: int;
  var load_i: int;
  var store_i: int;

  anon0:
    entry_sp := $sp;
    call {:si_unique_call 0} idx := table_size();
    call {:si_unique_call 1} push(int_to_real(idx));
    call {:si_unique_call 2} pop();
    call {:si_unique_call 3} push(0e0);
    call {:si_unique_call 4} popToTmp1();
    call {:si_unique_call 5} popToTmp2();
    idx := real_to_int($tmp2);
    call {:si_unique_call 6} table_set(idx, $tmp1);
    call {:si_unique_call 7} push(0e0);
    call {:si_unique_call 8} popToTmp1();
    idx := real_to_int($tmp1);
    call {:si_unique_call 9} $tmp1 := table_get(idx);
    call {:si_unique_call 10} push($tmp1);
    call {:si_unique_call 11} pop();
    call {:si_unique_call 12} push(2e0);
    call {:si_unique_call 13} popToTmp1();
    call {:si_unique_call 14} popToTmp2();
    idx := real_to_int($tmp1);
    call {:si_unique_call 15} load_i := table_grow($tmp2, idx);
    call {:si_unique_call 16} push(int_to_real(load_i));
    call {:si_unique_call 17} pop();
    call {:si_unique_call 18} idx := table_size();
    call {:si_unique_call 19} push(int_to_real(idx));
    call {:si_unique_call 20} pop();
    return;
}



procedure CorralChoice_table();
  modifies $stack, $sp, $tmp1, $tmp2, $table, $table_size;



implementation {:ForceInline} CorralChoice_table()
{
  var c: int;

  anon0:
    havoc c;
    assume 0 <= c && c < 1;
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} c == 0;
    call {:si_unique_call 21} func_0();
    return;

  anon2_Else:
    assume {:partition} c != 0;
    return;
}



procedure BoogieEntry_table();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, $table, $table_size, $mem, $mem_pages;



procedure CorralEntry_table();
  modifies $sp, $tmp1, $tmp2, $tmp3, $mem_pages, $stack, $table, $table_size;



implementation CorralEntry_table()
{

  anon0:
    call {:si_unique_call 22} InitRuntime();
    call {:si_unique_call 23} initGlobals();
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call {:si_unique_call 24} CorralChoice_table();
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


