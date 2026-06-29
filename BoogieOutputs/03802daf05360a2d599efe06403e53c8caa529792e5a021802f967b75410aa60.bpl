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

procedure {:inline 1} memory_size() returns (result: int);
implementation memory_size() returns (result: int)
{
    result := $mem_pages;
}

procedure {:inline 1} memory_grow(delta: int) returns (oldSize: int);
modifies $mem_pages;
implementation memory_grow(delta: int) returns (oldSize: int)
{
    oldSize := $mem_pages;
    $mem_pages := ($mem_pages) + (delta);
}

procedure {:inline 1} memory_fill(dst: int, value: int, len: int);
modifies $mem;
implementation memory_fill(dst: int, value: int, len: int)
{
    havoc $mem;
}

procedure {:inline 1} memory_copy(dst: int, src: int, len: int);
modifies $mem;
implementation memory_copy(dst: int, src: int, len: int)
{
    havoc $mem;
}

function nd_real() returns (result: real);
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
function min_real(x: real, y: real) : real
{
    if (x) <= (y) then (x) else (y)
}
function max_real(x: real, y: real) : real
{
    if (x) >= (y) then (x) else (y)
}
function abs_real(x: real) : real
{
    if (x) >= (0.0) then (x) else (-(x))
}
function sqrt_real(r: real) returns (result: real);

axiom(forall  r:real :: {sqrt_real(r)} (((r) >= (0.0)) ==> ((sqrt_real(r)) >= (0.0))));

axiom(forall  r:real :: {sqrt_real(r)} (((r) >= (0.0)) ==> (((sqrt_real(r)) * (sqrt_real(r))) == (r))));
function nearest_real(r: real) returns (result: real);

axiom(forall  r:real :: {nearest_real(r)} ((((nearest_real(r)) - (0.5)) <= (r)) && ((r) <= ((nearest_real(r)) + (0.5)))));

axiom(forall  r:real :: {nearest_real(r)} ((nearest_real(nearest_real(r))) == (nearest_real(r))));
function floor_real(r: real) returns (result: real);

axiom(forall  r:real ::  ((floor_real(r)) <= (r)));

axiom(forall  r:real ::  ((r) < ((floor_real(r)) + (1.0))));
function ceil_real(x: real) returns (result: real);
function trunc_real(x: real) returns (result: real);
function copysign_real(x: real, y: real) returns (result: real);
function bv_and(x: real, y: real) returns (result: real);
function bv_or(x: real, y: real) returns (result: real);
function bv_xor(x: real, y: real) returns (result: real);
function bv_shl(x: real, y: real) returns (result: real);
function bv_shr_s(x: real, y: real) returns (result: real);
function bv_shr_u(x: real, y: real) returns (result: real);
function bv_rotl(x: real, y: real) returns (result: real);
function bv_rotr(x: real, y: real) returns (result: real);
function int_rem_s(x: real, y: real) returns (result: real);
function int_rem_u(x: real, y: real) returns (result: real);
function int_clz(x: real) returns (result: real);
function int_ctz(x: real) returns (result: real);
function int_popcnt(x: real) returns (result: real);
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

var $table: [int]real;
var $table_size: int;
procedure {:inline 1} table_get(idx: int) returns (result: real);
implementation table_get(idx: int) returns (result: real)
{
    result := $table[idx];
}

procedure {:inline 1} table_set(idx: int, value: real);
modifies $table;
modifies $table_size;
implementation table_set(idx: int, value: real)
{
    $table[idx] := value;
}

procedure {:inline 1} table_size() returns (result: int);
implementation table_size() returns (result: int)
{
    result := $table_size;
}

procedure {:inline 1} table_grow(value: real, delta: int) returns (oldSize: int);
modifies $table;
modifies $table_size;
implementation table_grow(value: real, delta: int) returns (oldSize: int)
{
    oldSize := $table_size;
    $table_size := ($table_size) + (delta);
}

var global_0: real;
var global_1: real;
const global_2: real;

