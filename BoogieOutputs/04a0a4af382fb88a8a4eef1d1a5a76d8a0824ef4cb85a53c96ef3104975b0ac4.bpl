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
const global_1: real;

axiom((global_1) == (1087.0));
const global_2: real;

axiom((global_2) == (1024.0));
const global_3: real;

axiom((global_3) == (66624.0));
const global_4: real;

axiom((global_4) == (1024.0));
procedure {:inline 1} initGlobals();
modifies global_0;
ensures((global_0) == (66624.0));
implementation initGlobals()
{
    global_0 := 66624.0;
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

procedure {:inline 1} strtoul();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation strtoul()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
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

procedure {:inline 1} fopen();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fopen()
{
    var arg1: real;
    var arg2: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
}

procedure {:inline 1} popArgs4() returns (a1: real, a2: real, a3: real, a4: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (4));
ensures(($sp) == ((old($sp)) - (4)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (4)]));
ensures((a2) == (old($stack)[(old($sp)) - (3)]));
ensures((a3) == (old($stack)[(old($sp)) - (2)]));
ensures((a4) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs4() returns (a1: real, a2: real, a3: real, a4: real)
{
    $sp := ($sp) - (1);
    a4 := $stack[$sp];
    $sp := ($sp) - (1);
    a3 := $stack[$sp];
    $sp := ($sp) - (1);
    a2 := $stack[$sp];
    $sp := ($sp) - (1);
    a1 := $stack[$sp];
}

procedure {:inline 1} fread();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fread()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
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

procedure {:inline 1} fclose();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fclose()
{
    var arg1: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
}

procedure {:inline 1} printf();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation printf()
{
    var arg1: real;
    var arg2: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
}

procedure {:inline 1} putchar();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation putchar()
{
    var arg1: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
}

procedure {:inline 1} __wasm_call_ctors();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation __wasm_call_ctors()
{
    var entry_sp: int;
    entry_sp := $sp;
}

procedure {:inline 1} is_hex_char();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation is_hex_char()
{
    var arg1: real;
    var loc1: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    call push(1.0);
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    // // unhandled raw instruction: i32.and
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    // // unhandled raw instruction: i32.and
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc1 := popArgs1();
label$1_end_1:
    call push(loc1);
}

procedure {:inline 1} main();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation main()
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
    call push(global_0);
    call push(350416.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
label$2_start_4:
    // // unhandled raw instruction: i32.and
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_6;
    }
    call push(1.0);
    call loc5 := popArgs1();
    call push(loc4);
    call push(-65.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(37.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_3;
    }
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (38))) {
        goto label$3_end_6;
    } else {
        if ((idx) == (0)) {
            goto label$3_end_6;
        }
        if ((idx) == (1)) {
            goto label$3_end_6;
        }
        if ((idx) == (2)) {
            goto label$3_end_6;
        }
        if ((idx) == (3)) {
            goto label$3_end_6;
        }
        if ((idx) == (4)) {
            goto label$3_end_6;
        }
        if ((idx) == (5)) {
            goto label$3_end_6;
        }
        if ((idx) == (6)) {
            goto label$1_end_3;
        }
        if ((idx) == (7)) {
            goto label$1_end_3;
        }
        if ((idx) == (8)) {
            goto label$1_end_3;
        }
        if ((idx) == (9)) {
            goto label$1_end_3;
        }
        if ((idx) == (10)) {
            goto label$1_end_3;
        }
        if ((idx) == (11)) {
            goto label$1_end_3;
        }
        if ((idx) == (12)) {
            goto label$1_end_3;
        }
        if ((idx) == (13)) {
            goto label$1_end_3;
        }
        if ((idx) == (14)) {
            goto label$1_end_3;
        }
        if ((idx) == (15)) {
            goto label$1_end_3;
        }
        if ((idx) == (16)) {
            goto label$1_end_3;
        }
        if ((idx) == (17)) {
            goto label$1_end_3;
        }
        if ((idx) == (18)) {
            goto label$1_end_3;
        }
        if ((idx) == (19)) {
            goto label$1_end_3;
        }
        if ((idx) == (20)) {
            goto label$1_end_3;
        }
        if ((idx) == (21)) {
            goto label$1_end_3;
        }
        if ((idx) == (22)) {
            goto label$1_end_3;
        }
        if ((idx) == (23)) {
            goto label$1_end_3;
        }
        if ((idx) == (24)) {
            goto label$1_end_3;
        }
        if ((idx) == (25)) {
            goto label$1_end_3;
        }
        if ((idx) == (26)) {
            goto label$1_end_3;
        }
        if ((idx) == (27)) {
            goto label$1_end_3;
        }
        if ((idx) == (28)) {
            goto label$1_end_3;
        }
        if ((idx) == (29)) {
            goto label$1_end_3;
        }
        if ((idx) == (30)) {
            goto label$1_end_3;
        }
        if ((idx) == (31)) {
            goto label$1_end_3;
        }
        if ((idx) == (32)) {
            goto label$3_end_6;
        }
        if ((idx) == (33)) {
            goto label$3_end_6;
        }
        if ((idx) == (34)) {
            goto label$3_end_6;
        }
        if ((idx) == (35)) {
            goto label$3_end_6;
        }
        if ((idx) == (36)) {
            goto label$3_end_6;
        }
        if ((idx) == (37)) {
            goto label$3_end_6;
        }
        goto label$3_end_6;
    }
