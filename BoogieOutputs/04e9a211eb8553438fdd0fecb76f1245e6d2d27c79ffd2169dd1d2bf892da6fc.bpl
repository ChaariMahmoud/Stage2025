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
var global_2: real;
var global_3: real;
var global_4: real;
var global_5: real;
const global_6: real;

axiom((global_6) == (0.0));
const global_7: real;

axiom((global_7) == (256.0));
const global_8: real;

axiom((global_8) == (284.0));
procedure {:inline 1} initGlobals();
modifies $mem_pages;
modifies global_0;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
ensures(($mem_pages) == (0));
ensures((global_0) == (0.0));
ensures((global_1) == (0.0));
ensures((global_2) == (1.0));
ensures((global_3) == (0.0));
ensures((global_4) == (0.0));
ensures((global_5) == (0.0));
implementation initGlobals()
{
    $mem_pages := 0;
    global_0 := 0.0;
    global_1 := 0.0;
    global_2 := 1.0;
    global_3 := 0.0;
    global_4 := 0.0;
    global_5 := 0.0;
}

procedure {:inline 1} _lib_builtins_abort();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation _lib_builtins_abort()
{
}

procedure {:inline 1} assembly_index_initCanvas();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation assembly_index_initCanvas()
{
}

procedure {:inline 1} _lib_bindings_Math_random();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation _lib_bindings_Math_random()
{
}

procedure {:inline 1} _lib_bindings_Math_floor();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation _lib_bindings_Math_floor()
{
}

procedure {:inline 1} assembly_index_noStroke();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation assembly_index_noStroke()
{
}

procedure {:inline 1} assembly_index_fill();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation assembly_index_fill()
{
}

procedure {:inline 1} assembly_index_stroke();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation assembly_index_stroke()
{
}

procedure {:inline 1} assembly_index_circle();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation assembly_index_circle()
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(24.0);
        call push(277.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc1);
    call push(3.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
        call push(24.0);
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
        call push(loc2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call loc4 := popArgs1();
    } else {
        call push(31.0);
        call push(loc2);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc3 := popArgs1();
        call push(loc2);
        call push(loc3);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(1.0);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
        call push(24.0);
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
    call push(loc8);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc7);
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
        call loc10 := popArgs1();
        call push(loc3);
        call loc9 := popArgs1();
        call push(loc4);
        call loc8 := popArgs1();
        call push(loc6);
        call loc7 := popArgs1();
        call push(loc10);
        call push(loc9);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call push(loc8);
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
            call push(loc7);
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
            call loc8 := popArgs1();
            call push(arg1);
            call loc7 := popArgs1();
            call push(loc3);
            call loc10 := popArgs1();
            call push(loc8);
            call push(1.0);
            call push(loc4);
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
            call loc8 := popArgs1();
            call push(loc8);
            call loc9 := popArgs1();
            call push(loc7);
            call push(loc10);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
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
                call push(arg1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_s32(idx);
                call push(int_to_real(load_i));
                call push(1.0);
                call push(loc3);
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

procedure {:inline 1} _lib_rt_tlsf_insertBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(24.0);
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
        call push(24.0);
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
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(3.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc4);
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
            call push(loc3);
            call _lib_rt_tlsf_removeBlock();
            call push(arg2);
            call push(loc1);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call push(loc2);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
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
            call push(loc5);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call push(3.0);
            call push(-1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_xor($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
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
    call push(loc1);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call push(24.0);
            call push(228.0);
            call push(15.0);
            call _lib_builtins_abort();
            assume (false);
        }
        call push(loc2);
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc1);
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
            call push(loc2);
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call push(loc6);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
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
    call push(loc4);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(3.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
        call push(24.0);
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
        call push(24.0);
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
        call push(loc7);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call loc9 := popArgs1();
    } else {
        call push(31.0);
        call push(loc7);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc8 := popArgs1();
        call push(loc7);
        call push(loc8);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(1.0);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
        call push(24.0);
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
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc5);
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
    call push(loc6);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc2);
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
    call push(loc5);
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
    call push(loc8);
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
    call loc12 := popArgs1();
    call push(loc8);
    call loc11 := popArgs1();
    call push(arg1);
    call loc2 := popArgs1();
    call push(loc8);
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc5);
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
    call push(1.0);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc12);
    call push(loc11);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(arg2);
        call push(15.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        call push(arg3);
        call push(15.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        call push(24.0);
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
            call push(24.0);
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
            call push(24.0);
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
        goto func_exit_41;
    }
    call push(loc4);
    call push(16.0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(arg2);
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc3);
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
    call push(0.0);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
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
func_exit_41:
}

