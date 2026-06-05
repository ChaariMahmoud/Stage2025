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
const global_3: real;

axiom((global_3) == (176.0));
const global_4: real;

axiom((global_4) == (204.0));
procedure {:inline 1} initGlobals();
modifies global_0;
modifies global_1;
modifies global_2;
ensures((global_0) == (0.0));
ensures((global_1) == (0.0));
ensures((global_2) == (1.0));
implementation initGlobals()
{
    global_0 := 0.0;
    global_1 := 0.0;
    global_2 := 1.0;
}

procedure {:inline 1} _lib_builtins_abort();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation _lib_builtins_abort()
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

procedure {:inline 1} _lib_rt_tlsf_removeBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_removeBlock()
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
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    loc10 := 0.0;
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(277.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call loc2 := popArgs1();
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
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
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc2);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc3 := popArgs1();
        // // unhandled raw instruction: i32.shr_u
        call loc4 := popArgs1();
    } else {
        call push(31.0);
        // // unhandled raw instruction: i32.clz
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc3 := popArgs1();
        // // unhandled raw instruction: i32.xor
        call loc4 := popArgs1();
        call push(loc3);
        call push(8.0);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc3 := popArgs1();
    }
    call push(loc3);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc4);
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
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc5);
        call push(loc6);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (20);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(loc6);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc6);
        call push(loc5);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg2);
    call push(arg1);
    call loc9 := popArgs1();
    call push(loc3);
    call loc8 := popArgs1();
    call push(loc4);
    call loc7 := popArgs1();
    call push(loc9);
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
        call loc10 := popArgs1();
        call push(loc3);
        call loc9 := popArgs1();
        call push(loc4);
        call loc8 := popArgs1();
        call push(loc6);
        call loc7 := popArgs1();
        call push(loc10);
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc7);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (96);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(loc6);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call loc8 := popArgs1();
            call push(loc3);
            call loc7 := popArgs1();
            call push(loc8);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc8 := popArgs1();
            call push(arg1);
            call loc7 := popArgs1();
            call push(loc3);
            call loc10 := popArgs1();
            // // unhandled raw instruction: i32.and
            call loc8 := popArgs1();
            call push(loc8);
            call loc9 := popArgs1();
            call push(loc7);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc9);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc8);
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

procedure {:inline 1} _lib_rt_tlsf_insertBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_insertBlock()
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
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    loc10 := 0.0;
    loc11 := 0.0;
    loc12 := 0.0;
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(205.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(207.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call loc2 := popArgs1();
    call push(loc2);
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
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc3);
            call _lib_rt_tlsf_removeBlock();
            call push(arg2);
            // // unhandled raw instruction: i32.or
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg2);
            call loc5 := popArgs1();
            call push(loc5);
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
        call push(arg2);
        call loc5 := popArgs1();
        call push(loc5);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc5 := popArgs1();
        call push(loc5);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(228.0);
            call push(15.0);
            call _lib_builtins_abort();
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
            call push(loc5);
            call _lib_rt_tlsf_removeBlock();
            call push(loc5);
            // // unhandled raw instruction: i32.or
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc5);
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
    call loc7 := popArgs1();
    call push(loc7);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc7);
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
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(244.0);
        call push(13.0);
        call _lib_builtins_abort();
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
    call push(loc7);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc8 := popArgs1();
        // // unhandled raw instruction: i32.shr_u
        call loc9 := popArgs1();
    } else {
        call push(31.0);
        // // unhandled raw instruction: i32.clz
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc8 := popArgs1();
        // // unhandled raw instruction: i32.xor
        call loc9 := popArgs1();
        call push(loc8);
        call push(8.0);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc8 := popArgs1();
    }
    call push(loc8);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc9);
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
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call loc6 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(loc9);
    call loc5 := popArgs1();
    call push(loc6);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc10);
        call push(arg2);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg1);
    call loc11 := popArgs1();
    call push(loc8);
    call loc6 := popArgs1();
    call push(loc9);
    call loc2 := popArgs1();
    call push(arg2);
    call loc5 := popArgs1();
    call push(loc11);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
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
    call loc12 := popArgs1();
    call push(loc8);
    call loc11 := popArgs1();
    // // unhandled raw instruction: i32.or
    call loc6 := popArgs1();
    call push(loc12);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
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

