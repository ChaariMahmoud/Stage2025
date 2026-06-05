var $stack: [int]real;
var $sp: int;
var $tmp1: real;
var $tmp2: real;
var $tmp3: real;
var $mem: [int]int;
var $mem_pages: int;
function to_u8(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (to_u8(x))) && ((to_u8(x)) < (256))));
procedure {:inline 1} mem_read_u8(a: int) returns (result: int);
implementation mem_read_u8(a: int) returns (result: int)
{
    result := $mem[a];
    assume (((0) <= (result)) && ((result) < (256)));
}

procedure {:inline 1} mem_read_s8(a: int) returns (result: int);
implementation mem_read_s8(a: int) returns (result: int)
{
    var u: int;
    call u := mem_read_u8(a);
    if ((u) >= (128)) {
        result := (u) - (256);
    } else {
        result := u;
    }
}

procedure {:inline 1} mem_read_u16(a: int) returns (result: int);
implementation mem_read_u16(a: int) returns (result: int)
{
    var b0: int;
    var b1: int;
    call b0 := mem_read_u8(a);
    call b1 := mem_read_u8((a) + (1));
    result := (b0) + ((256) * (b1));
    assume (((0) <= (result)) && ((result) < (65536)));
}

procedure {:inline 1} mem_read_s16(a: int) returns (result: int);
implementation mem_read_s16(a: int) returns (result: int)
{
    var u: int;
    call u := mem_read_u16(a);
    if ((u) >= (32768)) {
        result := (u) - (65536);
    } else {
        result := u;
    }
}

procedure {:inline 1} mem_read_u32(a: int) returns (result: int);
implementation mem_read_u32(a: int) returns (result: int)
{
    var b0: int;
    var b1: int;
    var b2: int;
    var b3: int;
    call b0 := mem_read_u8(a);
    call b1 := mem_read_u8((a) + (1));
    call b2 := mem_read_u8((a) + (2));
    call b3 := mem_read_u8((a) + (3));
    result := (b0) + (((256) * (b1)) + (((65536) * (b2)) + ((16777216) * (b3))));
    assume (((0) <= (result)) && ((result) < (4294967296)));
}

procedure {:inline 1} mem_read_s32(a: int) returns (result: int);
implementation mem_read_s32(a: int) returns (result: int)
{
    var u: int;
    call u := mem_read_u32(a);
    if ((u) >= (2147483648)) {
        result := (u) - (4294967296);
    } else {
        result := u;
    }
}

procedure {:inline 1} mem_read_u64(a: int) returns (result: int);
implementation mem_read_u64(a: int) returns (result: int)
{
    var b0: int;
    var b1: int;
    var b2: int;
    var b3: int;
    var b4: int;
    var b5: int;
    var b6: int;
    var b7: int;
    call b0 := mem_read_u8(a);
    call b1 := mem_read_u8((a) + (1));
    call b2 := mem_read_u8((a) + (2));
    call b3 := mem_read_u8((a) + (3));
    call b4 := mem_read_u8((a) + (4));
    call b5 := mem_read_u8((a) + (5));
    call b6 := mem_read_u8((a) + (6));
    call b7 := mem_read_u8((a) + (7));
    result := (b0) + (((256) * (b1)) + (((65536) * (b2)) + (((16777216) * (b3)) + (((4294967296) * (b4)) + (((1099511627776) * (b5)) + (((281474976710656) * (b6)) + ((72057594037927936) * (b7))))))));
}

procedure {:inline 1} mem_read_s64(a: int) returns (result: int);
implementation mem_read_s64(a: int) returns (result: int)
{
    var u: int;
    call u := mem_read_u64(a);
    result := u;
}

