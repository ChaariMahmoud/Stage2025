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

const global_0: real;

axiom((global_0) == (1529880.0));
const global_1: real;

axiom((global_1) == (1530136.0));
const global_2: real;

axiom((global_2) == (2.0));
const global_3: real;

axiom((global_3) == (3.0));
var global_4: real;
procedure {:inline 1} initGlobals();
modifies $mem_pages;
modifies global_4;
ensures(($mem_pages) == (0));
ensures((global_4) == (0.0));
implementation initGlobals()
{
    $mem_pages := 0;
    global_4 := 0.0;
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
    call push(40503.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc1 := popArgs1();
label$1_start_1:
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(loc1);
        call push(512.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(255.0);
            goto func_exit_6;
        }
        goto label$1_start_1;
    }
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (512);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
func_exit_6:
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    call push(arg1);
    call push(40503.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc1 := popArgs1();
label$1_start_7:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$1_start_7;
    }
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u16(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (512);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
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
modifies global_4;
implementation func_2()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    call push(arg3);
    call func_0();
    call arg3 := popArgs1();
    call push(arg3);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg1);
        call push(arg3);
        call func_1();
        call push(arg2);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg2);
            call push(arg3);
            call func_1();
        }
        call push(global_4);
        call arg2 := popArgs1();
        call push(arg2);
        call push(arg1);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (1024);
        store_i := real_to_int($tmp2);
        call mem_write_u16(idx, store_i);
        call push(arg2);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call global_4 := popArgs1();
    }
    call push(global_4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
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
modifies global_4;
implementation func_3()
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
    var loc13: real;
    var loc14: real;
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
    loc13 := 0.0;
    loc14 := 0.0;
    call push(1530658.0);
    call loc1 := popArgs1();
    call push(37184.0);
    call loc2 := popArgs1();
    call push(37184.0);
    call loc8 := popArgs1();
    call push(37184.0);
    call loc4 := popArgs1();
    call push(1536.0);
    call loc9 := popArgs1();
    call push(1536.0);
    call loc6 := popArgs1();
    call push(1536.0);
    call loc5 := popArgs1();
    call push(1530548.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc11 := popArgs1();
label$1_start_13:
    call push(loc1);
    call push(1565987.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u8(idx);
        call push(int_to_real(load_i));
        call loc3 := popArgs1();
        call push(loc3);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc3);
            call push(255.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) == ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (1);
                call load_i := mem_read_u8(idx);
                call push(int_to_real(load_i));
                call loc12 := popArgs1();
                call push(loc1);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (2);
                call load_i := mem_read_u8(idx);
                call push(int_to_real(load_i));
                call loc13 := popArgs1();
                call push(loc1);
                call push(3.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc1 := popArgs1();
            }
label$5_start_19:
            call push(loc7);
            call push(loc14);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) < ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc7);
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(loc7);
                    call push(1.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(bool_to_real(($tmp2) == ($tmp1)));
                    call popToTmp1();
                    if (real_to_bool($tmp1)) {
                        call push(loc13);
                        call loc3 := popArgs1();
                    } else {
                        call push(loc1);
                        call popToTmp1();
                        idx := (real_to_int($tmp1)) + (0);
                        call load_i := mem_read_u8(idx);
                        call push(int_to_real(load_i));
                        call loc3 := popArgs1();
                        call push(loc1);
                        call push(1.0);
                        call popToTmp1();
                        call popToTmp2();
                        call push(($tmp2) + ($tmp1));
                        call loc1 := popArgs1();
                    }
                } else {
                    call push(loc12);
                    call loc3 := popArgs1();
                }
                call push(loc3);
                call push(11.0);
                call popToTmp1();
                call popToTmp2();
                call push(bool_to_real(($tmp2) > ($tmp1)));
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(loc6);
                    call push(1.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(($tmp2) + ($tmp1));
                    call loc6 := popArgs1();
                    call push(loc2);
                    call popToTmp1();
                    call push(bool_to_real(($tmp1) == (0.0)));
                    call popToTmp1();
                    if (real_to_bool($tmp1)) {
                        call push(loc4);
                        call push(loc10);
                        call popToTmp1();
                        call popToTmp2();
                        call push(($tmp2) + ($tmp1));
                        call push(loc8);
                        call push(loc11);
                        call popToTmp1();
                        call popToTmp2();
                        call push(($tmp2) + ($tmp1));
                        call loc8 := popArgs1();
                        call push(loc8);
                        call loc2 := popArgs1();
                        call push(loc2);
                        call popToTmp2();
                        call popToTmp1();
                        idx := (real_to_int($tmp1)) + (0);
                        store_i := real_to_int($tmp2);
                        call mem_write_u32(idx, store_i);
                    }
                    call push(loc2);
                    call loc4 := popArgs1();
                    call push(loc4);
                    call push(loc3);
                    call push(12.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(($tmp2) - ($tmp1));
                    call push(3.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(bv_shl($tmp2, $tmp1));
                    call loc10 := popArgs1();
                    call push(loc10);
                    call popToTmp1();
                    call popToTmp2();
                    call push(($tmp2) + ($tmp1));
                    call popToTmp1();
                    idx := (real_to_int($tmp1)) + (0);
                    call load_i := mem_read_s32(idx);
                    call push(int_to_real(load_i));
                    call loc2 := popArgs1();
                } else {
                    call push(loc6);
                    call push(loc3);
                    call popToTmp2();
                    call popToTmp1();
                    idx := (real_to_int($tmp1)) + (0);
                    store_i := real_to_int($tmp2);
                    call mem_write_u8(idx, store_i);
                    call push(loc6);
                    call loc5 := popArgs1();
                }
                call push(loc7);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc7 := popArgs1();
                goto label$5_start_19;
            }
            call push(loc5);
            call push(255.0);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (1);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
            call push(loc4);
            call push(loc10);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call push(loc9);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            store_i := real_to_int($tmp2);
            call mem_write_u32(idx, store_i);
            call push(loc5);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc9 := popArgs1();
            call push(loc9);
            call loc6 := popArgs1();
            call push(0.0);
            call loc7 := popArgs1();
            call push(37184.0);
            call loc4 := popArgs1();
            call push(37184.0);
            call loc2 := popArgs1();
        } else {
            call push(loc1);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (1);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call loc14 := popArgs1();
            call push(loc1);
            call push(2.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
        }
        goto label$1_start_13;
    }
    call push(0.0);
    call loc5 := popArgs1();
    call push(1530550.0);
    call loc4 := popArgs1();