procedure {:inline 1} _lib_rt_tlsf_addMemory();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_addMemory()
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
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
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
        call push(386.0);
        call push(4.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1568);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(loc2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(396.0);
            call push(15.0);
            call _lib_builtins_abort();
            assume (false);
        }
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(loc2);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg2);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call arg2 := popArgs1();
            call push(loc2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc3 := popArgs1();
        } else {
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
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(32.0);
            call push(408.0);
            call push(4.0);
            call _lib_builtins_abort();
            assume (false);
        }
    }
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        goto func_exit_40;
    }
    call push(loc4);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(arg2);
    call loc6 := popArgs1();
    call push(loc6);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call loc7 := popArgs1();
    call push(loc2);
    call loc1 := popArgs1();
    call push(loc7);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1568);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc6);
    call _lib_rt_tlsf_insertBlock();
    call push(1.0);
func_exit_40:
}

procedure {:inline 1} _lib_rt_tlsf_maybeInitialize();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation _lib_rt_tlsf_maybeInitialize()
{
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
    loc6 := 0.0;
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    loc10 := 0.0;
    loc11 := 0.0;
    loc12 := 0.0;
    call push(global_0);
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call loc2 := popArgs1();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        // // unsupported memory op: memory.size
        call loc3 := popArgs1();
        // // unhandled raw instruction: i32.shr_u
        call loc4 := popArgs1();
        call push(loc4);
        call push(loc3);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc4);
            call push(loc3);
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
        call push(loc2);
        call loc1 := popArgs1();
        call push(loc1);
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(loc1);
        call loc6 := popArgs1();
        call push(0.0);
        call loc5 := popArgs1();
        call push(loc6);
        call push(loc5);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (1568);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(0.0);
        call loc6 := popArgs1();
label$7_start_45:
        call push(loc6);
        call push(23.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call loc5 := popArgs1();
        call push(loc5);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call loc9 := popArgs1();
            call push(loc6);
            call loc8 := popArgs1();
            call push(0.0);
            call loc7 := popArgs1();
            call push(loc9);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc7);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(0.0);
            call loc9 := popArgs1();
label$12_start_51:
            call push(loc9);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call loc8 := popArgs1();
            call push(loc8);
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call loc12 := popArgs1();
                call push(loc6);
                call loc11 := popArgs1();
                call push(loc9);
                call loc10 := popArgs1();
                call push(0.0);
                call loc7 := popArgs1();
                call push(loc12);
                // // unhandled raw instruction: i32.shl
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(loc7);
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (96);
                store_i := real_to_int($tmp2);
                call mem_write_u32(idx, store_i);
                call push(loc9);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc9 := popArgs1();
                goto label$12_start_51;
            }
            call push(loc6);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc6 := popArgs1();
            goto label$7_start_45;
        }
        call push(loc1);
        // // unhandled raw instruction: i32.and
        // // unhandled raw instruction: i32.shl
        call _lib_rt_tlsf_addMemory();
        call pop();
        call push(loc1);
        call global_0 := popArgs1();
    }
    call push(loc1);
}

procedure {:inline 1} _lib_rt_tlsf_prepareSize();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_prepareSize()
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
        call _lib_builtins_abort();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    call push(loc1);
    call push(16.0);
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call push(loc2);
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