procedure {:inline 1} _lib_rt_tlsf_initializeRoot();
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
implementation _lib_rt_tlsf_initializeRoot()
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
    call push(global_8);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(15.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(1572.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(65535.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
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
    call push(loc1);
    call loc4 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
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
label$6_start_45:
    call push(loc6);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_44;
    }
    call push(loc4);
    call loc8 := popArgs1();
    call push(loc6);
    call loc7 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc8);
    call push(loc7);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call loc8 := popArgs1();
label$9_start_49:
    call push(loc8);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_48;
    }
    call push(loc4);
    call loc10 := popArgs1();
    call push(loc6);
    call loc9 := popArgs1();
    call push(loc8);
    call loc7 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc10);
    call push(loc9);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc7);
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
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    goto label$9_start_49;
label$8_end_48:
    call push(loc6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    goto label$6_start_45;
label$5_end_44:
    call push(loc4);
    call push(loc1);
    call push(1572.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(15.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call _lib_rt_tlsf_addMemory();
    call pop();
    call push(loc4);
    call global_0 := popArgs1();
}

procedure {:inline 1} _lib_rt_tlsf_prepareSize();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(72.0);
        call push(24.0);
        call push(457.0);
        call push(29.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(15.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(arg2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
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
        call push(loc3);
        call popToTmp1();
        call push(int_clz($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
        call push(loc3);
        call push(loc1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(1.0);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
        call push(24.0);
        call push(338.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call loc4 := popArgs1();
    call push(loc1);
    call loc3 := popArgs1();
    call push(loc4);
    call push(loc3);
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
    call push(0.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(0.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
        call loc4 := popArgs1();
        call push(loc4);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            call loc6 := popArgs1();
        } else {
            call push(loc4);
            call popToTmp1();
            call push(int_ctz($tmp1));
            call loc1 := popArgs1();
            call push(arg1);
            call loc7 := popArgs1();
            call push(loc1);
            call loc3 := popArgs1();
            call push(loc7);
            call push(loc3);
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
            call loc5 := popArgs1();
            call push(loc5);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call push(24.0);
                call push(351.0);
                call push(17.0);
                call _lib_builtins_abort();
                assume (false);
            }
            call push(arg1);
            call loc8 := popArgs1();
            call push(loc1);
            call loc7 := popArgs1();
            call push(loc5);
            call popToTmp1();
            call push(int_ctz($tmp1));
            call loc3 := popArgs1();
            call push(loc8);
            call push(loc7);
            call push(4.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(loc3);
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
            call loc6 := popArgs1();
        }
    } else {
        call push(arg1);
        call loc8 := popArgs1();
        call push(loc1);
        call loc7 := popArgs1();
        call push(loc5);
        call popToTmp1();
        call push(int_ctz($tmp1));
        call loc3 := popArgs1();
        call push(loc8);
        call push(loc7);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call push(loc3);
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
        call loc6 := popArgs1();
    }
    call push(loc6);
}

procedure {:inline 1} _lib_rt_pure_markGray();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_pure_markGray()
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
    call push(loc1);
    call push(1879048192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(loc1);
        call push(1879048192.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(2.0);
        call _lib_rt___visit_members();
    }
}

procedure {:inline 1} _lib_rt_tlsf_freeBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(24.0);
        call push(563.0);
        call push(2.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg2);
    call push(loc1);
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
    call _lib_rt_tlsf_insertBlock();
}

procedure {:inline 1} _lib_rt_pure_scanBlack();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_pure_scanBlack()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1879048192.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call _lib_rt___visit_members();
}

procedure {:inline 1} _lib_rt_pure_scan();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_pure_scan()
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
    call push(loc1);
    call push(1879048192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call _lib_rt_pure_scanBlack();
        } else {
            call push(arg1);
            call push(loc1);
            call push(1879048192.0);
            call push(-1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_xor($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call push(536870912.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(arg1);
            call push(16.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(3.0);
            call _lib_rt___visit_members();
        }
    }
}

procedure {:inline 1} _lib_rt_pure_collectWhite();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_pure_collectWhite()
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
    call push(loc1);
    call push(1879048192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(536870912.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(-2147483648.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        call push(arg1);
        call push(loc1);
        call push(1879048192.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_or($tmp2, $tmp1));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (4);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(5.0);
        call _lib_rt___visit_members();
        call push(global_0);
        call push(arg1);
        call _lib_rt_tlsf_freeBlock();
    }
}

procedure {:inline 1} _lib_rt_pure___collect();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_4;
implementation _lib_rt_pure___collect()
{
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
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    call push(global_3);
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc2);
    call loc3 := popArgs1();
    call push(global_4);
    call loc4 := popArgs1();
label$3_start_71:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_69;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(1879048192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(805306368.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc6);
        call push(268435456.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) > ($tmp1)));
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
        call push(loc5);
        call _lib_rt_pure_markGray();
        call push(loc2);
        call push(loc5);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(loc2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc2 := popArgs1();
    } else {
        call push(loc6);
        call push(1879048192.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc6);
            call push(268435456.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
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
            call push(global_0);
            call push(loc5);
            call _lib_rt_tlsf_freeBlock();
        } else {
            call push(loc5);
            call push(loc6);
            call push(-2147483648.0);
            call push(-1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_xor($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
        }
    }
    call push(loc3);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    goto label$3_start_71;
label$1_end_69:
    call push(loc2);
    call global_4 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
label$13_start_75:
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_74;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call _lib_rt_pure_scan();
    call push(loc4);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    goto label$13_start_75;
label$12_end_74:
    call push(loc1);
    call loc4 := popArgs1();
label$15_start_78:
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_77;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call _lib_rt_pure_collectWhite();
    call push(loc4);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    goto label$15_start_78;
label$14_end_77:
    call push(loc1);
    call global_4 := popArgs1();
}

procedure {:inline 1} _lib_rt_tlsf_growMemory();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
    }
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call push(16.0);
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
    call loc2 := popArgs1();
    call push(loc2);
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
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(65535.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
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
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(arg1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call _lib_rt_tlsf_addMemory();
    call pop();
}

procedure {:inline 1} _lib_rt_tlsf_prepareBlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(arg3);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(24.0);
        call push(365.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc1);
    call push(3.0);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
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
        call push(loc3);
        call _lib_rt_tlsf_insertBlock();
    } else {
        call push(arg2);
        call push(loc1);
        call push(1.0);
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
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call push(3.0);
        call push(-1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_xor($tmp2, $tmp1));
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
        call push(2.0);
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

procedure {:inline 1} _lib_rt_tlsf_allocateBlock();
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
implementation _lib_rt_tlsf_allocateBlock()
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
    call push(global_1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(24.0);
        call push(486.0);
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
                    call push(24.0);
                    call push(498.0);
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
                call push(24.0);
                call push(503.0);
                call push(17.0);
                call _lib_builtins_abort();
                assume (false);
            }
        }
    }
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(24.0);
        call push(506.0);
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_tlsf___alloc()
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
    call push(global_0);
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call _lib_rt_tlsf_initializeRoot();
        call push(global_0);
        call loc1 := popArgs1();
    }
    call push(loc1);
    call push(arg1);
    call _lib_rt_tlsf_allocateBlock();
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(loc1);
    call push(-268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc1);
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
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(104.0);
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(107.0);
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
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(global_8);
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

procedure {:inline 1} _lib_rt___typeinfo();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt___typeinfo()
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
    call push(global_7);
    call loc1 := popArgs1();
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(176.0);
        call push(232.0);
        call push(22.0);
        call push(27.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
}

procedure {:inline 1} _lib_util_memory_memcpy();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_util_memory_memcpy()
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
label$2_start_100:
    call push(arg3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call push(3.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        goto label$1_end_99;
    }
    call push(arg1);
    call loc3 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc3);
    call push(arg2);
    call loc3 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg3 := popArgs1();
    goto label$2_start_100;
label$1_end_99:
    call push(arg1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
label$9_start_108:
        call push(arg3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$8_end_107;
        }
        call push(arg1);
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
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
        call push(arg2);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
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
        call push(arg2);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u32(idx, store_i);
        call push(arg1);
        call push(12.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(arg2);
        call push(12.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
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
        call arg2 := popArgs1();
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(arg3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
        goto label$9_start_108;
label$8_end_107:
        call push(arg3);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(arg2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
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
            call push(arg2);
            call push(4.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
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
            call arg1 := popArgs1();
            call push(arg2);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
        }
        call push(arg3);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(arg2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
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
            call push(arg2);
            call push(4.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
        }
        call push(arg3);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(arg2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_u16(idx);
            call push(int_to_real(load_i));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u16(idx, store_i);
            call push(arg1);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg1 := popArgs1();
            call push(arg2);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
        }
        call push(arg3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call loc3 := popArgs1();
            call push(loc3);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg1 := popArgs1();
            call push(loc3);
            call push(arg2);
            call loc3 := popArgs1();
            call push(loc3);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call arg2 := popArgs1();
            call push(loc3);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
        }
        goto func_exit_117;
    }
    call push(arg3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(3.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$20_end_121;
        }
        call push(loc3);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$19_end_120;
        }
        call push(loc3);
        call push(3.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$18_end_119;
        }
        goto label$17_end_118;
label$20_end_121:
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg3);
        call push(3.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
label$29_start_136:
        call push(arg3);
        call push(17.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$28_end_135;
        }
        call push(arg2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(loc1);
        call push(24.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(8.0);
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
        call push(arg2);
        call push(5.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(24.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(8.0);
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
        call push(arg2);
        call push(9.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc1);
        call push(24.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(8.0);
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
        call push(arg2);
        call push(13.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(12.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(24.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(8.0);
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
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(arg3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
        goto label$29_start_136;
label$28_end_135:
        goto label$17_end_118;
label$19_end_120:
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg3);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
label$36_start_148:
        call push(arg3);
        call push(18.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$35_end_147;
        }
        call push(arg2);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(loc1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(16.0);
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
        call push(arg2);
        call push(6.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(16.0);
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
        call push(arg2);
        call push(10.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(16.0);
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
        call push(arg2);
        call push(14.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(12.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(16.0);
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
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(arg3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
        goto label$36_start_148;
label$35_end_147:
        goto label$17_end_118;
label$18_end_119:
        call push(arg2);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
label$41_start_156:
        call push(arg3);
        call push(19.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$40_end_155;
        }
        call push(arg2);
        call push(3.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(loc1);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(24.0);
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
        call push(arg2);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(24.0);
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
        call push(arg2);
        call push(11.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(arg1);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc1);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc2);
        call push(24.0);
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
        call push(arg2);
        call push(15.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call loc1 := popArgs1();
        call push(arg1);
        call push(12.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call push(8.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shr_u($tmp2, $tmp1));
        call push(loc1);
        call push(24.0);
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
        call push(arg2);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg1);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(arg3);
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call arg3 := popArgs1();
        goto label$41_start_156;
label$40_end_155:
        goto label$17_end_118;
label$17_end_118:
    }
    call push(arg3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
    }
    call push(arg3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
    }
    call push(arg3);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
    }
    call push(arg3);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
    }
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg1 := popArgs1();
        call push(loc3);
        call push(arg2);
        call loc3 := popArgs1();
        call push(loc3);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(loc3);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
    }
func_exit_117:
}

procedure {:inline 1} _lib_memory_memory_copy();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_memory_memory_copy()
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
    call push(arg1);
    call loc3 := popArgs1();
    call push(arg2);
    call loc2 := popArgs1();
    call push(arg3);
    call loc1 := popArgs1();
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_286;
    }
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(1.0);
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(loc3);
        call push(loc1);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) <= ($tmp1)));
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call push(loc2);
        call push(loc1);
        call _lib_util_memory_memcpy();
        goto label$1_end_286;
    }
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc2);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(loc3);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
label$9_start_291:
            call push(loc3);
            call push(7.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$8_end_290;
            }
            call push(loc1);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$1_end_286;
            }
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc1 := popArgs1();
            call push(loc3);
            call loc4 := popArgs1();
            call push(loc4);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc3 := popArgs1();
            call push(loc4);
            call push(loc2);
            call loc4 := popArgs1();
            call push(loc4);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            call push(loc4);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
            goto label$9_start_291;
label$8_end_290:
label$14_start_298:
            call push(loc1);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) >= ($tmp1)));
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$13_end_297;
            }
            call push(loc3);
            call push(loc2);
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
            call push(loc3);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc3 := popArgs1();
            call push(loc2);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            goto label$14_start_298;
label$13_end_297:
        }
label$16_start_301:
        call push(loc1);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$15_end_300;
        }
        call push(loc3);
        call loc4 := popArgs1();
        call push(loc4);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc3 := popArgs1();
        call push(loc4);
        call push(loc2);
        call loc4 := popArgs1();
        call push(loc4);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc2 := popArgs1();
        call push(loc4);
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
        goto label$16_start_301;
label$15_end_300:
    } else {
        call push(loc2);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call push(loc3);
        call push(7.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
label$22_start_310:
            call push(loc3);
            call push(loc1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(7.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$21_end_309;
            }
            call push(loc1);
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$1_end_286;
            }
            call push(loc3);
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc1 := popArgs1();
            call push(loc1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc2);
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
            goto label$22_start_310;
label$21_end_309:
label$25_start_314:
            call push(loc1);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) >= ($tmp1)));
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$24_end_313;
            }
            call push(loc1);
            call push(8.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call loc1 := popArgs1();
            call push(loc3);
            call push(loc1);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc2);
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
            goto label$25_start_314;
label$24_end_313:
        }
label$27_start_317:
        call push(loc1);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            goto label$26_end_316;
        }
        call push(loc3);
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call loc1 := popArgs1();
        call push(loc1);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
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
        goto label$27_start_317;
label$26_end_316:
    }
label$1_end_286:
}

procedure {:inline 1} _lib_rt_tlsf___free();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_tlsf___free()
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
        call push(0.0);
        call push(24.0);
        call push(593.0);
        call push(13.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(15.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
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
        call push(24.0);
        call push(594.0);
        call push(2.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(global_0);
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _lib_rt_tlsf_freeBlock();
}

procedure {:inline 1} _lib_rt_pure_growRoots();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_3;
modifies global_4;
modifies global_5;
implementation _lib_rt_pure_growRoots()
{
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
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    call push(global_3);
    call loc1 := popArgs1();
    call push(global_4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(64.0);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc3);
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
    call push(0.0);
    call _lib_rt_tlsf___alloc();
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc1);
    call push(loc2);
    call _lib_memory_memory_copy();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call _lib_rt_tlsf___free();
    }
    call push(loc6);
    call global_3 := popArgs1();
    call push(loc6);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_4 := popArgs1();
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_5 := popArgs1();
}

procedure {:inline 1} _lib_rt_pure_appendRoot();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_4;
implementation _lib_rt_pure_appendRoot()
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
    call push(global_4);
    call loc1 := popArgs1();
    call push(loc1);
    call push(global_5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call _lib_rt_pure_growRoots();
        call push(global_4);
        call loc1 := popArgs1();
    }
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_4 := popArgs1();
}