axiom((global_2) == (1184.0));
procedure {:inline 1} initGlobals();
modifies $mem_pages;
modifies global_0;
modifies global_1;
ensures(($mem_pages) == (0));
ensures((global_0) == (0.0));
ensures((global_1) == (0.0));
implementation initGlobals()
{
    $mem_pages := 0;
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(277.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(0.0);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
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
        call push(1040.0);
        call push(279.0);
        call push(14.0);
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
        call push(loc1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call loc1 := popArgs1();
    } else {
        call push(loc1);
        call push(31.0);
        call push(loc1);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc2 := popArgs1();
        call push(loc2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call loc1 := popArgs1();
        call push(loc2);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc2 := popArgs1();
    }
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(0.0);
    call push(loc2);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
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
        call push(1040.0);
        call push(292.0);
        call push(14.0);
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
    call push(loc1);
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
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
        call push(loc1);
        call push(loc2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
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
            call push(loc2);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc3 := popArgs1();
            call push(loc3);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call push(1.0);
            call push(loc1);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(-1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_xor($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call arg2 := popArgs1();
            call push(loc3);
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
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call push(1.0);
                call push(loc2);
                call popToTmp1();
                call popToTmp2();
                call push(bv_shl($tmp2, $tmp1));
                call push(-1.0);
                call popToTmp1();
                call popToTmp2();
                call push(bv_xor($tmp2, $tmp1));
                call popToTmp1();
                call popToTmp2();
                call push(bv_and($tmp2, $tmp1));
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    var loc7: real;
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
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(205.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(207.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc1);
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
            call push(loc4);
            call func_0();
            call push(arg2);
            call push(loc2);
            call push(loc3);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call loc3 := popArgs1();
            call push(loc3);
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
            call push(arg2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call push(-4.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc4 := popArgs1();
            call push(loc4);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc1 := popArgs1();
        }
    }
    call push(loc3);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(loc2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc6 := popArgs1();
        call push(loc6);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(1040.0);
            call push(228.0);
            call push(16.0);
            call fimport_0();
            assume (false);
        }
        call push(loc6);
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc3);
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc7 := popArgs1();
        call push(loc7);
        call push(1073741824.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(loc2);
            call func_0();
            call push(loc2);
            call push(loc7);
            call push(loc6);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call loc3 := popArgs1();
            call push(loc3);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc2);
            call popToTmp2();
            $tmp3 := $tmp2;
        } else {
            call push(arg2);
            call popToTmp2();
            $tmp3 := $tmp2;
        }
        call push($tmp3);
        call arg2 := popArgs1();
    }
    call push(loc4);
    call push(loc1);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(0.0);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
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
        call push(1040.0);
        call push(243.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(loc2);
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(244.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(loc4);
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
    call push(loc2);
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call loc2 := popArgs1();
    } else {
        call push(loc2);
        call push(31.0);
        call push(loc2);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc3 := popArgs1();
        call push(loc3);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call loc2 := popArgs1();
        call push(loc3);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc5 := popArgs1();
    }
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(0.0);
    call push(loc5);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
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
        call push(1040.0);
        call push(260.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call push(loc2);
    call push(loc5);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call push(arg2);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
    call push(arg1);
    call push(loc2);
    call push(loc5);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc5);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(arg3);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call push(0.0);
    call push(arg2);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
        call push(1040.0);
        call push(386.0);
        call push(5.0);
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
            call push(1040.0);
            call push(396.0);
            call push(16.0);
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
            call push(1040.0);
            call push(408.0);
            call push(5.0);
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
        goto func_exit_42;
    }
    call push(arg2);
    call push(loc2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(arg3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
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
func_exit_42:
}

procedure {:inline 1} func_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        call load_i := memory_size();
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(loc2);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(1.0);
            call push(loc2);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call popToTmp1();
            idx := real_to_int($tmp1);
            call load_i := memory_grow(idx);
            call push(int_to_real(load_i));
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
        call push(1216.0);
        call loc2 := popArgs1();
        call push(1216.0);
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(2784.0);
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
label$5_start_47:
        call push(loc1);
        call push(23.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(1216.0);
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
label$7_start_50:
            call push(loc3);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc3);
                call push(loc1);
                call push(4.0);
                call popToTmp1();
                call popToTmp2();
                call push(bv_shl($tmp2, $tmp1));
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(2.0);
                call popToTmp1();
                call popToTmp2();
                call push(bv_shl($tmp2, $tmp1));
                call push(1216.0);
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
                goto label$7_start_50;
            }
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            goto label$5_start_47;
        }
        call push(1216.0);
        call push(2800.0);
        call load_i := memory_size();
        call push(int_to_real(load_i));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call func_2();
        call push(1216.0);
        call global_0 := popArgs1();
    }
    call push(loc2);
}

procedure {:inline 1} func_4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_4()
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
        call push(arg2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call arg2 := popArgs1();
    } else {
        call push(31.0);
        call push(arg2);
        call push(1.0);
        call push(27.0);
        call push(arg2);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(arg2);
        call push(arg2);
        call push(536870912.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        call popToTmp2();
        call popToTmp3();
        if (real_to_bool($tmp1)) {
            call push($tmp3);
        } else {
            call push($tmp2);
        }
        call arg2 := popArgs1();
        call push(arg2);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
        call push(arg2);
        call push(loc1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call arg2 := popArgs1();
        call push(loc1);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
    }
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(0.0);
    call push(loc1);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
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
        call push(1040.0);
        call push(338.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call push(loc1);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-1.0);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(arg2);
        call popToTmp1();
        call push(int_ctz($tmp1));
        call push(loc1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
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
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(-1.0);
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call arg2 := popArgs1();
        call push(arg2);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(arg2);
            call popToTmp1();
            call push(int_ctz($tmp1));
            call arg2 := popArgs1();
            call push(arg2);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
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
                call push(1040.0);
                call push(351.0);
                call push(18.0);
                call fimport_0();
                assume (false);
            }
            call push(arg1);
            call push(loc1);
            call popToTmp1();
            call push(int_ctz($tmp1));
            call push(arg2);
            call push(4.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
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

procedure {:inline 1} func_5();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_5()
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
    call push(arg3);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(365.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
        call push(arg3);
        call push(loc1);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
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
        call push(loc2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
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
        call push(loc1);
        call push(-2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        call arg1 := popArgs1();
        call push(arg1);
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(arg1);
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(-4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(-3.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
}

procedure {:inline 1} func_6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_1;
implementation func_6()
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
    call push(global_1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(500.0);
        call push(14.0);
        call fimport_0();
        assume (false);
    }
    call push(arg2);
    call push(1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1088.0);
        call push(1040.0);
        call push(461.0);
        call push(30.0);
        call fimport_0();
        assume (false);
    }
    call push(arg1);
    call push(arg2);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(16.0);
    call push(loc1);
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
    call loc2 := popArgs1();
    call push(loc2);
    call func_4();
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
        call func_4();
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(16.0);
            call load_i := memory_size();
            call push(int_to_real(load_i));
            call loc1 := popArgs1();
            call push(loc1);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call push(arg1);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (1568);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) != ($tmp1)));
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(loc2);
            call push(1.0);
            call push(27.0);
            call push(loc2);
            call popToTmp1();
            call push(int_clz($tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc2);
            call push(loc2);
            call push(536870912.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
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
            call push(($tmp2) + ($tmp1));
            call push(65535.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(-65536.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shr_u($tmp2, $tmp1));
            call loc3 := popArgs1();
            call push(loc1);
            call push(loc3);
            call push(loc1);
            call push(loc3);
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
            idx := real_to_int($tmp1);
            call load_i := memory_grow(idx);
            call push(int_to_real(load_i));
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc3);
                call popToTmp1();
                idx := real_to_int($tmp1);
                call load_i := memory_grow(idx);
                call push(int_to_real(load_i));
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
            call push(loc1);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call load_i := memory_size();
            call push(int_to_real(load_i));
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call func_2();
            call push(arg1);
            call push(loc2);
            call func_4();
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(1040.0);
                call push(512.0);
                call push(20.0);
                call fimport_0();
                assume (false);
            }
        }
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1040.0);
        call push(520.0);
        call push(14.0);
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
    call func_5();
    call push(loc1);
}

procedure {:inline 1} func_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_7()
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
    call func_6();
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
}

procedure {:inline 1} func_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_8()
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
    call push(1212.0);
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
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(loc2);
        call push(-268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(-268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) != ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(1152.0);
            call push(109.0);
            call push(3.0);
            call fimport_0();
            assume (false);
        }
        call push(loc1);
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(loc1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(1152.0);
            call push(112.0);
            call push(14.0);
            call fimport_0();
            assume (false);
        }
    }
    call push(arg1);
}

