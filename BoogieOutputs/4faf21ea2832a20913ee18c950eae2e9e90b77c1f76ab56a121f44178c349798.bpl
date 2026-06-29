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

axiom((global_0) == (34.0));
var global_1: real;
var global_2: real;
var global_3: real;
var global_4: real;
const global_5: real;

axiom((global_5) == (44.0));
const global_6: real;

axiom((global_6) == (10.0));
var global_7: real;
var global_8: real;
var global_9: real;
var global_10: real;
var global_11: real;
var global_12: real;
var global_13: real;
var global_14: real;
var global_15: real;
const global_16: real;

axiom((global_16) == (4.0));
procedure {:inline 1} initGlobals();
modifies $mem_pages;
modifies global_1;
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
ensures(($mem_pages) == (0));
ensures((global_1) == (0.0));
ensures((global_2) == (0.0));
ensures((global_3) == (0.0));
ensures((global_4) == (0.0));
ensures((global_7) == (0.0));
ensures((global_8) == (0.0));
ensures((global_9) == (1.0));
ensures((global_10) == (0.0));
ensures((global_11) == (1.0));
ensures((global_12) == (0.0));
ensures((global_13) == (0.0));
ensures((global_14) == (0.0));
ensures((global_15) == (0.0));
implementation initGlobals()
{
    $mem_pages := 0;
    global_1 := 0.0;
    global_2 := 0.0;
    global_3 := 0.0;
    global_4 := 0.0;
    global_7 := 0.0;
    global_8 := 0.0;
    global_9 := 1.0;
    global_10 := 0.0;
    global_11 := 1.0;
    global_12 := 0.0;
    global_13 := 0.0;
    global_14 := 0.0;
    global_15 := 0.0;
}

procedure {:inline 1} strip_js_included();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation strip_js_included()
{
}

procedure {:inline 1} strip_js_done();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation strip_js_done()
{
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

procedure {:inline 1} strip_checkIncluded();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_10;
implementation strip_checkIncluded()
{
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(global_9);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_4);
        call push(global_8);
        call strip_js_included();
        call loc1 := popArgs1();
        call push(loc1);
        call push(0.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) >= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(global_10);
            call push(global_11);
            call popToTmp1();
            call popToTmp2();
            call push(bv_or($tmp2, $tmp1));
            call global_10 := popArgs1();
        }
    }
}

procedure {:inline 1} strip_stripQuotes();
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
modifies global_8;
implementation strip_stripQuotes()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(global_3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_7);
        call popToTmp1();
        call push(bool_to_real(($tmp1) == (0.0)));
        call popToTmp2();
        $tmp3 := $tmp2;
    } else {
        call push(global_3);
        call popToTmp2();
        $tmp3 := $tmp2;
    }
    call push($tmp3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_4);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call global_4 := popArgs1();
        call push(global_8);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call global_8 := popArgs1();
    }
}

procedure {:inline 1} strip_writeValue();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_13;
modifies global_12;
modifies global_4;
implementation strip_writeValue()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(global_10);
    call push(global_11);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_12);
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(global_13);
            call push(44.0);
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
            call push(global_13);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call global_13 := popArgs1();
        } else {
            call push(global_14);
            call push(0.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) != ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(global_13);
                call push(10.0);
                call popToTmp2();
                call popToTmp1();
                idx := (real_to_int($tmp1)) + (0);
                store_i := real_to_int($tmp2);
                call mem_write_u8(idx, store_i);
                call push(global_13);
                call push(1.0);
                call popToTmp1();
                call popToTmp2();
                call push(($tmp2) + ($tmp1));
                call global_13 := popArgs1();
            }
            call push(1.0);
            call global_12 := popArgs1();
        }
label$6_start_9:
        call push(global_4);
        call push(global_8);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) < ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(global_13);
            call push(global_4);
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            call load_i := mem_read_u8(idx);
            call push(int_to_real(load_i));
            call popToTmp2();
            call popToTmp1();
            idx := (real_to_int($tmp1)) + (0);
            store_i := real_to_int($tmp2);
            call mem_write_u8(idx, store_i);
            call push(global_13);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call global_13 := popArgs1();
            call push(global_4);
            call push(1.0);
            call popToTmp1();
            call popToTmp2();
            call push(($tmp2) + ($tmp1));
            call global_4 := popArgs1();
            goto label$6_start_9;
        }
    }
}

procedure {:inline 1} strip_onEndValue();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
modifies global_8;
modifies global_4;
modifies global_7;
modifies global_3;
implementation strip_onEndValue()
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
    call global_8 := popArgs1();
    call strip_checkIncluded();
    call strip_stripQuotes();
    call strip_writeValue();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_4 := popArgs1();
    call push(0.0);
    call global_7 := popArgs1();
    call push(0.0);
    call global_3 := popArgs1();
}