procedure {:inline 1} _lib_rt_pure_decrement();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(loc1);
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(115.0);
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
        call push(loc1);
        call push(-2147483648.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(global_0);
            call push(arg1);
            call _lib_rt_tlsf_freeBlock();
        } else {
            call push(arg1);
            call push(-2147483648.0);
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
        }
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
            call push(128.0);
            call push(124.0);
            call push(15.0);
            call _lib_builtins_abort();
            assume (false);
        }
        call push(arg1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (8);
        call load_i := mem_read_s32(idx);
        call push(int_to_real(load_i));
        call _lib_rt___typeinfo();
        call push(16.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_and($tmp2, $tmp1));
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg1);
            call push(-2147483648.0);
            call push(805306368.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc1);
            call push(-2147483648.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            call push(bool_to_real(($tmp1) == (0.0)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(arg1);
                call _lib_rt_pure_appendRoot();
            }
        } else {
            call push(arg1);
            call push(loc1);
            call push(268435456.0);
            call push(-1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_xor($tmp2, $tmp1));
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call push(loc2);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) - ($tmp1));
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
}

procedure {:inline 1} _lib_rt_pure___release();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
    call push(global_8);
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

procedure {:inline 1} assembly_index_setup();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation assembly_index_setup()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(600.0);
    call push(600.0);
    call assembly_index_initCanvas();
}