procedure {:inline 1} _lib_rt_tlsf_searchBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_searchBlock()
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
    loc7 := 0.0;
    loc8 := 0.0;
    call push(arg2);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc1 := popArgs1();
        // // unhandled raw instruction: i32.shr_u
        call loc2 := popArgs1();
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
            call popToTmp2();
            $tmp3 := $tmp2;
        } else {
            call push(arg2);
            call popToTmp2();
            $tmp3 := $tmp2;
        }
        call push($tmp3);
        call loc3 := popArgs1();
        call push(31.0);
        // // unhandled raw instruction: i32.clz
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
        // // unhandled raw instruction: i32.xor
        call loc2 := popArgs1();
        call push(loc1);
        call push(8.0);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
    }
    call push(loc1);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
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
        call _lib_builtins_abort();
        assume (false);
    }
    // // unhandled raw instruction: i32.and
    call loc5 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: i32.and
        call loc4 := popArgs1();
        call push(loc4);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call loc6 := popArgs1();
        } else {
            // // unhandled raw instruction: i32.ctz
            call loc1 := popArgs1();
            call push(arg1);
            call loc7 := popArgs1();
            call push(loc1);
            call loc3 := popArgs1();
            call push(loc7);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc5 := popArgs1();
            call push(loc5);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(32.0);
                call push(351.0);
                call push(17.0);
                call _lib_builtins_abort();
                assume (false);
            }
            call push(arg1);
            call loc8 := popArgs1();
            call push(loc1);
            call loc7 := popArgs1();
            // // unhandled raw instruction: i32.ctz
            call loc3 := popArgs1();
            call push(loc8);
            // // unhandled raw instruction: i32.shl
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (96);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc6 := popArgs1();
        }
    } else {
        call push(arg1);
        call loc8 := popArgs1();
        call push(loc1);
        call loc7 := popArgs1();
        // // unhandled raw instruction: i32.ctz
        call loc3 := popArgs1();
        call push(loc8);
        // // unhandled raw instruction: i32.shl
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (96);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc6 := popArgs1();
    }
    call push(loc6);
}

procedure {:inline 1} _lib_rt_tlsf_growMemory();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_growMemory()
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
    call push(536870912.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        // // unhandled raw instruction: i32.shl
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
    }
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc1 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i32.shl
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    // // unhandled raw instruction: i32.shr_u
    call loc3 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc3);
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc2);
    call push(loc4);
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
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.grow
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc6 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    // // unhandled raw instruction: i32.shl
    call _lib_rt_tlsf_addMemory();
    call pop();
}

procedure {:inline 1} _lib_rt_tlsf_prepareBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_prepareBlock()
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
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(365.0);
        call push(13.0);
        call _lib_builtins_abort();
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
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc3 := popArgs1();
        call push(loc3);
        // // unhandled raw instruction: i32.or
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg1);
        call push(loc3);
        call _lib_rt_tlsf_insertBlock();
    } else {
        call push(arg2);
        // // unhandled raw instruction: i32.and
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
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

procedure {:inline 1} _lib_rt_tlsf_allocateBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_1;
implementation _lib_rt_tlsf_allocateBlock()
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(490.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call _lib_rt_tlsf_prepareSize();
    call loc1 := popArgs1();
    call push(arg1);
    call push(loc1);
    call _lib_rt_tlsf_searchBlock();
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_2);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(1.0);
            call global_1 := popArgs1();
            call _lib_rt_pure___collect();
            call push(0.0);
            call global_1 := popArgs1();
            call push(arg1);
            call push(loc1);
            call _lib_rt_tlsf_searchBlock();
            call loc2 := popArgs1();
            call push(loc2);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(arg1);
                call push(loc1);
                call _lib_rt_tlsf_growMemory();
                call push(arg1);
                call push(loc1);
                call _lib_rt_tlsf_searchBlock();
                call loc2 := popArgs1();
                call push(loc2);
                call popToTmp1();
                call push(bool_to_real(($tmp1) == (0.0)));
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(0.0);
                    call push(32.0);
                    call push(502.0);
                    call push(19.0);
                    call _lib_builtins_abort();
                    assume (false);
                }
            }
        } else {
            call push(arg1);
            call push(loc1);
            call _lib_rt_tlsf_growMemory();
            call push(arg1);
            call push(loc1);
            call _lib_rt_tlsf_searchBlock();
            call loc2 := popArgs1();
            call push(loc2);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(32.0);
                call push(507.0);
                call push(17.0);
                call _lib_builtins_abort();
                assume (false);
            }
        }
    }
    // // unhandled raw instruction: i32.and
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(32.0);
        call push(510.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
    call _lib_rt_tlsf_removeBlock();
    call push(arg1);
    call push(loc2);
    call push(loc1);
    call _lib_rt_tlsf_prepareBlock();
    call push(loc2);
}