procedure {:inline 1} func_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_9()
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
    call push(1212.0);
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
        call func_12();
    }
}

procedure {:inline 1} func_10();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_10()
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
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
}

procedure {:inline 1} func_11();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_11()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} func_12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(1152.0);
        call push(122.0);
        call push(14.0);
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
        call popToTmp1();
        idx := real_to_int($tmp1);
        if (((idx) < (0)) || ((idx) >= (3))) {
            goto label$4_end_89;
        } else {
            if ((idx) == (0)) {
                goto label$3_end_88;
            }
            if ((idx) == (1)) {
                goto label$3_end_88;
            }
            if ((idx) == (2)) {
                goto label$5_end_90;
            }
            goto label$4_end_89;
        }
label$5_end_90:
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (16);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(1212.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) >= ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call push(16.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) - ($tmp1));
                call func_12();
            }
        }
        goto label$3_end_88;
label$4_end_89:
        assume (false);
label$3_end_88:
        call push(loc2);
        call push(-2147483648.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(1152.0);
            call push(126.0);
            call push(18.0);
            call fimport_0();
            assume (false);
        }
        call push(arg1);
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(global_0);
        call push(arg1);
        call func_1();
    } else {
        call push(loc1);
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) <= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(1152.0);
            call push(136.0);
            call push(16.0);
            call fimport_0();
            assume (false);
        }
        call push(arg1);
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call push(loc2);
        call push(-268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
    }
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

procedure {:inline 1} CorralChoice__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_0;
modifies global_1;
implementation CorralChoice__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (14)));
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_5();
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
        call func_6();
        call popDiscard1();
    } else if ((c) == (8)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_7();
        call popDiscard1();
    } else if ((c) == (9)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_8();
        call popDiscard1();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_9();
    } else if ((c) == (11)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_10();
        call popDiscard1();
    } else if ((c) == (12)) {
        call func_11();
    } else if ((c) == (13)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_12();
    }
}

procedure BoogieEntry__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_0;
modifies global_1;
implementation BoogieEntry__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (14)));
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_5();
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
            call func_6();
            call popDiscard1();
        } else if ((c) == (8)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_7();
            call popDiscard1();
        } else if ((c) == (9)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_8();
            call popDiscard1();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_9();
        } else if ((c) == (11)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_10();
            call popDiscard1();
        } else if ((c) == (12)) {
            call func_11();
        } else if ((c) == (13)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_12();
        }
    }
}

procedure CorralEntry__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_0;
modifies global_1;
implementation CorralEntry__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__03802daf05360a2d599efe06403e53c8caa529792e5a021802f967b75410aa60();
    }
}

