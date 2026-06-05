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
var global_1: real;
var global_2: real;
var global_3: real;
var global_4: real;
var global_5: real;
var global_6: real;
var global_7: real;
var global_8: real;
var global_9: real;
var global_10: real;
var global_11: real;
var global_12: real;
var global_13: real;
var global_14: real;
var global_15: real;
var global_16: real;
var global_17: real;
var global_18: real;
var global_19: real;
var global_20: real;
var global_21: real;
var global_22: real;
var global_23: real;
var global_24: real;
var global_25: real;
var global_26: real;
procedure {:inline 1} initGlobals();
modifies global_0;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
modifies global_6;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
modifies global_16;
modifies global_17;
modifies global_18;
modifies global_19;
modifies global_20;
modifies global_21;
modifies global_22;
modifies global_23;
modifies global_24;
modifies global_25;
modifies global_26;
ensures((global_0) == (0.0));
ensures((global_1) == (0.0));
ensures((global_2) == (0.0));
ensures((global_3) == (0.0));
ensures((global_4) == (0.0));
ensures((global_5) == (0.0));
ensures((global_6) == (0.0));
ensures((global_7) == (0.0));
ensures((global_8) == (0.0));
ensures((global_9) == (0.0));
ensures((global_10) == (0.0));
ensures((global_11) == (0.0));
ensures((global_12) == (0.0));
ensures((global_13) == (0.0));
ensures((global_14) == (0.0));
ensures((global_15) == (0.0));
ensures((global_16) == (0.0));
ensures((global_17) == (0.0));
ensures((global_18) == (0.0));
ensures((global_19) == (0.0));
ensures((global_20) == (0.0));
ensures((global_21) == (0.0));
ensures((global_22) == (0.0));
ensures((global_23) == (0.0));
ensures((global_24) == (0.0));
ensures((global_25) == (0.0));
ensures((global_26) == (0.0));
implementation initGlobals()
{
    global_0 := 0.0;
    global_1 := 0.0;
    global_2 := 0.0;
    global_3 := 0.0;
    global_4 := 0.0;
    global_5 := 0.0;
    global_6 := 0.0;
    global_7 := 0.0;
    global_8 := 0.0;
    global_9 := 0.0;
    global_10 := 0.0;
    global_11 := 0.0;
    global_12 := 0.0;
    global_13 := 0.0;
    global_14 := 0.0;
    global_15 := 0.0;
    global_16 := 0.0;
    global_17 := 0.0;
    global_18 := 0.0;
    global_19 := 0.0;
    global_20 := 0.0;
    global_21 := 0.0;
    global_22 := 0.0;
    global_23 := 0.0;
    global_24 := 0.0;
    global_25 := 0.0;
    global_26 := 0.0;
}

procedure {:inline 1} exit();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation exit()
{
}

procedure {:inline 1} getchar();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation getchar()
{
}

procedure {:inline 1} putchar();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation putchar()
{
}

procedure {:inline 1} fimport_0();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_0()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} fimport_1();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_1()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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

procedure {:inline 1} fimport_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_2()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call fimport_0();
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(arg1);
    call fimport_2();
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

procedure {:inline 1} func_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_2()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    call push(0.0);
    call loc1 := popArgs1();
label$2_start_2:
    call push(arg2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    goto label$2_start_2;
label$1_end_1:
}

procedure {:inline 1} func_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_3()
{
    var arg1: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    call push(5.0);
    call push(6.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc1 := popArgs1();
    call push(0.0);
    call push(5.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call push(loc1);
    call func_2();
}

procedure {:inline 1} func_4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_4()
{
    var arg1: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_4;
    }
    call push(48.0);
    call func_1();
    goto func_exit_5;
label$1_end_4:
    call push(1000000000.0);
    call loc1 := popArgs1();
label$3_start_7:
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_6;
    }
    call push(loc1);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc1 := popArgs1();
    goto label$3_start_7;
label$2_end_6:
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_9;
    }
    call push(45.0);
    call func_1();