procedure {:inline 1} assembly_index_draw();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation assembly_index_draw()
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
    call _lib_bindings_Math_random();
    call push(16777215.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call _lib_bindings_Math_floor();
    // // numeric cast i32.trunc_f64_u: no-op under real semantics
    call loc1 := popArgs1();
    call _lib_bindings_Math_random();
    call push(600.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc2 := popArgs1();
    call _lib_bindings_Math_random();
    call push(600.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc3 := popArgs1();
    call assembly_index_noStroke();
    call push(loc1);
    call assembly_index_fill();
    call push(loc1);
    call assembly_index_stroke();
    call push(loc2);
    call push(loc3);
    call push(20.0);
    call assembly_index_circle();
}

procedure {:inline 1} _lib_rt_pure___visit();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _lib_rt_pure___visit()
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
    call push(global_8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto func_exit_330;
    }
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(arg2);
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_337;
    }
    call push(loc2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_336;
    }
    call push(loc2);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_335;
    }
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_334;
    }
    call push(loc2);
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_333;
    }
    goto label$3_end_332;
label$8_end_337:
    call push(loc1);
    call _lib_rt_pure_decrement();
    goto label$2_end_331;
label$7_end_336:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(75.0);
        call push(17.0);
        call _lib_builtins_abort();
        assume (false);
    }
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call _lib_rt_pure_markGray();
    goto label$2_end_331;
