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
ensures((global_0) == (1.0));
implementation initGlobals()
{
    global_0 := 1.0;
}

procedure {:inline 1} popArgs2() returns (a1: real, a2: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (2));
ensures(($sp) == ((old($sp)) - (2)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (2)]));
ensures((a2) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs2() returns (a1: real, a2: real)
{
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
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(-2147483648.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
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

procedure {:inline 1} func_1();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_1()
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
    var entry_sp: int;
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call arg1 := popArgs1();
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (19))) {
        goto label$3_end_7;
    } else {
        if ((idx) == (0)) {
            goto label$21_end_25;
        }
        if ((idx) == (1)) {
            goto label$20_end_24;
        }
        if ((idx) == (2)) {
            goto label$19_end_23;
        }
        if ((idx) == (3)) {
            goto label$18_end_22;
        }
        if ((idx) == (4)) {
            goto label$3_end_7;
        }
        if ((idx) == (5)) {
            goto label$16_end_20;
        }
        if ((idx) == (6)) {
            goto label$15_end_19;
        }
        if ((idx) == (7)) {
            goto label$17_end_21;
        }
        if ((idx) == (8)) {
            goto label$14_end_18;
        }
        if ((idx) == (9)) {
            goto label$13_end_17;
        }
        if ((idx) == (10)) {
            goto label$12_end_16;
        }
        if ((idx) == (11)) {
            goto label$11_end_15;
        }
        if ((idx) == (12)) {
            goto label$10_end_14;
        }
        if ((idx) == (13)) {
            goto label$9_end_13;
        }
        if ((idx) == (14)) {
            goto label$8_end_12;
        }
        if ((idx) == (15)) {
            goto label$7_end_11;
        }
        if ((idx) == (16)) {
            goto label$6_end_10;
        }
        if ((idx) == (17)) {
            goto label$5_end_9;
        }
        if ((idx) == (18)) {
            goto label$4_end_8;
        }
        goto label$3_end_7;
    }
label$21_end_25:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$20_end_24:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$19_end_23:
    // // unhandled raw instruction: i32.and
    call arg1 := popArgs1();
    call push(arg1);
    call push(29.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    // // unhandled raw instruction: i64.or
    call loc12 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (2176);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc16 := popArgs1();
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc17 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc18 := popArgs1();
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc19 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc20 := popArgs1();
    call push(loc7);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc21 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc9 := popArgs1();
    call push(loc14);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc14 := popArgs1();
    call push(loc16);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc16 := popArgs1();
    call push(loc18);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc18 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc22 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
label$22_start_39:
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc12 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call loc2 := popArgs1();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$22_start_39;
    }
    goto label$2_end_6;
label$18_end_22:
    // // unhandled raw instruction: i32.and
    call arg1 := popArgs1();
    call push(arg1);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    // // unhandled raw instruction: i64.extend_i32_s
    call loc12 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc4 := popArgs1();
    // // unhandled raw instruction: i32.shr_u
    call loc5 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call push(loc11);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc14 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc16 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc17 := popArgs1();
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc18 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc19 := popArgs1();
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc20 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc21 := popArgs1();
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc22 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc23 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc24 := popArgs1();
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc25 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    call push(loc11);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc26 := popArgs1();
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc27 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc9 := popArgs1();
    call push(loc17);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc17 := popArgs1();
    call push(loc19);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc19 := popArgs1();
    call push(loc21);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc21 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc28 := popArgs1();
    call push(loc24);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc24 := popArgs1();
    call push(loc7);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc29 := popArgs1();
label$24_start_49:
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc12 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call loc4 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call loc5 := popArgs1();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$24_start_49;
    }
    goto label$2_end_6;
label$17_end_21:
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    call push(loc1);
    call push(29.0);
    call push(18.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    // // unhandled raw instruction: i64.extend_i32_s
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc14 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc15 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc16 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc17 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc18 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc8 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc19 := popArgs1();
    // // unhandled raw instruction: i64.or
    call loc7 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (2176);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (2096);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call loc1 := popArgs1();
    call push(arg2);
    call arg1 := popArgs1();
    call push(loc14);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc14 := popArgs1();
    call push(loc17);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc17 := popArgs1();
    call push(loc15);
    call push(loc11);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    call push(loc18);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc18 := popArgs1();
    call push(loc16);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc16 := popArgs1();
    call push(loc19);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc19 := popArgs1();
    call push(loc12);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc20 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc9 := popArgs1();
    call push(loc11);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc21 := popArgs1();
    call push(loc10);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc10 := popArgs1();
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc13 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc22 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
label$28_start_53:
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg1);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg1);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc7 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call loc1 := popArgs1();
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc2 := popArgs1();
        goto label$28_start_53;
    }
    goto label$2_end_6;