procedure {:inline 1} strip_strip();
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
modifies global_2;
modifies global_3;
modifies global_7;
modifies global_15;
modifies global_11;
modifies global_9;
modifies global_14;
modifies global_12;
implementation strip_strip()
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
    call push(0.0);
    call loc1 := popArgs1();
label$3_start_15:
    call push(loc1);
    call push(arg1);
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
        call push(34.0);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) == ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(global_1);
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(0.0);
                call global_1 := popArgs1();
                call push(1.0);
                call global_2 := popArgs1();
            } else {
                call push(loc1);
                call push(global_4);
                call popToTmp1();
                call popToTmp2();
                call push(bool_to_real(($tmp2) == ($tmp1)));
                call global_3 := popArgs1();
                call push(global_3);
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(global_3);
                    call popToTmp2();
                    $tmp3 := $tmp2;
                } else {
                    call push(global_2);
                    call popToTmp2();
                    $tmp3 := $tmp2;
                }
                call push($tmp3);
                call global_1 := popArgs1();
            }
        } else {
            call push(0.0);
            call global_2 := popArgs1();
            call push(loc3);
            call push(44.0);
            call popToTmp1();
            call popToTmp2();
            call push(bool_to_real(($tmp2) == ($tmp1)));
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(loc3);
                call push(44.0);
                call popToTmp1();
                call popToTmp2();
                call push(bool_to_real(($tmp2) == ($tmp1)));
                call popToTmp2();
                $tmp3 := $tmp2;
            } else {
                call push(loc3);
                call push(10.0);
                call popToTmp1();
                call popToTmp2();
                call push(bool_to_real(($tmp2) == ($tmp1)));
                call popToTmp2();
                $tmp3 := $tmp2;
            }
            call push($tmp3);
            call popToTmp1();
            if (real_to_bool($tmp1)) {
                call push(global_1);
                call popToTmp1();
                if (real_to_bool($tmp1)) {
                    call push(1.0);
                    call global_7 := popArgs1();
                } else {
                    call push(loc1);
                    call strip_onEndValue();
                    call push(loc3);
                    call push(44.0);
                    call popToTmp1();
                    call popToTmp2();
                    call push(bool_to_real(($tmp2) == ($tmp1)));
                    call popToTmp1();
                    if (real_to_bool($tmp1)) {
                        call push(global_15);
                        call push(1.0);
                        call popToTmp1();
                        call popToTmp2();
                        call push(($tmp2) + ($tmp1));
                        call global_15 := popArgs1();
                        call push(global_11);
                        call push(1.0);
                        call popToTmp1();
                        call popToTmp2();
                        call push(bv_shl($tmp2, $tmp1));
                        call global_11 := popArgs1();
                    } else {
                        call push(0.0);
                        call global_9 := popArgs1();
                        call push(0.0);
                        call global_15 := popArgs1();
                        call push(1.0);
                        call global_11 := popArgs1();
                        call push(global_14);
                        call push(1.0);
                        call popToTmp1();
                        call popToTmp2();
                        call push(($tmp2) + ($tmp1));
                        call global_14 := popArgs1();
                        call push(0.0);
                        call global_12 := popArgs1();
                    }
                }
            }
        }
        call push(loc1);
        call loc2 := popArgs1();
        call push(loc2);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call loc1 := popArgs1();
        call push(loc2);
        call pop();
        goto label$3_start_15;
    }
    call push(arg1);
    call strip_onEndValue();
    call push(global_13);
    call strip_js_done();
}

procedure {:inline 1} CorralChoice__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
implementation CorralChoice__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (5)));
    if ((c) == (0)) {
        call strip_checkIncluded();
    } else if ((c) == (1)) {
        call strip_stripQuotes();
    } else if ((c) == (2)) {
        call strip_writeValue();
    } else if ((c) == (3)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call strip_onEndValue();
    } else if ((c) == (4)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call strip_strip();
    }
}

procedure BoogieEntry__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
implementation BoogieEntry__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798()
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
            call strip_checkIncluded();
        } else if ((c) == (1)) {
            call strip_stripQuotes();
        } else if ((c) == (2)) {
            call strip_writeValue();
        } else if ((c) == (3)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call strip_onEndValue();
        } else if ((c) == (4)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call strip_strip();
        }
    }
}

procedure CorralEntry__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798();
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
modifies global_2;
modifies global_3;
modifies global_4;
modifies global_7;
modifies global_8;
modifies global_9;
modifies global_10;
modifies global_11;
modifies global_12;
modifies global_13;
modifies global_14;
modifies global_15;
implementation CorralEntry__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__4faf21ea2832a20913ee18c950eae2e9e90b77c1f76ab56a121f44178c349798();
    }
}

