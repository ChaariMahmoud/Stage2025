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

procedure {:inline 1} initGlobals();
implementation initGlobals()
{
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
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(136.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(152.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(168.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(176.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(184.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
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
    call push(arg1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call push(200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    // // wrap: no-op under real semantics
    call loc3 := popArgs1();
label$2_start_2:
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    call push(loc3);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(loc1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s64(idx);
        call push(int_to_real(load_i));
        // // unhandled raw instruction: i64.extend_i32_u
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u64(idx, store_i);
        call push(0.0);
        call loc3 := popArgs1();
        call push(arg1);
        call func_3();
    }
    call push(arg1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    goto label$2_start_2;
label$1_end_1:
    call push(loc2);
    // // unhandled raw instruction: i64.extend_i32_u
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
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
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(arg1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call push(200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    // // wrap: no-op under real semantics
    call loc3 := popArgs1();
label$2_start_6:
    call push(loc3);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_5;
    }
    call push(arg1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    goto label$2_start_6;
label$1_end_5:
    call push(loc2);
    // // unhandled raw instruction: i64.extend_i32_u
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call func_3();
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
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
    call push(arg1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc33 := popArgs1();
    call push(arg1);
    call push(136.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc34 := popArgs1();
    call push(arg1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc35 := popArgs1();
    call push(arg1);
    call push(152.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc36 := popArgs1();
    call push(arg1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc37 := popArgs1();
    call push(arg1);
    call push(168.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc38 := popArgs1();
    call push(arg1);
    call push(176.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc39 := popArgs1();
    call push(arg1);
    call push(184.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc40 := popArgs1();
    call push(loc33);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc34);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc35);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc36);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc37);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc38);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc39);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc40);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(2147483647.0);
    call loc9 := popArgs1();
    call push(-2147483648.0);
    call loc10 := popArgs1();
    call push(2147483647.0);
    call loc11 := popArgs1();
    call push(-2147483648.0);
    call loc12 := popArgs1();
    call push(2147483647.0);
    call loc13 := popArgs1();
    call push(-2147483648.0);
    call loc14 := popArgs1();
    call push(2147483647.0);
    call loc15 := popArgs1();
    call push(2147483647.0);
    call loc16 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc17 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc18 := popArgs1();
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc19 := popArgs1();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc20 := popArgs1();
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc21 := popArgs1();
    call push(arg1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc22 := popArgs1();
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc23 := popArgs1();
    call push(arg1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc24 := popArgs1();
    call push(arg1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc25 := popArgs1();
    call push(arg1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc26 := popArgs1();
    call push(arg1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc27 := popArgs1();
    call push(arg1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc28 := popArgs1();
    call push(arg1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc29 := popArgs1();
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc30 := popArgs1();
    call push(arg1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc31 := popArgs1();
    call push(arg1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc32 := popArgs1();
    // // unhandled raw instruction: i64.xor
    call loc13 := popArgs1();
    // // unhandled raw instruction: i64.xor
    call loc15 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc31);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(loc27);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc9);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc21);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc6);
    call push(loc25);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc10);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc26);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc7);
    call push(loc32);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc11);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc30);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc8);
    call push(loc23);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc12);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc18);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc6);
    call push(loc29);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc16 := popArgs1();
    call push(loc11);
    call push(loc16);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc17);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc2);
    call push(loc7);
    call push(loc19);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc13 := popArgs1();
    call push(loc12);
    call push(loc13);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc7 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc28);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(loc24);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc14 := popArgs1();
    call push(loc9);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc8 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc22);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc4);
    call push(loc5);
    call push(loc20);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc15 := popArgs1();
    call push(loc10);
    call push(loc15);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    // // unhandled raw instruction: i64.rotr
    call loc5 := popArgs1();
    call push(loc33);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc34);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc35);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc36);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc37);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc38);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc39);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc40);
    // // unhandled raw instruction: i64.xor
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
}

procedure {:inline 1} CorralChoice__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation CorralChoice__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (4)));
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
        call func_2();
    } else if ((c) == (3)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_3();
    }
}

procedure BoogieEntry__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation BoogieEntry__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (4)));
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
            call func_2();
        } else if ((c) == (3)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_3();
        }
    }
}

procedure CorralEntry__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation CorralEntry__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__009ed0feb5360b8d6bdd6df2010e0a5bf90d6c4ab510007309880d61018fd58e();
    }
}