label$15_start_31:
    call push(loc4);
    call push(1530658.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc4);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call loc3 := popArgs1();
        call push(loc4);
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (2);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call loc2 := popArgs1();
        call push(loc2);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc2);
            call func_0();
            call popToTmp2();
            $tmp3 := $tmp2;
        } else {
            call push(255.0);
            call popToTmp2();
            $tmp3 := $tmp2;
        }
        call push($tmp3);
        call loc6 := popArgs1();
        call push(loc6);
        call push(255.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc3);
            call push(loc5);
            call func_1();
            call push(loc2);
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc2);
                call push(loc5);
                call func_1();
            }
            call push(loc5);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc5 := popArgs1();
        } else {
            call push(loc3);
            call push(loc6);
            call func_1();
        }
        call push(global_4);
        call loc2 := popArgs1();
        call push(loc2);
        call push(loc3);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (1024);
        store_i := real_to_int($tmp2);
        call mem_write_u16(idx, store_i);
        call push(loc2);
        call push(2.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call global_4 := popArgs1();
        call push(loc4);
        call push(4.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc4 := popArgs1();
        goto label$15_start_31;
    }
    call push(global_4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
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
    var arg3: real;
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
    call push(1529880.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u16(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
label$1_start_38:
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc3);
        call func_0();
        call loc4 := popArgs1();
        call push(loc4);
        call push(255.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(0.0);
            goto func_exit_43;
        }
        call push(loc1);
        call push(1530008.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc4);
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
        call push(loc1);
        call push(1530072.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(0.0);
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u8(idx, store_i);
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call push(1529880.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call loc3 := popArgs1();
        goto label$1_start_38;
    }
    call push(loc1);
    call loc4 := popArgs1();
label$4_start_45:
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(37184.0);
        call loc3 := popArgs1();
        call push(loc5);
        call loc1 := popArgs1();
label$6_start_48:
        call push(loc1);
        call push(loc4);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(1530008.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call push(3.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_shl($tmp2, $tmp1));
            call push(loc3);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc2 := popArgs1();
            call push(loc2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc3 := popArgs1();
            call push(loc2);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (4);
            call load_i := mem_read_s32(idx);
            call push(int_to_real(load_i));
            call loc7 := popArgs1();
            call push(loc7);
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) > ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call loc2 := popArgs1();
                call push(loc7);
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                call load_i := mem_read_u8(idx);
                call push(int_to_real(load_i));
                call loc6 := popArgs1();
label$10_start_54:
                call push(loc6);
                call push(255.0);
                call popToTmp1();
                call popToTmp2();
                call push(bool_to_real(($tmp2) != ($tmp1)));
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(loc6);
                    call push(loc5);
                    call push(1530072.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(($tmp2) + ($tmp1));
                    call push(loc2);
                    call popToTmp1();
                    call popToTmp2();
                    call push(($tmp2) + ($tmp1));
                    call loc8 := popArgs1();
                    call push(loc8);
                    call popToTmp1();
                    idx := (real_to_int($tmp1)) + (0);
                    call load_i := mem_read_u8(idx);
                    call push(int_to_real(load_i));
                    call popToTmp1();
                    call popToTmp2();
                    call push(bool_to_real(($tmp2) > ($tmp1)));
                    call popToTmp1();
                    if (real_to_bool($tmp1)) {
                        call push(loc8);
                        call push(loc6);
                        call popToTmp2();
                        call popToTmp1();
                        idx := (real_to_int($tmp1)) + (0);
                        store_i := real_to_int($tmp2);
                        call mem_write_u8(idx, store_i);
                    }
                    call push(loc7);
                    call push(loc2);
                    call push(1.0);
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
                    call loc6 := popArgs1();
                    goto label$10_start_54;
                }
            }
            call push(loc3);
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) <= ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                goto label$8_end_50;
            }
            call push(loc1);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call loc1 := popArgs1();
            goto label$6_start_48;
label$8_end_50:
        }
        call push(loc5);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc5 := popArgs1();
        goto label$4_start_45;
    }
    call push(1.0);
    call loc1 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(loc4);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg2 := popArgs1();
