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
const global_2: real;

axiom((global_2) == (3.0));
const global_3: real;

axiom((global_3) == (400.0));
procedure {:inline 1} initGlobals();
modifies global_0;
modifies global_1;
ensures((global_0) == (0.0));
ensures((global_1) == (0.0));
implementation initGlobals()
{
    global_0 := 0.0;
    global_1 := 0.0;
}

procedure {:inline 1} abort();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation abort()
{
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

procedure {:inline 1} fimport_0();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_0()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
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
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(277.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(279.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.shr_u
        call loc1 := popArgs1();
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        // // unhandled raw instruction: i32.xor
        call loc1 := popArgs1();
        call push(loc2);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call loc2 := popArgs1();
    call push(loc2);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(292.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc4);
        call push(loc3);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (20);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call push(loc4);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg2);
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc3);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (96);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(loc3);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            // // unhandled raw instruction: i32.and
            call arg2 := popArgs1();
            call push(arg2);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg2);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(arg1);
                // // unhandled raw instruction: i32.and
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
            }
        }
    }
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
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var loc6: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(205.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(207.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(loc1);
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc3);
            call func_0();
            call push(arg2);
            // // unhandled raw instruction: i32.or
            call loc2 := popArgs1();
            call push(loc2);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg2);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc3 := popArgs1();
            call push(loc3);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc4 := popArgs1();
        }
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(228.0);
            call push(15.0);
            call fimport_0();
            assume (false);
        }
        // // unhandled raw instruction: i32.and
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc6 := popArgs1();
        call push(loc6);
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc1);
            call func_0();
            call push(loc1);
            // // unhandled raw instruction: i32.or
            call loc2 := popArgs1();
            call push(loc2);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc1);
            call arg2 := popArgs1();
        }
    }
    call push(loc3);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(243.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(244.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(loc3);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.shr_u
        call loc3 := popArgs1();
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        // // unhandled raw instruction: i32.xor
        call loc3 := popArgs1();
        call push(loc1);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call loc2 := popArgs1();
    call push(loc2);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(260.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(arg2);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
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
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call push(0.0);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call push(0.0);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
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
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(386.0);
        call push(4.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1568);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(loc1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(396.0);
            call push(15.0);
            call fimport_0();
            assume (false);
        }
        call push(loc1);
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc2 := popArgs1();
            call push(arg2);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call arg2 := popArgs1();
        }
    } else {
        call push(arg2);
        call push(arg1);
        call push(1572.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(408.0);
            call push(4.0);
            call fimport_0();
            assume (false);
        }
    }
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto func_exit_37;
    }
    call push(arg2);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1568);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call func_1();
func_exit_37:
}

procedure {:inline 1} func_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_3()
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
    call push(global_0);
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        // // unsupported memory op: memory.size
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(1.0);
            call push(loc1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            // // unsupported memory op: memory.grow
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp2();
            $tmp3 := $tmp2;
        } else {
            call push(0.0);
            call popToTmp2();
            $tmp3 := $tmp2;
        }
        call push($tmp3);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            assume (false);
        }
        call push(448.0);
        call loc1 := popArgs1();
        call push(loc1);
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(2016.0);
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
label$5_start_43:
        call push(loc2);
        call push(23.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            // // unhandled raw instruction: i32.shl
            call push(448.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(0.0);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(0.0);
            call loc3 := popArgs1();
label$7_start_46:
            call push(loc3);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                // // unhandled raw instruction: i32.shl
                call push(448.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(0.0);
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (96);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(loc3);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc3 := popArgs1();
                goto label$7_start_46;
            }
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            goto label$5_start_43;
        }
        call push(448.0);
        call push(2032.0);
        // // unhandled raw instruction: i32.shl
        call func_2();
        call push(448.0);
        call global_0 := popArgs1();
    }
    call push(loc1);
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(80.0);
        call push(32.0);
        call push(457.0);
        call push(29.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call arg1 := popArgs1();
    call push(arg1);
    call push(16.0);
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
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
    call push(arg2);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.shr_u
        call arg2 := popArgs1();
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(arg2);
        call push(536870912.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg2);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call arg2 := popArgs1();
        }
        // // unhandled raw instruction: i32.xor
        call arg2 := popArgs1();
        call push(loc1);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call loc1 := popArgs1();
    call push(loc1);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(338.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (96);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        // // unhandled raw instruction: i32.and
        call arg2 := popArgs1();
        call push(arg2);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(32.0);
                call push(351.0);
                call push(17.0);
                call fimport_0();
                assume (false);
            }
            call push(arg1);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (96);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call popToTmp2();
            $tmp3 := $tmp2;
        } else {
            call push(0.0);
            call popToTmp2();
            $tmp3 := $tmp2;
        }
        call push($tmp3);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
}