procedure {:inline 1} _lib_rt_tlsf___alloc();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf___alloc()
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
    call _lib_rt_tlsf_maybeInitialize();
    call push(arg1);
    call push(arg2);
    call _lib_rt_tlsf_allocateBlock();
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
}

procedure {:inline 1} _lib_rt_pure_increment();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure_increment()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(109.0);
        call push(2.0);
        call _lib_builtins_abort();
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(112.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
}

procedure {:inline 1} _lib_rt_pure___retain();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure___retain()
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
    call push(global_4);
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
        call _lib_rt_pure_increment();
    }
    call push(arg1);
}

procedure {:inline 1} _lib_rt_pure___release();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure___release()
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
    call push(global_4);
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
        call _lib_rt_pure_decrement();
    }
}

procedure {:inline 1} assembly_mandelbrot_check();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation assembly_mandelbrot_check()
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
    call push(0.0);
    call loc5 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
label$2_start_84:
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(2.0);
        call push(loc5);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call push(loc6);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call push(arg1);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc6 := popArgs1();
        call push(loc3);
        call push(loc4);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(arg2);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc5 := popArgs1();
        call push(loc1);
        call push(arg3);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$1_end_83;
        }
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$2_start_84;
    }
label$1_end_83:
    call push(loc1);
}

procedure {:inline 1} assembly_mandelbrot_mandelbrot();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation assembly_mandelbrot_mandelbrot()
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
    call push(1.6);
    call loc9 := popArgs1();
    call push(2.0);
    call loc10 := popArgs1();
    call push(10.0);
    call loc11 := popArgs1();
    // // unhandled raw instruction: f64.convert_i32_u
    call push(1.0);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc12 := popArgs1();
    // // unhandled raw instruction: f64.convert_i32_u
    call push(1.0);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc13 := popArgs1();
    call push(loc11);
    // // unhandled raw instruction: f64.convert_i32_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc14 := popArgs1();
    call push(loc12);
    call push(loc14);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc15 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
label$2_start_90:
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        // // unhandled raw instruction: f64.convert_i32_u
        call push(loc13);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(loc14);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) * ($tmp1));
        call loc8 := popArgs1();
        call push(0.0);
        call loc1 := popArgs1();
label$6_start_95:
        call push(loc1);
        call push(arg1);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call loc6 := popArgs1();
        call push(loc6);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(loc2);
            call push(arg1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) * ($tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc4 := popArgs1();
            // // unhandled raw instruction: f64.convert_i32_u
            call push(loc14);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) * ($tmp1));
            call push(loc15);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc7 := popArgs1();
            call push(loc8);
            call push(loc7);
            call push(arg3);
            call assembly_mandelbrot_check();
            call loc3 := popArgs1();
            call push(loc4);
            call push(loc3);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            goto label$6_start_95;
        }
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc2 := popArgs1();
        goto label$2_start_90;
    }
}

procedure {:inline 1} assembly_mandelbrot_growMem();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation assembly_mandelbrot_growMem()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.grow
}

procedure {:inline 1} _lib_rt_pure___collect();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure___collect()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    goto func_exit_99;
func_exit_99:
}

procedure {:inline 1} _lib_rt_tlsf_freeBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_tlsf_freeBlock()
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
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call _lib_rt_tlsf_insertBlock();
}