function byte0_16(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte0_16(x))) && ((byte0_16(x)) < (256))));
function byte1_16(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte1_16(x))) && ((byte1_16(x)) < (256))));
function byte0_32(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte0_32(x))) && ((byte0_32(x)) < (256))));
function byte1_32(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte1_32(x))) && ((byte1_32(x)) < (256))));
function byte2_32(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte2_32(x))) && ((byte2_32(x)) < (256))));
function byte3_32(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte3_32(x))) && ((byte3_32(x)) < (256))));
function byte0_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte0_64(x))) && ((byte0_64(x)) < (256))));
function byte1_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte1_64(x))) && ((byte1_64(x)) < (256))));
function byte2_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte2_64(x))) && ((byte2_64(x)) < (256))));
function byte3_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte3_64(x))) && ((byte3_64(x)) < (256))));
function byte4_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte4_64(x))) && ((byte4_64(x)) < (256))));
function byte5_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte5_64(x))) && ((byte5_64(x)) < (256))));
function byte6_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte6_64(x))) && ((byte6_64(x)) < (256))));
function byte7_64(x: int) returns (r: int);

axiom(forall  x:int ::  (((0) <= (byte7_64(x))) && ((byte7_64(x)) < (256))));
procedure {:inline 1} mem_write_u8(a: int, v: int);
modifies $mem;
implementation mem_write_u8(a: int, v: int)
{
    $mem[a] := to_u8(v);
}

procedure {:inline 1} mem_write_u16(a: int, v: int);
modifies $mem;
implementation mem_write_u16(a: int, v: int)
{
    call mem_write_u8(a, byte0_16(v));
    call mem_write_u8((a) + (1), byte1_16(v));
}

procedure {:inline 1} mem_write_u32(a: int, v: int);
modifies $mem;
implementation mem_write_u32(a: int, v: int)
{
    call mem_write_u8(a, byte0_32(v));
    call mem_write_u8((a) + (1), byte1_32(v));
    call mem_write_u8((a) + (2), byte2_32(v));
    call mem_write_u8((a) + (3), byte3_32(v));
}

procedure {:inline 1} mem_write_u64(a: int, v: int);
modifies $mem;
implementation mem_write_u64(a: int, v: int)
{
    call mem_write_u8(a, byte0_64(v));
    call mem_write_u8((a) + (1), byte1_64(v));
    call mem_write_u8((a) + (2), byte2_64(v));
    call mem_write_u8((a) + (3), byte3_64(v));
    call mem_write_u8((a) + (4), byte4_64(v));
    call mem_write_u8((a) + (5), byte5_64(v));
    call mem_write_u8((a) + (6), byte6_64(v));
    call mem_write_u8((a) + (7), byte7_64(v));
}

function bool_to_real(b: bool) : real
{
    if b then (1.0) else (0.0)
}
function real_to_bool(r: real) : bool
{
    if (r) == (0.0) then (false) else (true)
}

axiom(forall  b:bool :: {bool_to_real(b)} (((bool_to_real(b)) == (0.0)) || ((bool_to_real(b)) == (1.0))));

axiom(forall  b:bool :: {real_to_bool(bool_to_real(b))} ((real_to_bool(bool_to_real(b))) == (b)));

axiom(forall  r:real :: {real_to_bool(r)} (((real_to_bool(r)) == (false)) <==> ((r) == (0.0))));
function real_to_int(r: real) returns (result: int);
function int_to_real(i: int) returns (result: real);
function bits32_to_real(i: int) returns (result: real);
function bits64_to_real(i: int) returns (result: real);
procedure {:inline 1} InitRuntime();
modifies $sp;
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
ensures(($sp) == (0));
ensures((0) <= ($sp));
implementation InitRuntime()
{
    $sp := 0;
    $tmp1 := 0.0;
    $tmp2 := 0.0;
    $tmp3 := 0.0;
}

procedure {:inline 1} push(val: real);
modifies $sp;
modifies $stack;
requires((0) <= ($sp));
ensures(($sp) == ((old($sp)) + (1)));
ensures(($stack[old($sp)]) == (val));
ensures(forall  i:int ::  (((i) != (old($sp))) ==> (($stack[i]) == (old($stack)[i]))));
ensures((0) <= ($sp));
implementation push(val: real)
{
    $stack[$sp] := val;
    $sp := ($sp) + (1);
}

procedure {:inline 1} popToTmp1();
modifies $sp;
modifies $tmp1;
requires(($sp) > (0));
ensures(($sp) == ((old($sp)) - (1)));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures(($tmp1) == (old($stack)[(old($sp)) - (1)]));
ensures((0) <= ($sp));
implementation popToTmp1()
{
    $sp := ($sp) - (1);
    $tmp1 := $stack[$sp];
}