label$4_end_9:
label$7_start_13:
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_12;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_15;
    }
    call push(0.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
label$8_end_15:
    // // unhandled raw instruction: i32.rem_u
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_1();
    call push(loc1);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc1 := popArgs1();
    goto label$7_start_13;
label$6_end_12:
func_exit_5:
}

procedure {:inline 1} func_5();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_5()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call func_17();
    call func_13();
}

procedure {:inline 1} func_6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_6()
{
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_16;
    }
    call push(0.0);
    call global_0 := popArgs1();
    call push(global_1);
    goto func_exit_18;
label$1_end_16:
    call fimport_1();
    call loc1 := popArgs1();
    call push(loc1);
    goto func_exit_18;
func_exit_18:
}

procedure {:inline 1} func_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
implementation func_7()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_19;
    }
    call push(11.0);
    call push(34.0);
    call func_2();
    call func_0();
label$1_end_19:
    call push(1.0);
    call global_0 := popArgs1();
    call push(arg1);
    call global_1 := popArgs1();
}

procedure {:inline 1} func_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_2;
modifies global_3;
implementation func_8()
{
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(global_2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_20;
    }
    call push(global_3);
    goto func_exit_22;
label$1_end_20:
    call push(1.0);
    call global_2 := popArgs1();
    call func_10();
    call loc1 := popArgs1();
    call push(loc1);
    call global_3 := popArgs1();
    call push(global_3);
    goto func_exit_22;
func_exit_22:
}

procedure {:inline 1} func_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_2;
implementation func_9()
{
    var arg1: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_23;
    }
    call push(49.0);
    call push(16.0);
    call func_2();
    call push(arg1);
    call func_1();
    call push(69.0);
    call push(2.0);
    call func_2();
    call func_0();
label$1_end_23:
    call push(0.0);
    call global_2 := popArgs1();
}

procedure {:inline 1} func_10();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_4;
implementation func_10()
{
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
label$2_start_25:
    call func_6();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
    call push(loc3);
    call func_12();
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_24;
    }
    goto label$2_start_25;
label$1_end_24:
    call push(loc3);
    call push(global_5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_27;
    }
    call push(global_6);
    goto func_exit_29;
label$3_end_27:
    call push(loc3);
    call push(global_26);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_30;
    }
    call push(global_7);
    goto func_exit_29;
label$4_end_30:
    call push(loc3);
    call push(global_17);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_32;
    }
    call push(global_9);
    goto func_exit_29;
label$5_end_32:
    call push(loc3);
    call push(global_18);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_34;
    }
    call push(global_10);
    goto func_exit_29;
label$6_end_34:
    call push(loc3);
    call push(global_19);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_36;
    }
    call push(global_11);
    goto func_exit_29;
label$7_end_36:
    call push(loc3);
    call push(global_20);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_38;
    }
    call push(global_12);
    goto func_exit_29;
label$8_end_38:
    call push(loc3);
    call push(global_21);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_40;
    }
    call push(global_13);
    goto func_exit_29;
label$9_end_40:
    call push(loc3);
    call push(global_22);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_42;
    }
    call push(global_14);
    goto func_exit_29;
label$10_end_42:
    call push(loc3);
    call func_11();
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_44;
    }
    call push(0.0);
    call global_4 := popArgs1();
label$13_start_46:
    call push(loc3);
    call func_11();
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_45;
    }
    call push(global_4);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(loc3);
    call push(global_15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_4 := popArgs1();
    call func_6();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
    goto label$13_start_46;
label$12_end_45:
    call push(loc3);
    call func_7();
    call push(global_8);
    goto func_exit_29;
label$11_end_44:
    call push(75.0);
    call push(27.0);
    call func_2();
    call func_0();
    call push(-1.0);
    goto func_exit_29;
func_exit_29:
}

procedure {:inline 1} func_11();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_11()
{
    var arg1: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg1);
    call push(global_15);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_49;
    }
    // // unhandled raw instruction: i32.and
    call loc2 := popArgs1();
label$1_end_49:
    call push(loc2);
    goto func_exit_50;
func_exit_50:
}

procedure {:inline 1} func_12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_12()
{
    var arg1: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg1);
    call push(global_23);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_52;
    }
    // // unhandled raw instruction: i32.or
    call loc2 := popArgs1();