procedure {:inline 1} func_6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_6()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc1 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.shr_u
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.grow
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        // // unsupported memory op: memory.grow
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            assume (false);
        }
    }
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    // // unhandled raw instruction: i32.shl
    call func_2();
}

procedure {:inline 1} func_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_7()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(365.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i32.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg3);
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg2);
        // // unhandled raw instruction: i32.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg1);
        call push(arg2);
        call func_1();
    } else {
        call push(arg2);
        // // unhandled raw instruction: i32.and
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        // // unhandled raw instruction: i32.and
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
}

procedure {:inline 1} func_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_1;
implementation func_8()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(global_1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(490.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call push(arg2);
    call func_4();
    call loc2 := popArgs1();
    call push(loc2);
    call func_5();
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        call global_1 := popArgs1();
        call push(0.0);
        call global_1 := popArgs1();
        call push(arg1);
        call push(loc2);
        call func_5();
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc2);
            call func_6();
            call push(arg1);
            call push(loc2);
            call func_5();
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(32.0);
                call push(502.0);
                call push(19.0);
                call fimport_0();
                assume (false);
            }
        }
    }
    // // unhandled raw instruction: i32.and
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(510.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc1);
    call func_0();
    call push(arg1);
    call push(loc1);
    call push(loc2);
    call func_7();
    call push(loc1);
}

procedure {:inline 1} func_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_9()
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
    call func_3();
    call push(arg1);
    call push(arg2);
    call func_8();
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
}

procedure {:inline 1} func_10();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_10()
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
    // // unhandled raw instruction: i32.and
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(109.0);
        call push(2.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(112.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(436.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call func_10();
    }
    call push(arg1);
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(436.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call func_32();
    }
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
    var arg1: real;
    var arg2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(192.0);
        call push(256.0);
        call push(93.0);
        call push(41.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
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
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call push(0.0);
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
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(0.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(570.0);
        call push(2.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
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
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg3);
    call loc1 := popArgs1();
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_80;
    }
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
label$4_start_83:
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call popToTmp1();
                call push(bool_to_real(($tmp1) == (0.0)));
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    goto label$1_end_80;
                }
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) - ($tmp1));
                call loc1 := popArgs1();
                call push(arg1);
                call arg3 := popArgs1();
                call push(arg3);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call arg1 := popArgs1();
                call push(arg2);
                call loc2 := popArgs1();
                call push(loc2);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call arg2 := popArgs1();
                call push(arg3);
                call push(loc2);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_u8(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                goto label$4_start_83;
            }
label$6_start_88:
            call push(loc1);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) >= ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(arg1);
                call push(arg2);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_s64(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u64(idx, store_i);
                call push(loc1);
                call push(8.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) - ($tmp1));
                call loc1 := popArgs1();
                call push(arg1);
                call push(8.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call arg1 := popArgs1();
                call push(arg2);
                call push(8.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call arg2 := popArgs1();
                goto label$6_start_88;
            }
        }
label$8_start_91:
        call push(loc1);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call arg3 := popArgs1();
            call push(arg3);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg1 := popArgs1();
            call push(arg2);
            call loc2 := popArgs1();
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            call push(arg3);
            call push(loc2);
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
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc1 := popArgs1();
            goto label$8_start_91;
        }
    } else {
        // // unhandled raw instruction: i32.and
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
label$12_start_98:
            // // unhandled raw instruction: i32.and
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call popToTmp1();
                call push(bool_to_real(($tmp1) == (0.0)));
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    goto label$1_end_80;
                }
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) - ($tmp1));
                call loc1 := popArgs1();
                call push(loc1);
                call push(arg1);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg2);
                call push(loc1);
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
                goto label$12_start_98;
            }