procedure {:inline 1} popToTmp2();
modifies $sp;
modifies $tmp2;
requires(($sp) > (0));
ensures(($sp) == ((old($sp)) - (1)));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures(($tmp2) == (old($stack)[(old($sp)) - (1)]));
ensures((0) <= ($sp));
implementation popToTmp2()
{
    $sp := ($sp) - (1);
    $tmp2 := $stack[$sp];
}

procedure {:inline 1} popToTmp3();
modifies $sp;
modifies $tmp3;
requires(($sp) > (0));
ensures(($sp) == ((old($sp)) - (1)));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures(($tmp3) == (old($stack)[(old($sp)) - (1)]));
ensures((0) <= ($sp));
implementation popToTmp3()
{
    $sp := ($sp) - (1);
    $tmp3 := $stack[$sp];
}

procedure {:inline 1} pop();
modifies $sp;
requires(($sp) > (0));
ensures(($sp) == ((old($sp)) - (1)));
ensures((0) <= ($sp));
implementation pop()
{
    $sp := ($sp) - (1);
}

var global_0: real;
procedure {:inline 1} initGlobals();
modifies global_0;
ensures((global_0) == (66560.0));
implementation initGlobals()
{
    global_0 := 66560.0;
}

procedure {:inline 1} popArgs3() returns (a1: real, a2: real, a3: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (3));
ensures(($sp) == ((old($sp)) - (3)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (3)]));
ensures((a2) == (old($stack)[(old($sp)) - (2)]));
ensures((a3) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs3() returns (a1: real, a2: real, a3: real)
{
    $sp := ($sp) - (1);
    a3 := $stack[$sp];
    $sp := ($sp) - (1);
    a2 := $stack[$sp];
    $sp := ($sp) - (1);
    a1 := $stack[$sp];
}

procedure {:inline 1} popArgs1() returns (a1: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (1));
ensures(($sp) == ((old($sp)) - (1)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs1() returns (a1: real)
{
    $sp := ($sp) - (1);
    a1 := $stack[$sp];
}

procedure {:inline 1} func_0();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_0()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var loc6: real;
    var loc7: real;
    var loc8: real;
    var loc9: real;
    var loc10: real;
    var loc11: real;
    var loc12: real;
    var loc13: real;
    var loc14: real;
    var loc15: real;
    var loc16: real;
    var loc17: real;
    var loc18: real;
    var loc19: real;
    var loc20: real;
    var loc21: real;
    var loc22: real;
    var loc23: real;
    var loc24: real;
    var loc25: real;
    var loc26: real;
    var loc27: real;
    var loc28: real;
    var loc29: real;
    var loc30: real;
    var loc31: real;
    var loc32: real;
    var loc33: real;
    var loc34: real;
    var loc35: real;
    var loc36: real;
    var loc37: real;
    var loc38: real;
    var loc39: real;
    var loc40: real;
    var loc41: real;
    var loc42: real;
    var loc43: real;
    var loc44: real;
    var loc45: real;
    var loc46: real;
    var loc47: real;
    var loc48: real;
    var loc49: real;
    var loc50: real;
    var loc51: real;
    var loc52: real;
    var loc53: real;
    var loc54: real;
    var loc55: real;
    var loc56: real;
    var loc57: real;
    var loc58: real;
    var loc59: real;
    var loc60: real;
    var loc61: real;
    var loc62: real;
    var loc63: real;
    var loc64: real;
    var loc65: real;
    var loc66: real;
    var loc67: real;
    var loc68: real;
    var loc69: real;
    var loc70: real;
    var loc71: real;
    var loc72: real;
    var loc73: real;
    var loc74: real;
    var loc75: real;
    var loc76: real;
    var loc77: real;
    var loc78: real;
    var loc79: real;
    var loc80: real;
    var loc81: real;
    var loc82: real;
    var loc83: real;
    var loc84: real;
    var loc85: real;
    var loc86: real;
    var loc87: real;
    var loc88: real;
    var loc89: real;
    var loc90: real;
    var loc91: real;
    var loc92: real;
    var loc93: real;
    var loc94: real;
    var loc95: real;
    var loc96: real;
    var loc97: real;
    var loc98: real;
    var loc99: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    loc10 := 0.0;
    loc11 := 0.0;
    loc12 := 0.0;
    loc13 := 0.0;
    loc14 := 0.0;
    loc15 := 0.0;
    loc16 := 0.0;
    loc17 := 0.0;
    loc18 := 0.0;
    loc19 := 0.0;
    loc20 := 0.0;
    loc21 := 0.0;
    loc22 := 0.0;
    loc23 := 0.0;
    loc24 := 0.0;
    loc25 := 0.0;
    loc26 := 0.0;
    loc27 := 0.0;
    loc28 := 0.0;
    loc29 := 0.0;
    loc30 := 0.0;
    loc31 := 0.0;
    loc32 := 0.0;
    loc33 := 0.0;
    loc34 := 0.0;
    loc35 := 0.0;
    loc36 := 0.0;
    loc37 := 0.0;
    loc38 := 0.0;
    loc39 := 0.0;
    loc40 := 0.0;
    loc41 := 0.0;
    loc42 := 0.0;
    loc43 := 0.0;
    loc44 := 0.0;
    loc45 := 0.0;
    loc46 := 0.0;
    loc47 := 0.0;
    loc48 := 0.0;
    loc49 := 0.0;
    loc50 := 0.0;
    loc51 := 0.0;
    loc52 := 0.0;
    loc53 := 0.0;
    loc54 := 0.0;
    loc55 := 0.0;
    loc56 := 0.0;
    loc57 := 0.0;
    loc58 := 0.0;
    loc59 := 0.0;
    loc60 := 0.0;
    loc61 := 0.0;
    loc62 := 0.0;
    loc63 := 0.0;
    loc64 := 0.0;
    loc65 := 0.0;
    loc66 := 0.0;
    loc67 := 0.0;
    loc68 := 0.0;
    loc69 := 0.0;
    loc70 := 0.0;
    loc71 := 0.0;
    loc72 := 0.0;
    loc73 := 0.0;
    loc74 := 0.0;
    loc75 := 0.0;
    loc76 := 0.0;
    loc77 := 0.0;
    loc78 := 0.0;
    loc79 := 0.0;
    loc80 := 0.0;
    loc81 := 0.0;
    loc82 := 0.0;
    loc83 := 0.0;
    loc84 := 0.0;
    loc85 := 0.0;
    loc86 := 0.0;
    loc87 := 0.0;
    loc88 := 0.0;
    loc89 := 0.0;
    loc90 := 0.0;
    loc91 := 0.0;
    loc92 := 0.0;
    loc93 := 0.0;
    loc94 := 0.0;
    loc95 := 0.0;
    loc96 := 0.0;
    loc97 := 0.0;
    loc98 := 0.0;
    loc99 := 0.0;
    call push(global_0);
    call loc1 := popArgs1();
    call push(64.0);
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
    call push(loc3);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc3);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_start_2:
    call push(16.0);
    call loc6 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call loc8 := popArgs1();
    call push(loc6);
    call loc9 := popArgs1();
    call push(loc8);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc10 := popArgs1();
    call push(1.0);
    call loc11 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc12 := popArgs1();
    call push(loc12);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    call push(0.0);
    call loc13 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc14 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc15 := popArgs1();
    call push(2.0);
    call loc16 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc17 := popArgs1();
    call push(loc14);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc18 := popArgs1();
    call push(loc18);
    call push(loc13);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc19 := popArgs1();
    call push(1.0);
    call loc20 := popArgs1();
    call push(loc19);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc21 := popArgs1();
    call push(loc3);
    call push(loc21);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$2_start_2;
label$1_end_1:
    call push(0.0);
    call loc22 := popArgs1();
    call push(loc3);
    call push(loc22);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$4_start_5:
    call push(8.0);
    call loc23 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc24 := popArgs1();
    call push(loc24);
    call loc25 := popArgs1();
    call push(loc23);
    call loc26 := popArgs1();
    call push(loc25);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc27 := popArgs1();
    call push(1.0);
    call loc28 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc29 := popArgs1();
    call push(loc29);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_4;
    }
    call push(0.0);
    call loc30 := popArgs1();
    call push(loc3);
    call push(loc30);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc30);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$6_start_8:
    call push(8.0);
    call loc31 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc32 := popArgs1();
    call push(loc32);
    call loc33 := popArgs1();
    call push(loc31);
    call loc34 := popArgs1();
    call push(loc33);
    call push(loc34);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc35 := popArgs1();
    call push(1.0);
    call loc36 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc37 := popArgs1();
    call push(loc37);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_7;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc38 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc39 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc40 := popArgs1();
    call push(loc39);
    call push(loc40);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc41 := popArgs1();
    call push(2.0);
    call loc42 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc43 := popArgs1();
    call push(loc38);
    call push(loc43);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc44 := popArgs1();
    call push(loc44);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc45 := popArgs1();
    call push(loc45);
    call loc46 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc87 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc47 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc48 := popArgs1();
    call push(2.0);
    call loc49 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc50 := popArgs1();
    call push(loc47);
    call push(loc50);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc51 := popArgs1();
    call push(loc51);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc52 := popArgs1();
    call push(loc52);
    call loc53 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc88 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc54 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc55 := popArgs1();
    call push(2.0);
    call loc56 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc57 := popArgs1();
    call push(loc54);
    call push(loc57);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc58 := popArgs1();
    call push(loc58);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc59 := popArgs1();
    call push(loc59);
    call loc60 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc89 := popArgs1();
    call push(loc88);
    call push(loc89);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc90 := popArgs1();
    call push(loc87);
    call push(loc90);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc91 := popArgs1();
    call push(loc3);
    call push(loc91);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc61 := popArgs1();
    call push(loc61);
    call loc62 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc92 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc93 := popArgs1();
    call push(loc93);
    call push(loc92);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc94 := popArgs1();
    call push(loc3);
    call push(loc94);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc95 := popArgs1();
    call push(32.0);
    call loc96 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc97 := popArgs1();
    call push(loc3);
    call push(loc97);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc98 := popArgs1();
    call push(loc98);
    // // wrap: no-op under real semantics
    call loc63 := popArgs1();
    call push(loc3);
    call push(loc63);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc64 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc65 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc66 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc67 := popArgs1();
    call push(loc66);
    call push(loc67);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc68 := popArgs1();
    call push(2.0);
    call loc69 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc70 := popArgs1();
    call push(loc65);
    call push(loc70);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc71 := popArgs1();
    call push(loc71);
    call push(loc64);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc99 := popArgs1();
    call push(loc99);
    // // wrap: no-op under real semantics
    call loc72 := popArgs1();
    call push(loc3);
    call push(loc72);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc73 := popArgs1();
    call push(1.0);
    call loc74 := popArgs1();
    call push(loc73);
    call push(loc74);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc75 := popArgs1();
    call push(loc3);
    call push(loc75);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$6_start_8;
label$5_end_7:
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc76 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc77 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc78 := popArgs1();
    call push(8.0);
    call loc79 := popArgs1();
    call push(loc78);
    call push(loc79);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc80 := popArgs1();
    call push(2.0);
    call loc81 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc82 := popArgs1();
    call push(loc77);
    call push(loc82);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc83 := popArgs1();
    call push(loc83);
    call push(loc76);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc84 := popArgs1();
    call push(1.0);
    call loc85 := popArgs1();
    call push(loc84);
    call push(loc85);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc86 := popArgs1();
    call push(loc3);
    call push(loc86);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$4_start_5;
label$3_end_4:
    goto func_exit_10;
func_exit_10:
}

procedure {:inline 1} CorralChoice__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralChoice__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (1)));
    if ((c) == (0)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_0();
    }
}

procedure BoogieEntry__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation BoogieEntry__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (1)));
        if ((c) == (0)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_0();
        }
    }
}

procedure CorralEntry__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralEntry__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__4674794332805d96e3965e04eb9929327d63cdb84be21cc72b69887f6d458153();
    }
}