procedure {:inline 1} _lib_rt_pure_decrement();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure_decrement()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc2 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(122.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc2);
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
        call push(1.0);
        call _lib_rt___visit_members();
        // // unhandled raw instruction: i32.and
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(144.0);
            call push(126.0);
            call push(17.0);
            call _lib_builtins_abort();
            assume (false);
        }
        call push(global_0);
        call push(arg1);
        call _lib_rt_tlsf_freeBlock();
    } else {
        call push(loc2);
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(144.0);
            call push(136.0);
            call push(15.0);
            call _lib_builtins_abort();
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

procedure {:inline 1} _lib_rt_pure___visit();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt_pure___visit()
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
    call push(global_4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto func_exit_105;
    }
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(144.0);
        call push(69.0);
        call push(15.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _lib_rt_pure_decrement();
func_exit_105:
}

procedure {:inline 1} _lib_rt___visit_members();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation _lib_rt___visit_members()
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
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (3))) {
        goto label$3_end_109;
    } else {
        if ((idx) == (0)) {
            goto label$5_end_111;
        }
        if ((idx) == (1)) {
            goto label$5_end_111;
        }
        if ((idx) == (2)) {
            goto label$4_end_110;
        }
        goto label$3_end_109;
    }
label$5_end_111:
    goto func_exit_114;
    assume (false);
label$4_end_110:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(arg2);
        call _lib_rt_pure___visit();
    }
    goto func_exit_114;
    assume (false);
    assume (false);
label$3_end_109:
    assume (false);
    assume (false);
func_exit_114:
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

procedure {:inline 1} CorralChoice__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
implementation CorralChoice__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (21)));
    if ((c) == (0)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_removeBlock();
    } else if ((c) == (1)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_insertBlock();
    } else if ((c) == (2)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_addMemory();
        call popDiscard1();
    } else if ((c) == (3)) {
        call _lib_rt_tlsf_maybeInitialize();
        call popDiscard1();
    } else if ((c) == (4)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_prepareSize();
        call popDiscard1();
    } else if ((c) == (5)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_searchBlock();
        call popDiscard1();
    } else if ((c) == (6)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_growMemory();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_prepareBlock();
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
        call _lib_rt_tlsf_allocateBlock();
        call popDiscard1();
    } else if ((c) == (9)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf___alloc();
        call popDiscard1();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_increment();
    } else if ((c) == (11)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___retain();
        call popDiscard1();
    } else if ((c) == (12)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___release();
    } else if ((c) == (13)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call assembly_mandelbrot_check();
        call popDiscard1();
    } else if ((c) == (14)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call assembly_mandelbrot_mandelbrot();
    } else if ((c) == (15)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call assembly_mandelbrot_growMem();
        call popDiscard1();
    } else if ((c) == (16)) {
        call _lib_rt_pure___collect();
    } else if ((c) == (17)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_freeBlock();
    } else if ((c) == (18)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_decrement();
    } else if ((c) == (19)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___visit();
    } else if ((c) == (20)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt___visit_members();
    }
}

procedure BoogieEntry__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
implementation BoogieEntry__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12()
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_removeBlock();
        } else if ((c) == (1)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_insertBlock();
        } else if ((c) == (2)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_addMemory();
            call popDiscard1();
        } else if ((c) == (3)) {
            call _lib_rt_tlsf_maybeInitialize();
            call popDiscard1();
        } else if ((c) == (4)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_prepareSize();
            call popDiscard1();
        } else if ((c) == (5)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_searchBlock();
            call popDiscard1();
        } else if ((c) == (6)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_growMemory();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_prepareBlock();
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
            call _lib_rt_tlsf_allocateBlock();
            call popDiscard1();
        } else if ((c) == (9)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf___alloc();
            call popDiscard1();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_increment();
        } else if ((c) == (11)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___retain();
            call popDiscard1();
        } else if ((c) == (12)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___release();
        } else if ((c) == (13)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call assembly_mandelbrot_check();
            call popDiscard1();
        } else if ((c) == (14)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call assembly_mandelbrot_mandelbrot();
        } else if ((c) == (15)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call assembly_mandelbrot_growMem();
            call popDiscard1();
        } else if ((c) == (16)) {
            call _lib_rt_pure___collect();
        } else if ((c) == (17)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_freeBlock();
        } else if ((c) == (18)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_decrement();
        } else if ((c) == (19)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___visit();
        } else if ((c) == (20)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt___visit_members();
        }
    }
}

procedure CorralEntry__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
modifies global_1;
modifies global_2;
implementation CorralEntry__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__755f48d9f8ab140655e2e37abf96afa425079c6c3cc12bddcf3f341882e52c12();
    }
}