label$2_end_52:
    call push(loc2);
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_51;
    }
    // // unhandled raw instruction: i32.or
    call loc2 := popArgs1();
label$1_end_51:
    call push(loc2);
    goto func_exit_53;
func_exit_53:
}

procedure {:inline 1} func_13();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_13()
{
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
label$2_start_55:
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call push(global_6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_54;
    }
    call func_14();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
    call push(global_7);
    call func_9();
    call push(106.0);
    call push(3.0);
    call func_2();
    call push(loc3);
    call func_4();
    call push(113.0);
    call push(2.0);
    call func_2();
    goto label$2_start_55;
label$1_end_54:
}

procedure {:inline 1} func_14();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_14()
{
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call func_15();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
label$2_start_58:
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call push(global_9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_60;
    }
    // // unhandled raw instruction: i32.or
    call loc2 := popArgs1();
label$3_end_60:
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_57;
    }
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call loc5 := popArgs1();
    call push(loc5);
    call func_9();
    call func_15();
    call loc1 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
    call push(loc5);
    call push(global_9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_62;
    }
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    goto label$4_end_61;
label$5_end_62:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
label$4_end_61:
    goto label$2_start_58;
label$1_end_57:
    call push(loc3);
    goto func_exit_63;
func_exit_63:
}

procedure {:inline 1} func_15();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_15()
{
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call func_16();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
label$2_start_65:
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call push(global_11);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_67;
    }
    // // unhandled raw instruction: i32.or
    call loc2 := popArgs1();
label$3_end_67:
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_64;
    }
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call loc5 := popArgs1();
    call push(loc5);
    call func_9();
    call func_16();
    call loc1 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
    call push(loc5);
    call push(global_11);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_69;
    }
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc3 := popArgs1();
    goto label$4_end_68;
label$5_end_69:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc3 := popArgs1();
label$4_end_68:
    goto label$2_start_65;
label$1_end_64:
    call push(loc3);
    goto func_exit_70;
func_exit_70:
}

procedure {:inline 1} func_16();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_16()
{
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
    call push(loc4);
    call push(global_13);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_72;
    }
    call push(global_13);
    call func_9();
    call func_14();
    call loc1 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
    call push(global_14);
    call func_9();
    goto label$1_end_71;
label$2_end_72:
    call push(loc4);
    call push(global_10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_73;
    }
    call push(global_10);
    call func_9();
    call push(0.0);
    call loc5 := popArgs1();
    call func_16();
    call loc1 := popArgs1();
    call push(loc5);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    goto label$1_end_71;
label$3_end_73:
    call push(loc4);
    call push(global_8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_75;
    }
    call push(global_8);
    call func_9();
    call push(global_4);
    call loc3 := popArgs1();
    goto label$1_end_71;
label$4_end_75:
    call push(119.0);
    call push(25.0);
    call func_2();
    call func_0();
label$1_end_71:
    call push(loc3);
    goto func_exit_76;
func_exit_76:
}