label$6_end_335:
    call push(loc1);
    call _lib_rt_pure_scan();
    goto label$2_end_331;
label$5_end_334:
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
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(86.0);
        call push(6.0);
        call _lib_builtins_abort();
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
    call push(loc2);
    call push(1879048192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call _lib_rt_pure_scanBlack();
    }
    goto label$2_end_331;
label$4_end_333:
    call push(loc1);
    call _lib_rt_pure_collectWhite();
    goto label$2_end_331;
label$3_end_332:
    call push(0.0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call push(128.0);
        call push(97.0);
        call push(24.0);
        call _lib_builtins_abort();
        assume (false);
    }
label$2_end_331:
func_exit_330:
}

procedure {:inline 1} _lib_rt___visit_members();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
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
        goto label$3_end_348;
    } else {
        if ((idx) == (0)) {
            goto label$5_end_350;
        }
        if ((idx) == (1)) {
            goto label$5_end_350;
        }
        if ((idx) == (2)) {
            goto label$4_end_349;
        }
        goto label$3_end_348;
    }
label$5_end_350:
    goto func_exit_353;
    assume (false);
label$4_end_349:
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
    goto func_exit_353;
    assume (false);
    assume (false);
label$3_end_348:
    assume (false);
    assume (false);
func_exit_353:
}