label$14_start_102:
            call push(loc1);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) >= ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call push(8.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) - ($tmp1));
                call loc1 := popArgs1();
                call push(loc1);
                call push(arg1);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg2);
                call push(loc1);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_s64(idx);
                call push(int_to_real(load_i));
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u64(idx, store_i);
                goto label$14_start_102;
            }
        }
label$16_start_106:
        call push(loc1);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc1 := popArgs1();
            call push(loc1);
            call push(arg1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(arg2);
            call push(loc1);
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
            goto label$16_start_106;
        }
    }
label$1_end_80:
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
    var arg1: real;
    var arg2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    call push(arg2);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call func_1();
}

procedure {:inline 1} func_17();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_17()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
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
    call push(arg3);
    call func_4();
    call loc1 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(arg2);
        call push(loc1);
        call func_7();
        call push(arg2);
        call push(arg3);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (12);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg2);
        goto func_exit_113;
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc2 := popArgs1();
        call push(loc2);
        call push(loc1);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc4);
            call func_0();
            call push(arg2);
            // // unhandled raw instruction: i32.or
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg2);
            call push(arg3);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (12);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg1);
            call push(arg2);
            call push(loc1);
            call func_7();
            call push(arg2);
            goto func_exit_113;
        }
    }
    call push(arg1);
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_8();
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call func_15();
    call push(arg2);
    call push(436.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(arg2);
        call func_16();
    }
    call push(loc1);
func_exit_113:
}

procedure {:inline 1} func_18();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_18()
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
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg2);
    // // unhandled raw instruction: i32.and
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i32.and
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
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
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_118;
    }
    call push(arg1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
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
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
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
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i32.and
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg2 := popArgs1();
label$2_start_126:
    call push(arg2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
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
        call push(arg2);
        call push(32.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg2 := popArgs1();
        call push(arg1);
        call push(32.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        goto label$2_start_126;
    }
label$1_end_118:
}

procedure {:inline 1} func_19();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_19()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(arg2);
    // // unhandled raw instruction: i32.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(304.0);
            call push(256.0);
            call push(14.0);
            call push(47.0);
            call fimport_0();
            assume (false);
        }
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(loc1);
        call func_3();
        call push(loc2);
        call func_14();
        // // unhandled raw instruction: i32.shl
        call loc3 := popArgs1();
        call push(loc3);
        call func_17();
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg2);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc3);
        call push(loc1);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call func_18();
        call push(arg2);
        call push(loc2);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) != ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(arg2);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg1);
            call push(arg2);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
        }
        call push(arg1);
        call push(loc3);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
}

procedure {:inline 1} func_20();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_20()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(192.0);
            call push(256.0);
            call push(109.0);
            call push(21.0);
            call fimport_0();
            assume (false);
        }
        call push(arg1);
        call push(arg2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(loc1);
        call func_19();
        call push(arg1);
        call push(loc1);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (12);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} func_21();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_21()
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
    call push(2.0);
    call push(arg1);
    call push(0.0);
    call func_13();
    call push(arg1);
    call push(1.0);
    call func_13();
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_20();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
}

procedure {:inline 1} func_22();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_22()
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
label$1_start_137:
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(loc1);
        call push(arg1);
        call push(loc1);
        call func_13();
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call func_20();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_137;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
}

procedure {:inline 1} func_23();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_23()
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
    call push(16.0);
    call push(3.0);
    call func_9();
    call loc1 := popArgs1();
    call push(loc1);
    call push(0.0);
    call push(0.0);
    call func_9();
    call loc2 := popArgs1();
    call push(loc2);
    call func_11();
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(arg1);
        call push(0.0);
        call func_15();
    }
    call push(loc1);
}

procedure {:inline 1} func_24();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_24()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call func_19();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} func_25();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_25()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(352.0);
    call func_23();
    call func_11();
    call loc2 := popArgs1();
label$1_start_144:
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(arg1);
        call push(loc1);
        call func_13();
        call push(arg2);
        call push(loc1);
        call func_13();
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call func_24();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_144;
    }
    call push(loc2);
}