label$13_start_60:
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(bv_shl($tmp2, $tmp1));
        call loc4 := popArgs1();
        call push(loc4);
        call push(1530136.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc2);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call push(loc4);
        call push(1529880.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        call load_i := mem_read_u16(idx);
        call push(int_to_real(load_i));
        call popToTmp2();
        call popToTmp1();
        idx := (real_to_int($tmp1)) + (0);
        store_i := real_to_int($tmp2);
        call mem_write_u16(idx, store_i);
        call push(loc1);
        call push(arg2);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) <= ($tmp1)));
        call push(0.0);
        call push(loc1);
        call push(arg1);
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
        if (real_to_bool($tmp1)) {
            call push(loc1);
            call push(1530072.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (1);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(bv_and($tmp2, $tmp1));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc2);
                call push(2.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call loc2 := popArgs1();
                call push(loc2);
                call push(loc1);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(bv_shl($tmp2, $tmp1));
                call push(1530136.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call push(arg3);
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u16(idx, store_i);
            }
        }
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        goto label$13_start_60;
    }
    call push(1530136.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u16(idx, store_i);
    call push(1.0);
func_exit_43:
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

procedure {:inline 1} CorralChoice__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece();
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
implementation CorralChoice__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (5)));
    if ((c) == (0)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_0();
        call popDiscard1();
    } else if ((c) == (1)) {
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
        call popDiscard1();
    } else if ((c) == (3)) {
        call func_3();
        call popDiscard1();
    } else if ((c) == (4)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_4();
        call popDiscard1();
    }
}

procedure BoogieEntry__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece();
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
implementation BoogieEntry__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (5)));
        if ((c) == (0)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_0();
            call popDiscard1();
        } else if ((c) == (1)) {
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
            call popDiscard1();
        } else if ((c) == (3)) {
            call func_3();
            call popDiscard1();
        } else if ((c) == (4)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_4();
            call popDiscard1();
        }
    }
}

procedure CorralEntry__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece();
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
implementation CorralEntry__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__09dfe684cd5c12e0b28b536d612164e0fdcbb37caac35cd2c98c986783703ece();
    }
}