procedure {:inline 1} null();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation null()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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

procedure {:inline 1} CorralChoice__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
implementation CorralChoice__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (31)));
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
        call _lib_rt_tlsf_initializeRoot();
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
        call _lib_rt_pure_markGray();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_freeBlock();
    } else if ((c) == (8)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_scanBlack();
    } else if ((c) == (9)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_scan();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_collectWhite();
    } else if ((c) == (11)) {
        call _lib_rt_pure___collect();
    } else if ((c) == (12)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_growMemory();
    } else if ((c) == (13)) {
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
    } else if ((c) == (14)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf_allocateBlock();
        call popDiscard1();
    } else if ((c) == (15)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf___alloc();
        call popDiscard1();
    } else if ((c) == (16)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_increment();
    } else if ((c) == (17)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___retain();
        call popDiscard1();
    } else if ((c) == (18)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt___typeinfo();
        call popDiscard1();
    } else if ((c) == (19)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_util_memory_memcpy();
    } else if ((c) == (20)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_memory_memory_copy();
    } else if ((c) == (21)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_tlsf___free();
    } else if ((c) == (22)) {
        call _lib_rt_pure_growRoots();
    } else if ((c) == (23)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_appendRoot();
    } else if ((c) == (24)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure_decrement();
    } else if ((c) == (25)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___release();
    } else if ((c) == (26)) {
        call assembly_index_setup();
    } else if ((c) == (27)) {
        havoc argTmp;
        call push(argTmp);
        call assembly_index_draw();
    } else if ((c) == (28)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt_pure___visit();
    } else if ((c) == (29)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _lib_rt___visit_members();
    } else if ((c) == (30)) {
        call null();
    }
}