label$16_end_20:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$15_end_19:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$14_end_18:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$13_end_17:
    // // unhandled raw instruction: i32.and
    call arg1 := popArgs1();
    call push(arg1);
    call push(29.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    // // unhandled raw instruction: i64.or
    call loc12 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (2176);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc13 := popArgs1();
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc16 := popArgs1();
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc17 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc18 := popArgs1();
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc19 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc20 := popArgs1();
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc21 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc22 := popArgs1();
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc23 := popArgs1();
    // // unhandled raw instruction: i64.and
    // // unhandled raw instruction: i64.and
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc24 := popArgs1();
    call push(loc7);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc25 := popArgs1();
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc26 := popArgs1();
    call push(loc14);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc14 := popArgs1();
    call push(loc16);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc16 := popArgs1();
    call push(loc18);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc18 := popArgs1();
    call push(loc20);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc20 := popArgs1();
    call push(loc22);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc22 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc27 := popArgs1();
    call push(0.0);
    call arg1 := popArgs1();
label$30_start_75:
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc12 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call loc1 := popArgs1();
        call push(arg1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        goto label$30_start_75;
    }
    goto label$2_end_6;
label$12_end_16:
    // // unhandled raw instruction: i64.or
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    call push(loc11);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc16 := popArgs1();
    call push(loc11);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc17 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc9 := popArgs1();
    call push(loc14);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc14 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc18 := popArgs1();
    call push(arg2);
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
label$32_start_82:
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg1);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg1);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc12 := popArgs1();
        goto label$32_start_82;
    }
    goto label$2_end_6;
label$11_end_15:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$10_end_14:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$9_end_13:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$8_end_12:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$7_end_11:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$6_end_10:
    // // unhandled raw instruction: i32.and
    call arg1 := popArgs1();
    call push(arg1);
    call push(29.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    // // unhandled raw instruction: i64.or
    call loc12 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (2176);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc11 := popArgs1();
    call push(loc11);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc14 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_s
    // // unhandled raw instruction: i64.extend_i32_s
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc15 := popArgs1();
    call push(loc11);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc11 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc9 := popArgs1();
    call push(loc8);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc16 := popArgs1();
    call push(loc7);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc17 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
label$34_start_105:
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        // // unhandled raw instruction: i64.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(arg2);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        // // unhandled raw instruction: i64.shr_s
        call loc12 := popArgs1();
        // // unhandled raw instruction: i32.shr_s
        call arg1 := popArgs1();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$34_start_105;
    }
    goto label$2_end_6;
label$5_end_9:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$4_end_8:
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i64.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto label$2_end_6;
label$3_end_7:
    call push(arg2);
    call push(arg3);
    call func_0();
label$2_end_6:
    goto func_exit_114;
label$1_end_5:
    call push(arg2);
    call push(arg3);
    call func_0();
func_exit_114:
}