procedure {:inline 1} func_17();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_5;
modifies global_15;
modifies global_16;
modifies global_17;
modifies global_18;
modifies global_19;
modifies global_20;
modifies global_21;
modifies global_22;
modifies global_23;
modifies global_24;
modifies global_25;
modifies global_26;
modifies global_6;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_7;
implementation func_17()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(0.0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_5 := popArgs1();
    call push(48.0);
    call global_15 := popArgs1();
    call push(57.0);
    call global_16 := popArgs1();
    call push(43.0);
    call global_17 := popArgs1();
    call push(45.0);
    call global_18 := popArgs1();
    call push(42.0);
    call global_19 := popArgs1();
    call push(47.0);
    call global_20 := popArgs1();
    call push(40.0);
    call global_21 := popArgs1();
    call push(41.0);
    call global_22 := popArgs1();
    call push(32.0);
    call global_23 := popArgs1();
    call push(9.0);
    call global_24 := popArgs1();
    call push(13.0);
    call global_25 := popArgs1();
    call push(10.0);
    call global_26 := popArgs1();
    call push(256.0);
    call global_6 := popArgs1();
    call push(257.0);
    call global_8 := popArgs1();
    call push(global_17);
    call global_9 := popArgs1();
    call push(global_18);
    call global_10 := popArgs1();
    call push(global_19);
    call global_11 := popArgs1();
    call push(global_20);
    call global_12 := popArgs1();
    call push(global_21);
    call global_13 := popArgs1();
    call push(global_22);
    call global_14 := popArgs1();
    call push(global_26);
    call global_7 := popArgs1();
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

procedure {:inline 1} CorralChoice__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
modifies global_6;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
modifies global_16;
modifies global_17;
modifies global_18;
modifies global_19;
modifies global_20;
modifies global_21;
modifies global_22;
modifies global_23;
modifies global_24;
modifies global_25;
modifies global_26;
implementation CorralChoice__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (21)));
    if ((c) == (0)) {
        call fimport_0();
    } else if ((c) == (1)) {
        call fimport_1();
        call popDiscard1();
    } else if ((c) == (2)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_2();
    } else if ((c) == (3)) {
        call func_0();
    } else if ((c) == (4)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_1();
    } else if ((c) == (5)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
    } else if ((c) == (6)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_3();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_4();
    } else if ((c) == (8)) {
        call func_5();
    } else if ((c) == (9)) {
        call func_6();
        call popDiscard1();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_7();
    } else if ((c) == (11)) {
        call func_8();
        call popDiscard1();
    } else if ((c) == (12)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_9();
    } else if ((c) == (13)) {
        call func_10();
        call popDiscard1();
    } else if ((c) == (14)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_11();
        call popDiscard1();
    } else if ((c) == (15)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_12();
        call popDiscard1();
    } else if ((c) == (16)) {
        call func_13();
    } else if ((c) == (17)) {
        call func_14();
        call popDiscard1();
    } else if ((c) == (18)) {
        call func_15();
        call popDiscard1();
    } else if ((c) == (19)) {
        call func_16();
        call popDiscard1();
    } else if ((c) == (20)) {
        call func_17();
    }
}

procedure BoogieEntry__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
modifies global_6;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
modifies global_16;
modifies global_17;
modifies global_18;
modifies global_19;
modifies global_20;
modifies global_21;
modifies global_22;
modifies global_23;
modifies global_24;
modifies global_25;
modifies global_26;
implementation BoogieEntry__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (21)));
        if ((c) == (0)) {
            call fimport_0();
        } else if ((c) == (1)) {
            call fimport_1();
            call popDiscard1();
        } else if ((c) == (2)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_2();
        } else if ((c) == (3)) {
            call func_0();
        } else if ((c) == (4)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_1();
        } else if ((c) == (5)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
        } else if ((c) == (6)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_3();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_4();
        } else if ((c) == (8)) {
            call func_5();
        } else if ((c) == (9)) {
            call func_6();
            call popDiscard1();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_7();
        } else if ((c) == (11)) {
            call func_8();
            call popDiscard1();
        } else if ((c) == (12)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_9();
        } else if ((c) == (13)) {
            call func_10();
            call popDiscard1();
        } else if ((c) == (14)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_11();
            call popDiscard1();
        } else if ((c) == (15)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_12();
            call popDiscard1();
        } else if ((c) == (16)) {
            call func_13();
        } else if ((c) == (17)) {
            call func_14();
            call popDiscard1();
        } else if ((c) == (18)) {
            call func_15();
            call popDiscard1();
        } else if ((c) == (19)) {
            call func_16();
            call popDiscard1();
        } else if ((c) == (20)) {
            call func_17();
        }
    }
}

procedure CorralEntry__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
modifies global_6;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
modifies global_16;
modifies global_17;
modifies global_18;
modifies global_19;
modifies global_20;
modifies global_21;
modifies global_22;
modifies global_23;
modifies global_24;
modifies global_25;
modifies global_26;
implementation CorralEntry__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__688a3b68798b5be5df5be9d0da1d0a7bb6fb688b0afd5762e31ca471851f72b6();
    }
}