procedure BoogieEntry__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
implementation BoogieEntry__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (31)));
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
            call _lib_rt_tlsf_initializeRoot();
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
            call _lib_rt_pure_markGray();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_freeBlock();
        } else if ((c) == (8)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_scanBlack();
        } else if ((c) == (9)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_scan();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_collectWhite();
        } else if ((c) == (11)) {
            call _lib_rt_pure___collect();
        } else if ((c) == (12)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_growMemory();
        } else if ((c) == (13)) {
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
        } else if ((c) == (14)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf_allocateBlock();
            call popDiscard1();
        } else if ((c) == (15)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf___alloc();
            call popDiscard1();
        } else if ((c) == (16)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_increment();
        } else if ((c) == (17)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___retain();
            call popDiscard1();
        } else if ((c) == (18)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt___typeinfo();
            call popDiscard1();
        } else if ((c) == (19)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_util_memory_memcpy();
        } else if ((c) == (20)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_memory_memory_copy();
        } else if ((c) == (21)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_tlsf___free();
        } else if ((c) == (22)) {
            call _lib_rt_pure_growRoots();
        } else if ((c) == (23)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_appendRoot();
        } else if ((c) == (24)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure_decrement();
        } else if ((c) == (25)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___release();
        } else if ((c) == (26)) {
            call assembly_index_setup();
        } else if ((c) == (27)) {
            havoc argTmp;
            call push(argTmp);
            call assembly_index_draw();
        } else if ((c) == (28)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt_pure___visit();
        } else if ((c) == (29)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _lib_rt___visit_members();
        } else if ((c) == (30)) {
            call null();
        }
    }
}

procedure CorralEntry__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_5;
implementation CorralEntry__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__04e9a211eb8553438fdd0fecb76f1245e6d2d27c79ffd2169dd1d2bf892da6fc();
    }
}