procedure {:inline 1} func_26();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_26()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(368.0);
    call func_23();
    call func_11();
    call loc2 := popArgs1();
label$1_start_147:
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(loc1);
        call push(arg1);
        call push(loc1);
        call func_13();
        call push(arg2);
        call push(loc1);
        call func_13();
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call func_20();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_147;
    }
    call push(loc2);
}

procedure {:inline 1} func_27();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_27()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(384.0);
    call func_23();
    call func_11();
    call loc2 := popArgs1();
label$1_start_150:
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(loc1);
        call push(arg1);
        call push(loc1);
        call func_13();
        call push(arg2);
        call push(loc1);
        call func_13();
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call func_20();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_150;
    }
    call push(loc2);
}

procedure {:inline 1} func_28();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_28()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
label$1_start_153:
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(arg3);
        call push(loc1);
        call func_13();
        call push(arg2);
        call push(loc1);
        call func_13();
        call func_20();
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_153;
    }
}

procedure {:inline 1} popArgs7() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (7));
ensures(($sp) == ((old($sp)) - (7)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (7)]));
ensures((a2) == (old($stack)[(old($sp)) - (6)]));
ensures((a3) == (old($stack)[(old($sp)) - (5)]));
ensures((a4) == (old($stack)[(old($sp)) - (4)]));
ensures((a5) == (old($stack)[(old($sp)) - (3)]));
ensures((a6) == (old($stack)[(old($sp)) - (2)]));
ensures((a7) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs7() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real)
{
    $sp := ($sp) - (1);
    a7 := $stack[$sp];
    $sp := ($sp) - (1);
    a6 := $stack[$sp];
    $sp := ($sp) - (1);
    a5 := $stack[$sp];
    $sp := ($sp) - (1);
    a4 := $stack[$sp];
    $sp := ($sp) - (1);
    a3 := $stack[$sp];
    $sp := ($sp) - (1);
    a2 := $stack[$sp];
    $sp := ($sp) - (1);
    a1 := $stack[$sp];
}

procedure {:inline 1} func_29();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_29()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var arg6: real;
    var arg7: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (7));
    call arg1, arg2, arg3, arg4, arg5, arg6, arg7 := popArgs7();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(400.0);
    call func_23();
    call func_11();
    call loc2 := popArgs1();
    call push(0.0);
    call arg5 := popArgs1();
label$1_start_156:
    call push(arg5);
    call push(arg7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg3);
        call push(arg1);
        call push(arg4);
        call push(arg2);
        call push(arg5);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call loc3 := popArgs1();
        call push(0.0);
        call loc1 := popArgs1();
label$3_start_159:
        call push(loc1);
        call push(arg3);
        call push(arg6);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc2);
            call push(loc1);
            call push(loc3);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call func_24();
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            goto label$3_start_159;
        }
        call push(arg5);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg5 := popArgs1();
        goto label$1_start_156;
    }
    call push(loc2);
}

procedure {:inline 1} func_30();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_30()
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
    call push(2000000.0);
    call push(9.0);
    call func_20();
}

procedure {:inline 1} func_31();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_31()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} func_32();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_32()
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
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(122.0);
        call push(13.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call func_33();
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(144.0);
            call push(126.0);
            call push(17.0);
            call fimport_0();
            assume (false);
        }
        call push(global_0);
        call push(arg1);
        call func_16();
    } else {
        call push(loc1);
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) <= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(144.0);
            call push(136.0);
            call push(15.0);
            call fimport_0();
            assume (false);
        }
        call push(arg1);
        // // unhandled raw instruction: i32.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
}

procedure {:inline 1} func_33();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_33()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (4))) {
        goto label$2_end_168;
    } else {
        if ((idx) == (0)) {
            goto label$3_end_169;
        }
        if ((idx) == (1)) {
            goto label$3_end_169;
        }
        if ((idx) == (2)) {
            goto label$1_end_167;
        }
        if ((idx) == (3)) {
            goto label$1_end_167;
        }
        goto label$2_end_168;
    }
label$3_end_169:
    goto func_exit_170;
label$2_end_168:
    assume (false);