label$3_end_6:
    // // unhandled raw instruction: i32.and
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_8;
    }
    call push(1.0);
    call loc5 := popArgs1();
    call push(loc3);
    call push(-65.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(37.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_3;
    }
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (38))) {
        goto label$4_end_8;
    } else {
        if ((idx) == (0)) {
            goto label$4_end_8;
        }
        if ((idx) == (1)) {
            goto label$4_end_8;
        }
        if ((idx) == (2)) {
            goto label$4_end_8;
        }
        if ((idx) == (3)) {
            goto label$4_end_8;
        }
        if ((idx) == (4)) {
            goto label$4_end_8;
        }
        if ((idx) == (5)) {
            goto label$4_end_8;
        }
        if ((idx) == (6)) {
            goto label$1_end_3;
        }
        if ((idx) == (7)) {
            goto label$1_end_3;
        }
        if ((idx) == (8)) {
            goto label$1_end_3;
        }
        if ((idx) == (9)) {
            goto label$1_end_3;
        }
        if ((idx) == (10)) {
            goto label$1_end_3;
        }
        if ((idx) == (11)) {
            goto label$1_end_3;
        }
        if ((idx) == (12)) {
            goto label$1_end_3;
        }
        if ((idx) == (13)) {
            goto label$1_end_3;
        }
        if ((idx) == (14)) {
            goto label$1_end_3;
        }
        if ((idx) == (15)) {
            goto label$1_end_3;
        }
        if ((idx) == (16)) {
            goto label$1_end_3;
        }
        if ((idx) == (17)) {
            goto label$1_end_3;
        }
        if ((idx) == (18)) {
            goto label$1_end_3;
        }
        if ((idx) == (19)) {
            goto label$1_end_3;
        }
        if ((idx) == (20)) {
            goto label$1_end_3;
        }
        if ((idx) == (21)) {
            goto label$1_end_3;
        }
        if ((idx) == (22)) {
            goto label$1_end_3;
        }
        if ((idx) == (23)) {
            goto label$1_end_3;
        }
        if ((idx) == (24)) {
            goto label$1_end_3;
        }
        if ((idx) == (25)) {
            goto label$1_end_3;
        }
        if ((idx) == (26)) {
            goto label$1_end_3;
        }
        if ((idx) == (27)) {
            goto label$1_end_3;
        }
        if ((idx) == (28)) {
            goto label$1_end_3;
        }
        if ((idx) == (29)) {
            goto label$1_end_3;
        }
        if ((idx) == (30)) {
            goto label$1_end_3;
        }
        if ((idx) == (31)) {
            goto label$1_end_3;
        }
        if ((idx) == (32)) {
            goto label$4_end_8;
        }
        if ((idx) == (33)) {
            goto label$4_end_8;
        }
        if ((idx) == (34)) {
            goto label$4_end_8;
        }
        if ((idx) == (35)) {
            goto label$4_end_8;
        }
        if ((idx) == (36)) {
            goto label$4_end_8;
        }
        if ((idx) == (37)) {
            goto label$4_end_8;
        }
        goto label$4_end_8;
    }