procedure {:inline 1} func_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_2()
{
    var arg1: real;
    var arg2: real;
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
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
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
    // // unhandled raw instruction: i32.or
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        goto func_exit_116;
    }
    // // unhandled raw instruction: i32.shl
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        goto func_exit_116;
    }
    call push(global_0);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(8.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(16.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(24.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(32.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(40.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(48.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(56.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(64.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(72.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(80.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(88.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(96.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(104.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(112.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(120.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(0.0);
        call arg2 := popArgs1();
label$4_start_119:
        call push(arg2);
        call push(128.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            // // unhandled raw instruction: i32.shl
            // // unhandled raw instruction: i32.or
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (256);
            store_i := real_to_int($tmp2);
            call mem_write_u16(idx, store_i);
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$4_start_119;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$6_start_122:
        call push(arg2);
        call push(256.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            // // unhandled raw instruction: i32.shl
            // // unhandled raw instruction: i32.or
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (512);
            store_i := real_to_int($tmp2);
            call mem_write_u16(idx, store_i);
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$6_start_122;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$8_start_125:
        call push(arg2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(511.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc2 := popArgs1();
            call push(278.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc3 := popArgs1();
            call push(0.0);
            call loc1 := popArgs1();
label$10_start_128:
            call push(loc1);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.or
                // // unhandled raw instruction: i32.or
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1024);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
                goto label$10_start_128;
            }
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$8_start_125;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$12_start_131:
        call push(arg2);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(511.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc2 := popArgs1();
            // // unhandled raw instruction: i32.or
            call loc3 := popArgs1();
            call push(0.0);
            call loc1 := popArgs1();
label$14_start_134:
            call push(loc1);
            call push(5.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.or
                // // unhandled raw instruction: i32.or
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1036);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
                goto label$14_start_134;
            }
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$12_start_131;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$16_start_137:
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(511.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc2 := popArgs1();
            // // unhandled raw instruction: i32.shr_s
            call push(65.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) * ($tmp1));
            call loc3 := popArgs1();
            call push(0.0);
            call loc1 := popArgs1();
label$18_start_140:
            call push(loc1);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.or
                // // unhandled raw instruction: i32.or
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1076);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
                goto label$18_start_140;
            }
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$16_start_137;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$20_start_143:
        call push(arg2);
        call push(32.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(511.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc2 := popArgs1();
            // // unhandled raw instruction: i32.or
            call loc3 := popArgs1();
            call push(0.0);
            call loc1 := popArgs1();
label$22_start_146:
            call push(loc1);
            call push(5.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.or
                // // unhandled raw instruction: i32.or
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1124);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
                goto label$22_start_146;
            }
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$20_start_143;
        }
        call push(0.0);
        call arg2 := popArgs1();
label$24_start_149:
        call push(arg2);
        call push(64.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(511.0);
            call push(0.0);
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call popToTmp3();
            if (real_to_bool($tmp1)) {
                call push($tmp3);
            } else {
                call push($tmp2);
            }
            call loc2 := popArgs1();
            // // unhandled raw instruction: i32.or
            call loc3 := popArgs1();
            call push(0.0);
            call loc1 := popArgs1();
label$26_start_152:
            call push(loc1);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.or
                // // unhandled raw instruction: i32.or
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1284);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
                goto label$26_start_152;
            }
            call push(arg2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            goto label$24_start_149;
        }
        call push(2048.0);
        call push(-2147483648.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2056.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2064.0);
        call push(-2147483648.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2072.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2080.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2088.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2096.0);
        call push(-2147483648.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2104.0);
        call push(-2147483648.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2112.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2120.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2128.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2176.0);
        call push(-2147483648.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2184.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2192.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2200.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2208.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2216.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2224.0);
        call push(2147483647.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(2232.0);
        call push(919146240.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(0.0);
        call global_0 := popArgs1();
    }
    // // unhandled raw instruction: i32.shr_s
    call loc6 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc8 := popArgs1();
    call push(loc8);
    // // unhandled raw instruction: i32.shl
    call loc3 := popArgs1();
    call push(loc3);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(16.0);
    call push(0.0);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc9 := popArgs1();
    call push(65536.0);
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.shl
    call loc10 := popArgs1();
    call push(loc10);
    call push(65536.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
label$28_start_158:
    call push(loc4);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc2 := popArgs1();
label$30_start_161:
        call push(loc2);
        call push(loc6);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(arg2);
            call push(loc3);
            call func_1();
            call push(loc1);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            call push(arg2);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            goto label$30_start_161;
        }
        call push(loc1);
        call push(loc9);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(arg1);
        call push(arg2);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc4);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc4 := popArgs1();
        goto label$28_start_158;
    }
    call push(loc8);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.shl
        call push(65536.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(loc1);
        call push(loc10);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        // // unhandled raw instruction: i32.shl
        call loc5 := popArgs1();
        // // unhandled raw instruction: i32.shl
        call loc6 := popArgs1();
        call push(0.0);
        call loc2 := popArgs1();
label$33_start_166:
        call push(loc2);
        call push(loc7);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(4096.0);
            call push(16.0);
            call func_1();
            call push(0.0);
            call arg1 := popArgs1();
label$35_start_169:
            call push(arg1);
            call push(loc8);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(arg1);
                call push(arg2);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (4096);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(arg1);
                call push(arg2);
                call push(loc3);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc4 := popArgs1();
                call push(loc4);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (4112);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(arg1);
                call push(loc3);
                call push(loc4);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc4 := popArgs1();
                call push(loc4);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (4128);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(arg1);
                call push(loc3);
                call push(loc4);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (4144);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(arg1);
                call push(4.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call arg1 := popArgs1();
                goto label$35_start_169;
            }
            call push(loc1);
            call push(loc5);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            call push(arg2);
            call push(loc6);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            goto label$33_start_166;
        }
    }
    call push(0.0);
func_exit_116:
}

procedure {:inline 1} popDiscard1();
modifies $sp;
requires(($sp) >= (1));
ensures(($sp) == ((old($sp)) - (1)));
ensures((0) <= ($sp));
implementation popDiscard1()
{
    $sp := ($sp) - (1);
}

procedure {:inline 1} CorralChoice__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralChoice__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (3)));
    if ((c) == (0)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_0();
    } else if ((c) == (1)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_1();
    } else if ((c) == (2)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
        call popDiscard1();
    }
}

procedure BoogieEntry__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation BoogieEntry__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (3)));
        if ((c) == (0)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_0();
        } else if ((c) == (1)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_1();
        } else if ((c) == (2)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
            call popDiscard1();
        }
    }
}

procedure CorralEntry__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralEntry__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__0634e82e32a363be098ec23ac6e513bcc867b092b613371df0687df8b724f8fb();
    }
}