label$1_end_167:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(436.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call func_32();
        }
    }
func_exit_170:
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

procedure {:inline 1} CorralChoice__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
implementation CorralChoice__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (35)));
    if ((c) == (0)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_0();
    } else if ((c) == (1)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_0();
    } else if ((c) == (2)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_1();
    } else if ((c) == (3)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
    } else if ((c) == (4)) {
        call func_3();
        call popDiscard1();
    } else if ((c) == (5)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_4();
        call popDiscard1();
    } else if ((c) == (6)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_5();
        call popDiscard1();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_6();
    } else if ((c) == (8)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_7();
    } else if ((c) == (9)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_8();
        call popDiscard1();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_9();
        call popDiscard1();
    } else if ((c) == (11)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_10();
    } else if ((c) == (12)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_11();
        call popDiscard1();
    } else if ((c) == (13)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_12();
    } else if ((c) == (14)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_13();
        call popDiscard1();
    } else if ((c) == (15)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_14();
        call popDiscard1();
    } else if ((c) == (16)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_15();
    } else if ((c) == (17)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_16();
    } else if ((c) == (18)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_17();
        call popDiscard1();
    } else if ((c) == (19)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_18();
    } else if ((c) == (20)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_19();
    } else if ((c) == (21)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_20();
    } else if ((c) == (22)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_21();
        call popDiscard1();
    } else if ((c) == (23)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_22();
        call popDiscard1();
    } else if ((c) == (24)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_23();
        call popDiscard1();
    } else if ((c) == (25)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_24();
    } else if ((c) == (26)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_25();
        call popDiscard1();
    } else if ((c) == (27)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_26();
        call popDiscard1();
    } else if ((c) == (28)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_27();
        call popDiscard1();
    } else if ((c) == (29)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_28();
    } else if ((c) == (30)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_29();
        call popDiscard1();
    } else if ((c) == (31)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_30();
    } else if ((c) == (32)) {
        call func_31();
    } else if ((c) == (33)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_32();
    } else if ((c) == (34)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_33();
    }
}

procedure BoogieEntry__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
implementation BoogieEntry__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (35)));
        if ((c) == (0)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_0();
        } else if ((c) == (1)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_0();
        } else if ((c) == (2)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_1();
        } else if ((c) == (3)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
        } else if ((c) == (4)) {
            call func_3();
            call popDiscard1();
        } else if ((c) == (5)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_4();
            call popDiscard1();
        } else if ((c) == (6)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_5();
            call popDiscard1();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_6();
        } else if ((c) == (8)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_7();
        } else if ((c) == (9)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_8();
            call popDiscard1();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_9();
            call popDiscard1();
        } else if ((c) == (11)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_10();
        } else if ((c) == (12)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_11();
            call popDiscard1();
        } else if ((c) == (13)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_12();
        } else if ((c) == (14)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_13();
            call popDiscard1();
        } else if ((c) == (15)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_14();
            call popDiscard1();
        } else if ((c) == (16)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_15();
        } else if ((c) == (17)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_16();
        } else if ((c) == (18)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_17();
            call popDiscard1();
        } else if ((c) == (19)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_18();
        } else if ((c) == (20)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_19();
        } else if ((c) == (21)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_20();
        } else if ((c) == (22)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_21();
            call popDiscard1();
        } else if ((c) == (23)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_22();
            call popDiscard1();
        } else if ((c) == (24)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_23();
            call popDiscard1();
        } else if ((c) == (25)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_24();
        } else if ((c) == (26)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_25();
            call popDiscard1();
        } else if ((c) == (27)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_26();
            call popDiscard1();
        } else if ((c) == (28)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_27();
            call popDiscard1();
        } else if ((c) == (29)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_28();
        } else if ((c) == (30)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_29();
            call popDiscard1();
        } else if ((c) == (31)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_30();
        } else if ((c) == (32)) {
            call func_31();
        } else if ((c) == (33)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_32();
        } else if ((c) == (34)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_33();
        }
    }
}

procedure CorralEntry__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
implementation CorralEntry__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__525f78b70d88b4f4c1a7dd1ff09fc3c862c4988b2733e2d48b2a304d40f21141();
    }
}