label$4_end_8:
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1233);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1232);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1234);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1024.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i32.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(1232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(16.0);
    call strtoul();
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    // // unhandled raw instruction: i32.and
    call loc2 := popArgs1();
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_4;
    }
    call push(loc1);
    call push(1232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(349184.0);
    call push(1024.0);
    call push(1034.0);
    call fopen();
    call loc2 := popArgs1();
    call push(loc2);
    call fread();
    call pop();
    call push(loc2);
    call fclose();
    call pop();
    call push(1037.0);
    call push(0.0);
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1024);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1008);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(1008.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1025);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (992);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(992.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1026);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (976);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(976.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1027);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (960);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(960.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1028);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (944);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(944.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1029);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (928);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(928.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1030);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (912);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(912.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1031);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (896);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(896.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1032);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (880);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(880.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1033);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc11 := popArgs1();
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (864);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(864.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1034);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (848);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(848.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1035);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc13 := popArgs1();
    call push(loc13);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (832);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(832.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1036);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (816);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(816.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1037);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc15 := popArgs1();
    call push(loc15);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (800);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(800.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1038);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc16 := popArgs1();
    call push(loc16);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (784);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(784.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1039);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc17 := popArgs1();
    call push(loc17);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (768);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(768.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(10.0);
    call putchar();
    call pop();
    call push(loc1);
    call push(loc4);
    call push(loc1);
    call push(1488.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1040);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1044);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1048);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1052);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1041);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1045);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1049);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1053);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1042);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc11);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc11 := popArgs1();
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1046);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1050);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc13 := popArgs1();
    call push(loc13);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1054);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1043);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc15 := popArgs1();
    call push(loc15);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1047);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc16 := popArgs1();
    call push(loc16);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1051);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1055);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(1054.0);
    call push(0.0);
    call printf();
    call pop();
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (752);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(752.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (736);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(736.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (720);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(720.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc14);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (704);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(704.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (688);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(688.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (672);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(672.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (656);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(656.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc15);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (640);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(640.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (624);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(624.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (608);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(608.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (592);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(592.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc16);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (576);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(576.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (560);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(560.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (544);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(544.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc13);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (528);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(528.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (512);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(512.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(10.0);
    call putchar();
    call pop();
    call push(loc1);
    call push(199632.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc1);
    call push(1040.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(1.0);
    call loc9 := popArgs1();
label$5_start_45:
    call push(loc9);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$6_start_47:
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(1232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1024.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    // // unhandled raw instruction: i32.or
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(131072.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc2);
    call push(1024.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call loc4 := popArgs1();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_47;
    }
    call push(loc8);
    call push(16384.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc9);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_45;
    }
    call push(loc1);
    call push(1204.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc1);
    call push(346320.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call push(1185.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc2);
    call push(loc1);
    call push(1186.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(512.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1212.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call push(loc2);
    call push(loc1);
    call push(1187.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(768.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1201.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call push(loc2);
    call push(loc1);
    call push(1189.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1024.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1184);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1200);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1205.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    call push(loc11);
    call push(loc2);
    call push(loc1);
    call push(1190.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1280.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1209.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc13 := popArgs1();
    call push(loc13);
    call push(loc2);
    call push(loc1);
    call push(1191.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1536.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc14 := popArgs1();
    call push(loc14);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1213.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc15 := popArgs1();
    call push(loc15);
    call push(loc2);
    call push(loc1);
    call push(1188.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1792.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc16 := popArgs1();
    call push(loc16);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1202.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(loc1);
    call push(1194.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2048.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1206.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc17 := popArgs1();
    call push(loc17);
    call push(loc2);
    call push(loc1);
    call push(1195.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2304.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc18 := popArgs1();
    call push(loc18);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1210.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc19 := popArgs1();
    call push(loc19);
    call push(loc2);
    call push(loc1);
    call push(1192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2560.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc20 := popArgs1();
    call push(loc20);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1214.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc21 := popArgs1();
    call push(loc21);
    call push(loc2);
    call push(loc1);
    call push(1193.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2816.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc22 := popArgs1();
    call push(loc22);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1203.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(loc1);
    call push(1199.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3072.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1207.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(loc1);
    call push(1196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3328.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1211.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc23 := popArgs1();
    call push(loc23);
    call push(loc2);
    call push(loc1);
    call push(1197.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3584.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc24 := popArgs1();
    call push(loc24);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1215.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc25 := popArgs1();
    call push(loc25);
    call push(loc2);
    call push(loc1);
    call push(1198.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3840.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(0.0);
    call loc5 := popArgs1();
    call push(1065.0);
    call push(0.0);
    call printf();
    call pop();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1200);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc26 := popArgs1();
    call push(loc26);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (496);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(496.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (480);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(480.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (464);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(464.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (448);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(448.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (432);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(432.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (416);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(416.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc18);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (400);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(400.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (384);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(384.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (368);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(368.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc14);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (352);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(352.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc20);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (336);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(336.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc24);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (320);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(320.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (304);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(304.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc16);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (288);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(288.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc22);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (272);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(272.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (256);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(10.0);
    call putchar();
    call pop();
    call push(1076.0);
    call push(0.0);
    call printf();
    call pop();
    call push(loc1);
    call push(loc26);
    call push(loc1);
    call push(1232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(768.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (240);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (224);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (208);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (192);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (176);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(176.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc11);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (160);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc17);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (128);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc13);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc19);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc23);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc15);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc21);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call printf();
    call pop();
    call push(loc1);
    call push(loc2);
    call push(loc25);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1048.0);
    call push(loc1);
    call printf();
    call pop();
    call push(10.0);
    call putchar();
    call pop();
label$1_end_3:
    call push(loc1);
    call push(350416.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc5);
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

procedure {:inline 1} CorralChoice__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralChoice__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (9)));
    if ((c) == (0)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call strtoul();
        call popDiscard1();
    } else if ((c) == (1)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fopen();
        call popDiscard1();
    } else if ((c) == (2)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fread();
        call popDiscard1();
    } else if ((c) == (3)) {
        havoc argTmp;
        call push(argTmp);
        call fclose();
        call popDiscard1();
    } else if ((c) == (4)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call printf();
        call popDiscard1();
    } else if ((c) == (5)) {
        havoc argTmp;
        call push(argTmp);
        call putchar();
        call popDiscard1();
    } else if ((c) == (6)) {
        call __wasm_call_ctors();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call is_hex_char();
        call popDiscard1();
    } else if ((c) == (8)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call main();
        call popDiscard1();
    }
}

procedure BoogieEntry__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation BoogieEntry__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (9)));
        if ((c) == (0)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call strtoul();
            call popDiscard1();
        } else if ((c) == (1)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fopen();
            call popDiscard1();
        } else if ((c) == (2)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fread();
            call popDiscard1();
        } else if ((c) == (3)) {
            havoc argTmp;
            call push(argTmp);
            call fclose();
            call popDiscard1();
        } else if ((c) == (4)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call printf();
            call popDiscard1();
        } else if ((c) == (5)) {
            havoc argTmp;
            call push(argTmp);
            call putchar();
            call popDiscard1();
        } else if ((c) == (6)) {
            call __wasm_call_ctors();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call is_hex_char();
            call popDiscard1();
        } else if ((c) == (8)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call main();
            call popDiscard1();
        }
    }
}

procedure CorralEntry__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralEntry__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__04a0a4af382fb88a8a4eef1d1a5a76d8a0824ef4cb85a53c96ef3104975b0ac4();
    }
}

