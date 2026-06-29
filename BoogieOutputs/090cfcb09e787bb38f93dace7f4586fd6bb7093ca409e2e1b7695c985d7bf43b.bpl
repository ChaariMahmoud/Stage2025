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

procedure {:inline 1} initGlobals();
modifies $mem_pages;
ensures(($mem_pages) == (0));
implementation initGlobals()
{
    $mem_pages := 0;
}

procedure {:inline 1} args();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation args()
{
}

procedure {:inline 1} args_len();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation args_len()
{
}

procedure {:inline 1} debug();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation debug()
{
}

procedure {:inline 1} get_storage();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation get_storage()
{
}

procedure {:inline 1} get_storage_len();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation get_storage_len()
{
}

procedure {:inline 1} return_data();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation return_data()
{
}

procedure {:inline 1} set_storage();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation set_storage()
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

procedure {:inline 1} test_print_args();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation test_print_args()
{
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
    call push(168.0);
    call push(5.0);
    call debug();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call debug();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1;
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_1:
    call push(0.0);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} test_return_args();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation test_return_args()
{
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call return_data();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_2;
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_2:
    call push(0.0);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} test_set_storage();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation test_set_storage()
{
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(176.0);
    call push(13.0);
    call set_storage();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_3;
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_3:
    call push(0.0);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} test_get_storage();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation test_get_storage()
{
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    loc2 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
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
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call return_data();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_4;
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_4:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_5;
    }
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_5;
    }
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_5:
    call push(0.0);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} test_counter();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation test_counter()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(192.0);
    call push(7.0);
    call _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E();
    call push(1.0);
    call loc2 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_7;
    }
    call push(loc1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_6;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$2_end_7:
    call push(loc3);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(2140.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc3);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(224.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc3);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN5alloc3fmt6format17hef57d46af5b16199E();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call debug();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_8;
    }
    call push(loc2);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc2);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$3_end_8:
    call push(loc3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(308.0);
    call push(4.0);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_9;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_9;
    }
    call push(loc2);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(192.0);
    call push(7.0);
    call push(loc2);
    call push(4.0);
    call set_storage();
    call push(loc2);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc2);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_10;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_10;
    }
    call push(loc2);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc2);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$5_end_10:
    call push(0.0);
    call push(loc3);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_11;
label$4_end_9:
    assume (false);
label$1_end_6:
    call push(144.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
func_exit_11:
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

procedure {:inline 1} rust_begin_unwind();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation rust_begin_unwind()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(76.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(312.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(1300.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN5alloc3fmt6format17hef57d46af5b16199E();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call debug();
    assume (false);
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

procedure {:inline 1} _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h2ceb0c6a1460bad2E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h2ceb0c6a1460bad2E()
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
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
}

procedure {:inline 1} _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E()
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
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call args_len();
    call loc1 := popArgs1();
    call push(loc1);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_12;
    }
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_14;
    }
    call push(loc3);
    call push(308.0);
    call push(loc1);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_15;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call push(loc1);
    call memset();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_13;
    }
label$4_end_15:
    assume (false);
label$3_end_14:
    call push(1.0);
    call loc2 := popArgs1();
label$2_end_13:
    call push(loc2);
    call args();
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_16;
label$1_end_12:
    call push(232.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
func_exit_16:
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

procedure {:inline 1} _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg3);
    call get_storage_len();
    call loc1 := popArgs1();
    call push(loc1);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_17;
    }
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_19;
    }
    call push(loc3);
    call push(308.0);
    call push(loc1);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_20;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call push(loc1);
    call memset();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_18;
    }
label$4_end_20:
    assume (false);
label$3_end_19:
    call push(1.0);
    call loc2 := popArgs1();
label$2_end_18:
    call push(arg2);
    call push(arg3);
    call push(loc2);
    call get_storage();
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_21;
label$1_end_17:
    call push(232.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
func_exit_21:
}

procedure {:inline 1} _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    call push(arg4);
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_22;
    }
    call push(arg1);
    call push(2147483647.0);
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
    call push(368.0);
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
    call push(50.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_23;
label$1_end_22:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_33;
    }
    call push(arg3);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_32;
    }
    call push(arg2);
    call loc4 := popArgs1();
label$12_start_34:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_30;
    }
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_start_34;
    }
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(65543.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := real_to_int($tmp1);
    call load_i := memory_grow(idx);
    call push(int_to_real(load_i));
    call pop();
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_31;
    }
label$13_start_36:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_28;
    }
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_start_36;
    }
    goto label$9_end_31;
label$11_end_33:
    call push(arg1);
    call push(2147483647.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    goto func_exit_23;
label$10_end_32:
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(65543.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := real_to_int($tmp1);
    call load_i := memory_grow(idx);
    call push(int_to_real(load_i));
    call pop();
    call push(loc4);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_31;
    }
label$14_start_38:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_29;
    }
    call push(loc4);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_start_38;
    }
label$9_end_31:
    call push(arg1);
    call push(1.0);
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
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(2.0);
    call loc2 := popArgs1();
    goto label$2_end_24;
label$8_end_30:
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(71.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_40;
    }
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$3_end_25;
label$15_end_40:
    call push(arg4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$3_end_25;
label$7_end_29:
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(71.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_27;
    }
    call push(arg2);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$3_end_25;
label$6_end_28:
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(71.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_26;
    }
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$3_end_25;
label$5_end_27:
    call push(arg4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$3_end_25;
label$4_end_26:
    call push(arg4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$3_end_25:
    call push(0.0);
    call loc2 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_24:
    call push(arg1);
    call push(loc2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
func_exit_23:
}

procedure {:inline 1} memcpy();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation memcpy()
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
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_41;
    }
    call push(arg1);
    call loc1 := popArgs1();
label$2_start_42:
    call push(loc1);
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
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_42;
    }
label$1_end_41:
    call push(arg1);
}

procedure {:inline 1} memmove();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation memmove()
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
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_45;
    }
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_44;
    }
label$3_start_46:
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
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
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_46;
    }
    goto label$1_end_44;
label$2_end_45:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_44;
    }
    call push(arg1);
    call loc1 := popArgs1();
label$4_start_48:
    call push(loc1);
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
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_48;
    }
label$1_end_44:
    call push(arg1);
}

procedure {:inline 1} memset();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation memset()
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
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_50;
    }
    call push(arg1);
    call loc1 := popArgs1();
label$2_start_51:
    call push(loc1);
    call push(arg2);
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
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_51;
    }
label$1_end_50:
    call push(arg1);
}

procedure {:inline 1} memcmp();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation memcmp()
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
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_54;
    }
    call push(0.0);
    call loc3 := popArgs1();
label$3_start_55:
    call push(arg1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg2);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_53;
    }
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_55;
    }
    call push(0.0);
    goto func_exit_57;
label$2_end_54:
    call push(0.0);
    goto func_exit_57;
label$1_end_53:
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
func_exit_57:
}

procedure {:inline 1} _ZN4core3ptr13drop_in_place17h8866dde8cca892acE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3ptr13drop_in_place17h8866dde8cca892acE()
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

procedure {:inline 1} _ZN5alloc3fmt6format17hef57d46af5b16199E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN5alloc3fmt6format17hef57d46af5b16199E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_59;
    }
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
label$3_start_60:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_60;
    }
    goto label$1_end_58;
label$2_end_59:
    call push(0.0);
    call loc5 := popArgs1();
label$1_end_58:
    call push(arg2);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_68;
    }
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_65;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_70;
    }
    call push(loc5);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_69;
    }
label$12_end_70:
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_67;
    }
label$11_end_69:
    call push(1.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    goto label$8_end_66;
label$10_end_68:
    call push(loc5);
    call loc4 := popArgs1();
label$9_end_67:
    call push(loc4);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_64;
    }
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_71;
    }
    call push(loc6);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(308.0);
    call push(loc4);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_63;
    }
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_62;
    }
    call push(loc3);
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc3 := popArgs1();
    goto label$8_end_66;
label$13_end_71:
    call push(1.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$8_end_66:
    call push(loc6);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
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
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg2);
    call push(16.0);
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
    call push(loc6);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg2);
    call push(8.0);
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
    call push(loc6);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(420.0);
    call push(loc6);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN4core3fmt5write17h0d61204d0975bad3E();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_72;
    }
    call push(loc4);
    call push(loc5);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
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
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call push(loc6);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_73;
label$14_end_72:
    call _ZN4core6result13unwrap_failed17h575cbe6ecb5ed4e7E();
    assume (false);
label$7_end_65:
    call push(444.0);
    call push(0.0);
    call push(0.0);
    call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
    assume (false);
label$6_end_64:
    call push(628.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
label$5_end_63:
    call push(loc6);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call push(68.0);
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
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$4_end_62:
    assume (false);
func_exit_73:
}

procedure {:inline 1} _ZN4core6result13unwrap_failed17h575cbe6ecb5ed4e7E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core6result13unwrap_failed17h575cbe6ecb5ed4e7E()
{
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(51.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(464.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(5.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2240.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(560.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(576.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
}

procedure {:inline 1} _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h92dbaa5dd091f910E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h92dbaa5dd091f910E()
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
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
}

procedure {:inline 1} _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_10write_char17h9757dc18459768ddE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_10write_char17h9757dc18459768ddE()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
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
    call arg1 := popArgs1();
    call push(arg2);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_77;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_76;
    }
    goto label$2_end_75;
label$4_end_77:
    call push(0.0);
    call loc3 := popArgs1();
    call push(loc7);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(2048.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_79;
    }
    call push(2.0);
    call loc6 := popArgs1();
    call push(1.0);
    call loc5 := popArgs1();
    call push(192.0);
    call loc4 := popArgs1();
    call push(31.0);
    call loc2 := popArgs1();
    goto label$5_end_78;
label$6_end_79:
    call push(arg2);
    call push(65536.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_81;
    }
    call push(3.0);
    call loc6 := popArgs1();
    call push(2.0);
    call loc5 := popArgs1();
    call push(1.0);
    call loc3 := popArgs1();
    call push(224.0);
    call loc4 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(15.0);
    call loc1 := popArgs1();
    goto label$7_end_80;
label$8_end_81:
    call push(loc7);
    call push(arg2);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(4.0);
    call loc6 := popArgs1();
    call push(3.0);
    call loc5 := popArgs1();
    call push(2.0);
    call loc3 := popArgs1();
    call push(128.0);
    call loc4 := popArgs1();
    call push(1.0);
    call loc2 := popArgs1();
    call push(63.0);
    call loc1 := popArgs1();
label$7_end_80:
    call push(loc7);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc1);
    call push(arg2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(128.0);
    call loc4 := popArgs1();
    call push(63.0);
    call loc2 := popArgs1();
label$5_end_78:
    call push(loc7);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc7);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(loc7);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE();
    goto label$1_end_74;
label$3_end_76:
    call push(arg1);
    call _ZN49__LT_alloc__raw_vec__RawVec_LT_T_C__u20_A_GT__GT_6double17hf5c514db857b9fbfE();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
label$2_end_75:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_74:
    call push(0.0);
    call push(loc7);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
}

procedure {:inline 1} _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_fmt17h73b6f874c56447a3E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_fmt17h73b6f874c56447a3E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
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
    call arg1 := popArgs1();
    call push(loc3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg2);
    call push(16.0);
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
    call push(loc3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg2);
    call push(8.0);
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
    call push(loc3);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(420.0);
    call push(loc3);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN4core3fmt5write17h0d61204d0975bad3E();
    call arg2 := popArgs1();
    call push(0.0);
    call push(loc3);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
}

procedure {:inline 1} _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_str17h2be41beb78a77972E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_str17h2be41beb78a77972E()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE();
    call push(0.0);
}

procedure {:inline 1} _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_90;
    }
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_85;
    }
    call push(loc3);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc3);
    call push(loc6);
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
    call loc4 := popArgs1();
    call push(loc4);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_84;
    }
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_89;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc2);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_88;
    }
    call push(loc5);
    call loc6 := popArgs1();
    goto label$6_end_87;
label$9_end_90:
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    goto label$5_end_86;
label$8_end_89:
    call push(loc7);
    call push(308.0);
    call push(loc4);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_82;
    }
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_83;
    }
    call push(loc2);
    call push(arg1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc6 := popArgs1();
    goto label$6_end_87;
label$7_end_88:
    call push(loc7);
    call push(308.0);
    call push(loc4);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_83;
    }
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc5);
    call push(loc2);
    call push(loc4);
    call push(loc2);
    call push(loc4);
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
    call memcpy();
    call loc2 := popArgs1();
    call push(loc5);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc5);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_83;
    }
label$6_end_87:
    call push(arg1);
    call push(loc6);
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
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$5_end_86:
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(arg3);
    call memcpy();
    call pop();
    call push(0.0);
    call push(loc7);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_91;
label$4_end_85:
    call _ZN4core6option13expect_failed17h6057b6d59655e712E();
    assume (false);
label$3_end_84:
    call push(628.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
label$2_end_83:
    assume (false);
label$1_end_82:
    call push(loc7);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
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
    call push(loc7);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    assume (false);
func_exit_91:
}

procedure {:inline 1} _ZN49__LT_alloc__raw_vec__RawVec_LT_T_C__u20_A_GT__GT_6double17hf5c514db857b9fbfE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN49__LT_alloc__raw_vec__RawVec_LT_T_C__u20_A_GT__GT_6double17hf5c514db857b9fbfE()
{
    var arg1: real;
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
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
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
        goto label$8_end_99;
    }
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_96;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_98;
    }
    call push(loc2);
    call loc3 := popArgs1();
    goto label$6_end_97;
label$8_end_99:
    call push(loc5);
    call push(308.0);
    call push(4.0);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_94;
    }
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_93;
    }
    call push(4.0);
    call loc4 := popArgs1();
    goto label$6_end_97;
label$7_end_98:
    call push(loc5);
    call push(308.0);
    call push(loc4);
    call push(1.0);
    call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_95;
    }
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc2);
    call push(loc1);
    call push(loc4);
    call push(loc1);
    call push(loc4);
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
    call memcpy();
    call loc1 := popArgs1();
    call push(loc2);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc2);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (308);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_95;
    }
label$6_end_97:
    call push(arg1);
    call push(loc3);
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
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call push(loc5);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_100;
label$5_end_96:
    call push(628.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
label$4_end_95:
    assume (false);
label$3_end_94:
    call push(loc5);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    goto label$1_end_92;
label$2_end_93:
label$1_end_92:
    call push(loc5);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    assume (false);
func_exit_100:
}

procedure {:inline 1} _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Debug_u20_for_u20_usize_GT_3fmt17headb3a1168984a69E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Debug_u20_for_u20_usize_GT_3fmt17headb3a1168984a69E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(39.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_102;
    }
    call push(39.0);
    call loc3 := popArgs1();
label$3_start_103:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(100000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call loc1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call arg1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_103;
    }
    goto label$1_end_101;
label$2_end_102:
    call push(arg1);
    call loc2 := popArgs1();
label$1_end_101:
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_105;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
label$4_end_105:
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_107;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto label$5_end_106;
label$6_end_107:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
label$5_end_106:
    call push(arg2);
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(39.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
    call arg1 := popArgs1();
    call push(0.0);
    call push(loc4);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} _ZN4core3fmt3num54__LT_impl_u20_core__fmt__Display_u20_for_u20_usize_GT_3fmt17hf3fa95afcb7e8063E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt3num54__LT_impl_u20_core__fmt__Display_u20_for_u20_usize_GT_3fmt17hf3fa95afcb7e8063E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(39.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_109;
    }
    call push(39.0);
    call loc3 := popArgs1();
label$3_start_110:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(100000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call loc1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call arg1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_110;
    }
    goto label$1_end_108;
label$2_end_109:
    call push(arg1);
    call loc2 := popArgs1();
label$1_end_108:
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_112;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
label$4_end_112:
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_114;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto label$5_end_113;
label$6_end_114:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
label$5_end_113:
    call push(arg2);
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(39.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
    call arg1 := popArgs1();
    call push(0.0);
    call push(loc4);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Display_u20_for_u20_u32_GT_3fmt17he0e855804ed9a1faE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Display_u20_for_u20_u32_GT_3fmt17he0e855804ed9a1faE()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(39.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_116;
    }
    call push(39.0);
    call loc3 := popArgs1();
label$3_start_117:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(100000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call loc1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call arg1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_117;
    }
    goto label$1_end_115;
label$2_end_116:
    call push(arg1);
    call loc2 := popArgs1();
label$1_end_115:
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_119;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
label$4_end_119:
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_121;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto label$5_end_120;
label$6_end_121:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
label$5_end_120:
    call push(arg2);
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(39.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
    call arg1 := popArgs1();
    call push(0.0);
    call push(loc4);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} _ZN4core3fmt10ArgumentV110show_usize17hbb4fe5a23913dc33E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt10ArgumentV110show_usize17hbb4fe5a23913dc33E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(39.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_123;
    }
    call push(39.0);
    call loc3 := popArgs1();
label$3_start_124:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(100000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call loc1 := popArgs1();
    call push(arg1);
    call push(10000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call arg1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_124;
    }
    goto label$1_end_122;
label$2_end_123:
    call push(arg1);
    call loc2 := popArgs1();
label$1_end_122:
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_126;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(int_rem_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
    call push(loc2);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
label$4_end_126:
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_128;
    }
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto label$5_end_127;
label$6_end_128:
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(708.0);
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
label$5_end_127:
    call push(arg2);
    call push(loc4);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(39.0);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
    call arg1 := popArgs1();
    call push(0.0);
    call push(loc4);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} popDiscard4();
modifies $sp;
requires(($sp) >= (4));
ensures(($sp) == ((old($sp)) - (4)));
ensures((0) <= ($sp));
implementation popDiscard4()
{
    $sp := ($sp) - (4);
}

procedure {:inline 1} popDiscard3();
modifies $sp;
requires(($sp) >= (3));
ensures(($sp) == ((old($sp)) - (3)));
ensures((0) <= ($sp));
implementation popDiscard3()
{
    $sp := ($sp) - (3);
}

procedure {:inline 1} _ZN4core3fmt5write17h0d61204d0975bad3E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt5write17h0d61204d0975bad3E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc11 := popArgs1();
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(2147483647.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc11);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc11);
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc11);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc4);
    call push(loc3);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_137;
    }
    call push(loc3);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc3);
    call push(arg3);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc11);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(loc11);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc11);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
label$10_start_138:
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_136;
    }
    call push(loc11);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_134;
    }
    call push(loc11);
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_135;
    }
    call push(loc8);
    call push(loc3);
    call push(32.0);
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
    call push(loc11);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(loc3);
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
    call push(0.0);
    call loc12 := popArgs1();
    call push(loc3);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_145;
    }
    call push(loc4);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_144;
    }
    call push(loc4);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_143;
    }
    call push(loc11);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_141;
    }
    call push(loc4);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_140;
    }
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    goto label$13_end_142;
label$16_end_145:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_130;
    }
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc10);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_140;
    }
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    goto label$13_end_142;
label$15_end_144:
    goto label$11_end_140;
label$14_end_143:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
label$13_end_142:
    call push(1.0);
    call loc12 := popArgs1();
    goto label$11_end_140;
label$12_end_141:
label$11_end_140:
    call push(loc11);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc12 := popArgs1();
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_end_151;
    }
    call push(loc4);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_150;
    }
    call push(loc4);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_end_149;
    }
    call push(loc11);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_end_147;
    }
    call push(loc4);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_146;
    }
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    goto label$19_end_148;
label$22_end_151:
    call push(arg1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_129;
    }
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc10);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_146;
    }
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    goto label$19_end_148;
label$21_end_150:
    goto label$17_end_146;
label$20_end_149:
    call push(arg1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
label$19_end_148:
    call push(1.0);
    call loc12 := popArgs1();
    goto label$17_end_146;
label$18_end_147:
label$17_end_146:
    call push(loc11);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_153;
    }
    call push(arg1);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_132;
    }
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    goto label$23_end_152;
label$24_end_153:
    call push(loc11);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_131;
    }
    call push(loc10);
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$23_end_152:
    call push(loc3);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc11);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_138;
    }
    goto label$7_end_135;
label$9_end_137:
    call push(loc11);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
label$25_start_154:
    call push(arg1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_136;
    }
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_136;
    }
    call push(loc11);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_135;
    }
    call push(arg1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc2);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc3);
    call arg2 := popArgs1();
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg3);
    call push(loc11);
    call push(loc6);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$25_start_154;
    }
    goto label$7_end_135;
label$8_end_136:
    call push(arg2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_134;
    }
    call push(loc11);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc11);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc11);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_134;
    }
label$7_end_135:
    call push(1.0);
    call loc3 := popArgs1();
    goto label$5_end_133;
label$6_end_134:
    call push(0.0);
    call loc3 := popArgs1();
label$5_end_133:
    call push(0.0);
    call push(loc11);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    goto func_exit_156;
label$4_end_132:
    call push(952.0);
    call push(loc4);
    call push(loc10);
    call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
    assume (false);
label$3_end_131:
    call push(928.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
label$2_end_130:
    call push(912.0);
    call push(loc10);
    call push(loc4);
    call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
    assume (false);
label$1_end_129:
    call push(912.0);
    call push(loc10);
    call push(loc4);
    call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
    assume (false);
func_exit_156:
}

procedure {:inline 1} _ZN73__LT_core__fmt__Arguments_LT__u27_a_GT__u20_as_u20_core__fmt__Display_GT_3fmt17h10aa4a4d757dd8d6E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN73__LT_core__fmt__Arguments_LT__u27_a_GT__u20_as_u20_core__fmt__Display_GT_3fmt17h10aa4a4d757dd8d6E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(16.0);
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
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(8.0);
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
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(loc1);
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN4core3fmt5write17h0d61204d0975bad3E();
    call arg1 := popArgs1();
    call push(0.0);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc13 := popArgs1();
    call push(loc13);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(43.0);
    call push(1114112.0);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc2 := popArgs1();
    call push(loc12);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_165;
    }
    call push(arg1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_164;
    }
    call push(loc12);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_163;
    }
    call push(loc7);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(1.0);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call push(loc12);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc12 := popArgs1();
    call push(loc12);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_162;
    }
    call push(loc12);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_161;
    }
    call push(loc4);
    call loc9 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
    goto label$4_end_160;
label$9_end_165:
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_166;
    }
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc13);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(1.0);
    call loc12 := popArgs1();
    call push(loc1);
    call push(loc13);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$10_end_166:
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_167;
    }
    call push(1.0);
    call loc12 := popArgs1();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(912.0);
    call push(0.0);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$11_end_167:
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call loc12 := popArgs1();
    goto label$1_end_157;
label$8_end_164:
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_168;
    }
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc13);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(1.0);
    call loc12 := popArgs1();
    call push(loc1);
    call push(loc13);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$12_end_168:
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_169;
    }
    call push(1.0);
    call loc12 := popArgs1();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(912.0);
    call push(0.0);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$13_end_169:
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call loc12 := popArgs1();
    goto label$1_end_157;
label$7_end_163:
    call push(1.0);
    call loc12 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(48.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_170;
    }
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc11 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc13);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc11);
    call push(loc13);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$14_end_170:
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_171;
    }
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(912.0);
    call push(0.0);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_157;
    }
label$15_end_171:
    call push(0.0);
    call loc12 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc13);
    call push(48.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc7);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc7 := popArgs1();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$17_start_173:
    call push(loc12);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_172;
    }
    call push(loc12);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_172;
    }
    call push(arg1);
    call loc12 := popArgs1();
    call push(loc1);
    call push(loc13);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_start_173;
    }
    goto label$3_end_159;
label$16_end_172:
    call push(loc1);
    call push(arg2);
    call push(arg3);
    call push(loc5);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_159;
    }
    call push(0.0);
    call loc12 := popArgs1();
    goto label$1_end_157;
label$6_end_162:
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc9 := popArgs1();
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    goto label$4_end_160;
label$5_end_161:
    call push(0.0);
    call loc9 := popArgs1();
label$4_end_160:
    call push(0.0);
    call loc7 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_176;
    }
    call push(loc13);
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(1.0);
    call loc11 := popArgs1();
    goto label$18_end_175;
label$19_end_176:
    call push(loc12);
    call push(2048.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_178;
    }
    call push(2.0);
    call loc11 := popArgs1();
    call push(1.0);
    call loc5 := popArgs1();
    call push(192.0);
    call loc8 := popArgs1();
    call push(31.0);
    call loc6 := popArgs1();
    goto label$20_end_177;
label$21_end_178:
    call push(loc12);
    call push(65536.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$23_end_180;
    }
    call push(3.0);
    call loc11 := popArgs1();
    call push(2.0);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(224.0);
    call loc8 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(15.0);
    call loc10 := popArgs1();
    goto label$22_end_179;
label$23_end_180:
    call push(loc13);
    call push(loc12);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(4.0);
    call loc11 := popArgs1();
    call push(3.0);
    call loc5 := popArgs1();
    call push(2.0);
    call loc7 := popArgs1();
    call push(128.0);
    call loc8 := popArgs1();
    call push(1.0);
    call loc6 := popArgs1();
    call push(63.0);
    call loc10 := popArgs1();
label$22_end_179:
    call push(loc13);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc10);
    call push(loc12);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(128.0);
    call loc8 := popArgs1();
    call push(63.0);
    call loc6 := popArgs1();
label$20_end_177:
    call push(loc13);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call push(loc12);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc13);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc12);
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
label$18_end_175:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(0.0);
    call loc12 := popArgs1();
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
label$25_start_182:
    call push(loc12);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_181;
    }
    call push(loc12);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_181;
    }
    call push(loc7);
    call loc12 := popArgs1();
    call push(loc5);
    call push(loc13);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc11);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$25_start_182;
    }
    goto label$3_end_159;
label$24_end_181:
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$26_end_184;
    }
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc13);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc13);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc12);
    call push(loc13);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_159;
    }
label$26_end_184:
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$27_end_185;
    }
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(912.0);
    call push(0.0);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_159;
    }
label$27_end_185:
    call push(loc5);
    call push(arg2);
    call push(arg3);
    call push(loc6);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_159;
    }
    call push(0.0);
    call arg1 := popArgs1();
label$28_start_186:
    call push(arg1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_158;
    }
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc12 := popArgs1();
    call push(loc12);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_158;
    }
    call push(loc12);
    call arg1 := popArgs1();
    call push(loc5);
    call push(loc13);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc11);
    call push(loc7);
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$28_start_186;
    }
label$3_end_159:
    call push(1.0);
    call loc12 := popArgs1();
    goto label$1_end_157;
label$2_end_158:
    call push(0.0);
    call loc12 := popArgs1();
label$1_end_157:
    call push(0.0);
    call push(loc13);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc12);
}

procedure {:inline 1} _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_203;
    }
    call push(loc8);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_202;
    }
    goto label$6_end_193;
label$16_end_203:
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_201;
    }
label$15_end_202:
    call push(arg1);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc10);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc10);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_200;
    }
    call push(loc10);
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
    call push(loc10);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1114112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_194;
    }
    call push(loc8);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call loc8 := popArgs1();
label$17_start_204:
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_199;
    }
    call push(loc10);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1114112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_start_204;
    }
    goto label$7_end_194;
label$14_end_201:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call loc8 := popArgs1();
    goto label$2_end_189;
label$13_end_200:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_195;
    }
    call push(loc10);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_196;
    }
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_198;
    }
    call push(0.0);
    call loc1 := popArgs1();
    call push(loc3);
    call loc4 := popArgs1();
    goto label$10_end_197;
label$12_end_199:
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_end_206;
    }
    call push(loc8);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_end_206;
    }
    call push(loc8);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_188;
    }
    call push(arg2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call push(-65.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_188;
    }
    call push(loc8);
    call arg3 := popArgs1();
    call push(loc9);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_193;
    }
    goto label$5_end_192;
label$18_end_206:
    call push(loc8);
    call arg3 := popArgs1();
    call push(loc9);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_193;
    }
    goto label$5_end_192;
label$11_end_198:
    call push(loc10);
    call push(arg2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc8);
    call loc4 := popArgs1();
label$10_end_197:
    call push(loc7);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_196;
    }
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_end_208;
    }
    call push(loc10);
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call loc4 := popArgs1();
    goto label$19_end_207;
label$20_end_208:
    call push(0.0);
    call loc2 := popArgs1();
    call push(loc3);
    call loc4 := popArgs1();
label$19_end_207:
    call push(loc7);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_196;
    }
    call push(loc7);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc1);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_end_210;
    }
    call push(loc10);
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    goto label$21_end_209;
label$22_end_210:
    call push(0.0);
    call loc3 := popArgs1();
label$21_end_209:
    call push(loc1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc7);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(1835008.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc3);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(1114112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_194;
    }
label$9_end_196:
    call push(loc10);
    call push(loc8);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$8_end_195:
    call push(0.0);
    call arg3 := popArgs1();
label$7_end_194:
    call push(loc9);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_192;
    }
label$6_end_193:
    call push(arg1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_191;
    }
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(0.0);
    call loc9 := popArgs1();
    call push(arg2);
    call loc8 := popArgs1();
label$23_start_211:
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$23_start_211;
    }
    goto label$3_end_190;
label$5_end_192:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call loc8 := popArgs1();
    goto label$2_end_189;
label$4_end_191:
    call push(0.0);
    call loc9 := popArgs1();
label$3_end_190:
    call push(arg3);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$27_end_216;
    }
    call push(0.0);
    call loc9 := popArgs1();
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$28_end_217;
    }
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(0.0);
    call loc9 := popArgs1();
    call push(arg2);
    call loc8 := popArgs1();
label$29_start_218:
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc3);
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$29_start_218;
    }
label$28_end_217:
    call push(loc9);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(0.0);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call push(loc8);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$26_end_215;
    }
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$25_end_214;
    }
    call push(loc1);
    call loc4 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$24_end_213;
label$27_end_216:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(arg3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call loc8 := popArgs1();
    goto label$2_end_189;
label$26_end_215:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc1 := popArgs1();
    goto label$24_end_213;
label$25_end_214:
    call push(0.0);
    call loc4 := popArgs1();
label$24_end_213:
    call push(0.0);
    call loc9 := popArgs1();
    call push(loc10);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$31_end_221;
    }
    call push(loc10);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(1.0);
    call loc7 := popArgs1();
    goto label$30_end_220;
label$31_end_221:
    call push(loc8);
    call push(2048.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$33_end_223;
    }
    call push(2.0);
    call loc7 := popArgs1();
    call push(1.0);
    call loc6 := popArgs1();
    call push(192.0);
    call loc3 := popArgs1();
    call push(31.0);
    call loc2 := popArgs1();
    goto label$32_end_222;
label$33_end_223:
    call push(loc8);
    call push(65536.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$35_end_225;
    }
    call push(3.0);
    call loc7 := popArgs1();
    call push(2.0);
    call loc6 := popArgs1();
    call push(1.0);
    call loc9 := popArgs1();
    call push(224.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(15.0);
    call loc5 := popArgs1();
    goto label$34_end_224;
label$35_end_225:
    call push(loc10);
    call push(loc8);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(4.0);
    call loc7 := popArgs1();
    call push(3.0);
    call loc6 := popArgs1();
    call push(2.0);
    call loc9 := popArgs1();
    call push(128.0);
    call loc3 := popArgs1();
    call push(1.0);
    call loc2 := popArgs1();
    call push(63.0);
    call loc5 := popArgs1();
label$34_end_224:
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc5);
    call push(loc8);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(128.0);
    call loc3 := popArgs1();
    call push(63.0);
    call loc2 := popArgs1();
label$32_end_222:
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
label$30_end_220:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(0.0);
    call loc8 := popArgs1();
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
label$39_start_229:
    call push(loc8);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$38_end_228;
    }
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$38_end_228;
    }
    call push(loc9);
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$39_start_229;
    }
    goto label$37_end_227;
label$38_end_228:
    call push(loc3);
    call push(arg2);
    call push(arg3);
    call push(loc2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call popDiscard4();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$37_end_227;
    }
    call push(0.0);
    call loc8 := popArgs1();
label$40_start_231:
    call push(loc8);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$36_end_226;
    }
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$36_end_226;
    }
    call push(loc9);
    call loc8 := popArgs1();
    call push(loc3);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
    call push(arg1);
    call popDiscard4();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$40_start_231;
    }
label$37_end_227:
    call push(1.0);
    call loc8 := popArgs1();
    goto label$2_end_189;
label$36_end_226:
    call push(0.0);
    call loc8 := popArgs1();
label$2_end_189:
    call push(0.0);
    call push(loc10);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc8);
    goto func_exit_233;
label$1_end_188:
    call push(arg2);
    call push(arg3);
    call push(0.0);
    call push(loc8);
    call _ZN4core3str16slice_error_fail17h0272e9dec3021bceE();
    assume (false);
func_exit_233:
}

procedure {:inline 1} _ZN41__LT_char_u20_as_u20_core__fmt__Debug_GT_3fmt17h1d76b7570b573baeE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN41__LT_char_u20_as_u20_core__fmt__Debug_GT_3fmt17h1d76b7570b573baeE()
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
    call push(1.0);
    call loc5 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(39.0);
    call push(arg2);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_234;
    }
    call push(2.0);
    call loc5 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call push(-9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(30.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_243;
    }
    call push(116.0);
    call loc4 := popArgs1();
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (31))) {
        goto label$2_end_235;
    } else {
        if ((idx) == (0)) {
            goto label$2_end_235;
        }
        if ((idx) == (1)) {
            goto label$11_end_244;
        }
        if ((idx) == (2)) {
            goto label$9_end_242;
        }
        if ((idx) == (3)) {
            goto label$9_end_242;
        }
        if ((idx) == (4)) {
            goto label$8_end_241;
        }
        if ((idx) == (5)) {
            goto label$9_end_242;
        }
        if ((idx) == (6)) {
            goto label$9_end_242;
        }
        if ((idx) == (7)) {
            goto label$9_end_242;
        }
        if ((idx) == (8)) {
            goto label$9_end_242;
        }
        if ((idx) == (9)) {
            goto label$9_end_242;
        }
        if ((idx) == (10)) {
            goto label$9_end_242;
        }
        if ((idx) == (11)) {
            goto label$9_end_242;
        }
        if ((idx) == (12)) {
            goto label$9_end_242;
        }
        if ((idx) == (13)) {
            goto label$9_end_242;
        }
        if ((idx) == (14)) {
            goto label$9_end_242;
        }
        if ((idx) == (15)) {
            goto label$9_end_242;
        }
        if ((idx) == (16)) {
            goto label$9_end_242;
        }
        if ((idx) == (17)) {
            goto label$9_end_242;
        }
        if ((idx) == (18)) {
            goto label$9_end_242;
        }
        if ((idx) == (19)) {
            goto label$9_end_242;
        }
        if ((idx) == (20)) {
            goto label$9_end_242;
        }
        if ((idx) == (21)) {
            goto label$9_end_242;
        }
        if ((idx) == (22)) {
            goto label$9_end_242;
        }
        if ((idx) == (23)) {
            goto label$9_end_242;
        }
        if ((idx) == (24)) {
            goto label$9_end_242;
        }
        if ((idx) == (25)) {
            goto label$5_end_238;
        }
        if ((idx) == (26)) {
            goto label$9_end_242;
        }
        if ((idx) == (27)) {
            goto label$9_end_242;
        }
        if ((idx) == (28)) {
            goto label$9_end_242;
        }
        if ((idx) == (29)) {
            goto label$9_end_242;
        }
        if ((idx) == (30)) {
            goto label$5_end_238;
        }
        goto label$2_end_235;
    }
label$11_end_244:
    call push(110.0);
    call loc4 := popArgs1();
    goto label$2_end_235;
label$10_end_243:
    call push(arg2);
    call push(92.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_238;
    }
label$9_end_242:
    call push(arg2);
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_240;
    }
    call push(arg2);
    call push(2512.0);
    call push(41.0);
    call push(2608.0);
    call push(304.0);
    call push(2912.0);
    call push(326.0);
    call _ZN4core12char_private5check17h25b77805391c8205E();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_239;
    }
    goto label$4_end_237;
label$8_end_241:
    call push(114.0);
    call loc4 := popArgs1();
    goto label$2_end_235;
label$7_end_240:
    call push(arg2);
    call push(131072.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_245;
    }
    call push(arg2);
    call push(3248.0);
    call push(33.0);
    call push(3328.0);
    call push(150.0);
    call push(3488.0);
    call push(360.0);
    call _ZN4core12char_private5check17h25b77805391c8205E();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_239;
    }
    goto label$4_end_237;
label$12_end_245:
    call push(arg2);
    call push(-918000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(196112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_237;
    }
    call push(arg2);
    call push(-195102.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(722657.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(arg2);
    call push(-191457.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3102.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(arg2);
    call push(-183970.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(13.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(arg2);
    call push(2097150.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(178206.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(arg2);
    call push(-173783.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(arg2);
    call push(-177973.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_237;
    }
label$6_end_239:
    call push(1.0);
    call loc5 := popArgs1();
label$5_end_238:
    goto label$3_end_236;
label$4_end_237:
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp1();
    call push(int_clz($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc8 := popArgs1();
    call push(3.0);
    call loc5 := popArgs1();
label$3_end_236:
    call push(arg2);
    call loc4 := popArgs1();
label$2_end_235:
    call push(loc8);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    // // wrap: no-op under real semantics
    call arg2 := popArgs1();
    call push(loc8);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
label$15_start_248:
    call push(arg2);
    call arg1 := popArgs1();
    call push(loc5);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_255;
    }
    call push(arg2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_end_254;
    }
    call push(arg2);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_246;
    }
    call push(4.0);
    call arg2 := popArgs1();
    call push(arg1);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_246;
    }
    call push(92.0);
    call loc7 := popArgs1();
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (5))) {
        goto label$22_end_256;
    } else {
        if ((idx) == (0)) {
            goto label$22_end_256;
        }
        if ((idx) == (1)) {
            goto label$18_end_252;
        }
        if ((idx) == (2)) {
            goto label$17_end_251;
        }
        if ((idx) == (3)) {
            goto label$16_end_250;
        }
        if ((idx) == (4)) {
            goto label$19_end_253;
        }
        goto label$22_end_256;
    }
label$22_end_256:
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc1);
    call push(125.0);
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
    goto label$14_end_247;
label$21_end_255:
    call push(0.0);
    call loc5 := popArgs1();
    call push(arg1);
    call arg2 := popArgs1();
    call push(loc1);
    call push(loc4);
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
    goto label$14_end_247;
label$20_end_254:
    call push(92.0);
    call loc7 := popArgs1();
    call push(1.0);
    call loc5 := popArgs1();
    call push(arg1);
    call arg2 := popArgs1();
label$19_end_253:
    call push(loc1);
    call push(loc7);
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
    goto label$14_end_247;
label$18_end_252:
    call push(arg1);
    call push(1.0);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call arg2 := popArgs1();
    call push(loc6);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call arg1 := popArgs1();
    call push(loc6);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc6 := popArgs1();
    call push(loc1);
    call push(48.0);
    call push(87.0);
    call push(loc4);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(10.0);
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
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
    goto label$14_end_247;
label$17_end_251:
    call push(2.0);
    call arg2 := popArgs1();
    call push(loc1);
    call push(123.0);
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
    goto label$14_end_247;
label$16_end_250:
    call push(3.0);
    call arg2 := popArgs1();
    call push(loc1);
    call push(117.0);
    call push(loc2);
    call popDiscard3();
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_248;
    }
label$14_end_247:
    call push(1.0);
    goto func_exit_257;
label$13_end_246:
    call push(loc1);
    call push(39.0);
    call push(loc2);
    call popDiscard3();
    call loc5 := popArgs1();
label$1_end_234:
    call push(loc5);
func_exit_257:
}

procedure {:inline 1} _ZN53__LT_core__fmt__Error_u20_as_u20_core__fmt__Debug_GT_3fmt17h7f588df9817810faE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN53__LT_core__fmt__Error_u20_as_u20_core__fmt__Debug_GT_3fmt17h7f588df9817810faE()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1088.0);
    call push(5.0);
    call push(arg2);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
}

procedure {:inline 1} _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h6d0c5b884d1c1f3aE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h6d0c5b884d1c1f3aE()
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
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
}

procedure {:inline 1} _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE()
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
    call push(1114112.0);
    call loc8 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_258;
    }
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_258;
    }
    call push(0.0);
    call loc7 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_260;
    }
    call push(loc8);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    goto label$2_end_259;
label$3_end_260:
    call push(loc6);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_262;
    }
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc6);
    call loc4 := popArgs1();
    goto label$4_end_261;
label$5_end_262:
    call push(loc1);
    call loc4 := popArgs1();
label$4_end_261:
    call push(loc8);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc7);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc8);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_265;
    }
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_264;
    }
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc6);
    call loc4 := popArgs1();
    goto label$6_end_263;
label$8_end_265:
    call push(loc7);
    call push(loc3);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc7 := popArgs1();
    goto label$2_end_259;
label$7_end_264:
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
label$6_end_263:
    call push(loc5);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc7);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc8);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_268;
    }
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_267;
    }
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc4 := popArgs1();
    goto label$9_end_266;
label$11_end_268:
    call push(loc7);
    call push(loc3);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc7 := popArgs1();
    goto label$2_end_259;
label$10_end_267:
    call push(0.0);
    call loc4 := popArgs1();
label$9_end_266:
    call push(1114112.0);
    call loc8 := popArgs1();
    call push(loc7);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc3);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(1835008.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc4);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(1114112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_258;
    }
label$2_end_259:
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc8);
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call loc8 := popArgs1();
label$1_end_258:
    call push(arg1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
}

procedure {:inline 1} _ZN4core3str16slice_error_fail17h0272e9dec3021bceE();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core3str16slice_error_fail17h0272e9dec3021bceE()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
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
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    call loc4 := popArgs1();
    call push(arg2);
    call loc3 := popArgs1();
    call push(arg2);
    call push(257.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_269;
    }
    call push(0.0);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(256.0);
    call loc5 := popArgs1();
label$3_start_271:
    call push(loc5);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_273;
    }
    call push(arg1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call push(-65.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_270;
    }
label$4_end_273:
    call push(loc5);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(1.0);
    call loc4 := popArgs1();
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_269;
    }
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc3);
    call loc5 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_271;
    }
    goto label$1_end_269;
label$2_end_270:
    call push(1.0);
    call loc4 := popArgs1();
    call push(loc5);
    call loc3 := popArgs1();
label$1_end_269:
    call push(loc6);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(5.0);
    call push(0.0);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1104.0);
    call push(1120.0);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_277;
    }
    call push(arg4);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_277;
    }
    call push(arg3);
    call push(arg4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_276;
    }
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_279;
    }
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_279;
    }
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_278;
    }
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call push(-64.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_278;
    }
label$10_end_279:
    call push(arg4);
    call arg3 := popArgs1();
label$9_end_278:
    call push(loc6);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_275;
    }
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_275;
    }
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$12_start_281:
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_283;
    }
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call push(-65.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_280;
    }
label$13_end_283:
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_284;
    }
    call push(loc2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call loc3 := popArgs1();
    call push(loc5);
    call arg3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_start_281;
    }
label$14_end_284:
    call push(arg1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    goto label$5_end_274;
label$11_end_280:
    call push(arg3);
    call loc5 := popArgs1();
    goto label$5_end_274;
label$8_end_277:
    call push(loc6);
    call push(arg3);
    call push(arg4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (76);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1144.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1120.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1252.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
label$7_end_276:
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (76);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1268.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1300.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1444.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
label$6_end_275:
    call push(arg1);
    call push(arg3);
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$5_end_274:
    call push(loc3);
    call push(arg1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg2);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_285;
    }
    call push(0.0);
    call loc4 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_287;
    }
    call push(arg2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg3 := popArgs1();
    goto label$16_end_286;
label$17_end_287:
    call push(arg3);
    call loc1 := popArgs1();
    call push(loc3);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_end_288;
    }
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc4 := popArgs1();
label$18_end_288:
    call push(arg2);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc4);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_end_290;
    }
    call push(0.0);
    call arg1 := popArgs1();
    call push(arg3);
    call loc4 := popArgs1();
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_291;
    }
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg1 := popArgs1();
label$21_end_291:
    call push(arg1);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_289;
    }
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc4);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_end_292;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(63.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg2 := popArgs1();
label$22_end_292:
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc3);
    call push(18.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(1835008.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(1114112.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_286;
    }
    goto label$15_end_285;
label$20_end_290:
    call push(loc2);
    call push(loc3);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call arg3 := popArgs1();
    goto label$16_end_286;
label$19_end_289:
    call push(loc2);
    call push(loc3);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call arg3 := popArgs1();
label$16_end_286:
    call push(loc6);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(1.0);
    call loc3 := popArgs1();
    call push(arg3);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$23_end_293;
    }
    call push(2.0);
    call loc3 := popArgs1();
    call push(arg3);
    call push(2048.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$23_end_293;
    }
    call push(3.0);
    call push(4.0);
    call push(arg3);
    call push(65536.0);
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
    call loc3 := popArgs1();
label$23_end_293:
    call push(loc6);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc3);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(9.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(10.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (76);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(108.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1484.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(5.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(1524.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(5.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc6);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(5.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1704.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
label$15_end_285:
    call push(1460.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
}

procedure {:inline 1} _ZN71__LT_core__ops__range__Range_LT_Idx_GT__u20_as_u20_core__fmt__Debug_GT_3fmt17h4ea32a9382c97361E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN71__LT_core__ops__range__Range_LT_Idx_GT__u20_as_u20_core__fmt__Debug_GT_3fmt17h4ea32a9382c97361E()
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
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(11.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(11.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2036.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2240.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg1);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN4core3fmt5write17h0d61204d0975bad3E();
    call arg2 := popArgs1();
    call push(0.0);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
}

procedure {:inline 1} _ZN4core9panicking5panic17h388b19995485ab52E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core9panicking5panic17h388b19995485ab52E()
{
    var arg1: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
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
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(1.0);
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
    call push(2064.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
}

procedure {:inline 1} _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc6);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg1);
    call push(16.0);
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
    call push(loc6);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg1);
    call push(8.0);
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
    call push(loc6);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call push(loc2);
    call push(loc1);
    call rust_begin_unwind();
    assume (false);
}

procedure {:inline 1} _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E()
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
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2240.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2064.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
}

procedure {:inline 1} _ZN4core6option13expect_failed17h6057b6d59655e712E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core6option13expect_failed17h6057b6d59655e712E()
{
    var loc1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(0.0);
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(17.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(656.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(7.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2140.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2132.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2176.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
}

procedure {:inline 1} _ZN4core5slice20slice_index_len_fail17hd29a24ba3407d757E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core5slice20slice_index_len_fail17hd29a24ba3407d757E()
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
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2240.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2224.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2312.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
}

procedure {:inline 1} _ZN4core5slice22slice_index_order_fail17h0c35223839c942e1E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core5slice22slice_index_order_fail17h0c35223839c942e1E()
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
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2240.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2420.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2436.0);
    call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    assume (false);
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

procedure {:inline 1} _ZN4core12char_private5check17h25b77805391c8205E();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation _ZN4core12char_private5check17h25b77805391c8205E()
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
    var loc4: real;
    var loc5: real;
    var loc6: real;
    var loc7: real;
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
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    loc7 := 0.0;
    call push(1.0);
    call loc7 := popArgs1();
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_299;
    }
    call push(arg2);
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(arg1);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
label$7_start_300:
    call push(arg2);
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_303;
    }
    call push(loc4);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_295;
    }
    call push(loc4);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_294;
    }
    call push(arg4);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
label$10_start_304:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_302;
    }
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_304;
    }
    goto label$5_end_298;
label$9_end_303:
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_299;
    }
    call push(loc4);
    call loc6 := popArgs1();
    call push(loc3);
    call arg2 := popArgs1();
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_300;
    }
    goto label$6_end_299;
label$8_end_302:
    call push(loc4);
    call loc6 := popArgs1();
    call push(loc3);
    call arg2 := popArgs1();
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_300;
    }
label$6_end_299:
    call push(arg7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_297;
    }
    call push(arg6);
    call push(arg7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg1);
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(arg6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
label$11_start_306:
    call push(arg6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_309;
    }
    call push(arg3);
    call arg6 := popArgs1();
    goto label$12_end_308;
label$13_end_309:
    call push(arg3);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_296;
    }
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg6 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call arg2 := popArgs1();
label$12_end_308:
    call push(loc6);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_297;
    }
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(arg6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_297;
    }
    call push(arg6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    goto label$11_start_306;
label$5_end_298:
    call push(0.0);
    call loc7 := popArgs1();
label$4_end_297:
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    goto func_exit_310;
label$3_end_296:
    call push(3848.0);
    call _ZN4core9panicking5panic17h388b19995485ab52E();
    assume (false);
label$2_end_295:
    call push(loc6);
    call push(loc4);
    call _ZN4core5slice22slice_index_order_fail17h0c35223839c942e1E();
    assume (false);
label$1_end_294:
    call push(loc4);
    call push(arg5);
    call _ZN4core5slice20slice_index_len_fail17hd29a24ba3407d757E();
    assume (false);
func_exit_310:
}

procedure {:inline 1} __wasm_nullptr();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation __wasm_nullptr()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (false);
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

procedure {:inline 1} CorralChoice__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation CorralChoice__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (45)));
    if ((c) == (0)) {
        call test_print_args();
    } else if ((c) == (1)) {
        call test_return_args();
    } else if ((c) == (2)) {
        call test_set_storage();
    } else if ((c) == (3)) {
        call test_get_storage();
    } else if ((c) == (4)) {
        call test_counter();
    } else if ((c) == (5)) {
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
        call rust_begin_unwind();
    } else if ((c) == (6)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h2ceb0c6a1460bad2E();
        call popDiscard1();
    } else if ((c) == (7)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
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
        call _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E();
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
    } else if ((c) == (10)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call memcpy();
        call popDiscard1();
    } else if ((c) == (11)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call memmove();
        call popDiscard1();
    } else if ((c) == (12)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call memset();
        call popDiscard1();
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
        call memcmp();
        call popDiscard1();
    } else if ((c) == (14)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3ptr13drop_in_place17h8866dde8cca892acE();
    } else if ((c) == (15)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN5alloc3fmt6format17hef57d46af5b16199E();
    } else if ((c) == (16)) {
        call _ZN4core6result13unwrap_failed17h575cbe6ecb5ed4e7E();
    } else if ((c) == (17)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h92dbaa5dd091f910E();
        call popDiscard1();
    } else if ((c) == (18)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_10write_char17h9757dc18459768ddE();
        call popDiscard1();
    } else if ((c) == (19)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_fmt17h73b6f874c56447a3E();
        call popDiscard1();
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
        call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_str17h2be41beb78a77972E();
        call popDiscard1();
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
        call _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE();
    } else if ((c) == (22)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN49__LT_alloc__raw_vec__RawVec_LT_T_C__u20_A_GT__GT_6double17hf5c514db857b9fbfE();
    } else if ((c) == (23)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Debug_u20_for_u20_usize_GT_3fmt17headb3a1168984a69E();
        call popDiscard1();
    } else if ((c) == (24)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3fmt3num54__LT_impl_u20_core__fmt__Display_u20_for_u20_usize_GT_3fmt17hf3fa95afcb7e8063E();
        call popDiscard1();
    } else if ((c) == (25)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Display_u20_for_u20_u32_GT_3fmt17he0e855804ed9a1faE();
        call popDiscard1();
    } else if ((c) == (26)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3fmt10ArgumentV110show_usize17hbb4fe5a23913dc33E();
        call popDiscard1();
    } else if ((c) == (27)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core3fmt5write17h0d61204d0975bad3E();
        call popDiscard1();
    } else if ((c) == (28)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN73__LT_core__fmt__Arguments_LT__u27_a_GT__u20_as_u20_core__fmt__Display_GT_3fmt17h10aa4a4d757dd8d6E();
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
        call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
        call popDiscard1();
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
        call _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
        call popDiscard1();
    } else if ((c) == (31)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN41__LT_char_u20_as_u20_core__fmt__Debug_GT_3fmt17h1d76b7570b573baeE();
        call popDiscard1();
    } else if ((c) == (32)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN53__LT_core__fmt__Error_u20_as_u20_core__fmt__Debug_GT_3fmt17h7f588df9817810faE();
        call popDiscard1();
    } else if ((c) == (33)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h6d0c5b884d1c1f3aE();
        call popDiscard1();
    } else if ((c) == (34)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE();
    } else if ((c) == (35)) {
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
        call _ZN4core3str16slice_error_fail17h0272e9dec3021bceE();
    } else if ((c) == (36)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN71__LT_core__ops__range__Range_LT_Idx_GT__u20_as_u20_core__fmt__Debug_GT_3fmt17h4ea32a9382c97361E();
        call popDiscard1();
    } else if ((c) == (37)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core9panicking5panic17h388b19995485ab52E();
    } else if ((c) == (38)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
    } else if ((c) == (39)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
    } else if ((c) == (40)) {
        call _ZN4core6option13expect_failed17h6057b6d59655e712E();
    } else if ((c) == (41)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core5slice20slice_index_len_fail17hd29a24ba3407d757E();
    } else if ((c) == (42)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call _ZN4core5slice22slice_index_order_fail17h0c35223839c942e1E();
    } else if ((c) == (43)) {
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
        call _ZN4core12char_private5check17h25b77805391c8205E();
        call popDiscard1();
    } else if ((c) == (44)) {
        call __wasm_nullptr();
    }
}

procedure BoogieEntry__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation BoogieEntry__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (45)));
        if ((c) == (0)) {
            call test_print_args();
        } else if ((c) == (1)) {
            call test_return_args();
        } else if ((c) == (2)) {
            call test_set_storage();
        } else if ((c) == (3)) {
            call test_get_storage();
        } else if ((c) == (4)) {
            call test_counter();
        } else if ((c) == (5)) {
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
            call rust_begin_unwind();
        } else if ((c) == (6)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h2ceb0c6a1460bad2E();
            call popDiscard1();
        } else if ((c) == (7)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN11exowasm_std3ext4args17ha7bd8c1495d145c5E();
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
            call _ZN11exowasm_std3ext11get_storage17h53a82f61f62820f8E();
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN78__LT__RF__u27_a_u20_wee_alloc__WeeAlloc_u20_as_u20_alloc__allocator__Alloc_GT_5alloc17h458ec6e53d321740E();
        } else if ((c) == (10)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call memcpy();
            call popDiscard1();
        } else if ((c) == (11)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call memmove();
            call popDiscard1();
        } else if ((c) == (12)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call memset();
            call popDiscard1();
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
            call memcmp();
            call popDiscard1();
        } else if ((c) == (14)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3ptr13drop_in_place17h8866dde8cca892acE();
        } else if ((c) == (15)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN5alloc3fmt6format17hef57d46af5b16199E();
        } else if ((c) == (16)) {
            call _ZN4core6result13unwrap_failed17h575cbe6ecb5ed4e7E();
        } else if ((c) == (17)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h92dbaa5dd091f910E();
            call popDiscard1();
        } else if ((c) == (18)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_10write_char17h9757dc18459768ddE();
            call popDiscard1();
        } else if ((c) == (19)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_fmt17h73b6f874c56447a3E();
            call popDiscard1();
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
            call _ZN96__LT_core__fmt__Write__write_fmt__Adapter_LT__u27_a_C__u20_T_GT__u20_as_u20_core__fmt__Write_GT_9write_str17h2be41beb78a77972E();
            call popDiscard1();
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
            call _ZN33__LT_alloc__vec__Vec_LT_T_GT__GT_17extend_from_slice17h02027876d1c4e26bE();
        } else if ((c) == (22)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN49__LT_alloc__raw_vec__RawVec_LT_T_C__u20_A_GT__GT_6double17hf5c514db857b9fbfE();
        } else if ((c) == (23)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Debug_u20_for_u20_usize_GT_3fmt17headb3a1168984a69E();
            call popDiscard1();
        } else if ((c) == (24)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3fmt3num54__LT_impl_u20_core__fmt__Display_u20_for_u20_usize_GT_3fmt17hf3fa95afcb7e8063E();
            call popDiscard1();
        } else if ((c) == (25)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3fmt3num52__LT_impl_u20_core__fmt__Display_u20_for_u20_u32_GT_3fmt17he0e855804ed9a1faE();
            call popDiscard1();
        } else if ((c) == (26)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3fmt10ArgumentV110show_usize17hbb4fe5a23913dc33E();
            call popDiscard1();
        } else if ((c) == (27)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core3fmt5write17h0d61204d0975bad3E();
            call popDiscard1();
        } else if ((c) == (28)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN73__LT_core__fmt__Arguments_LT__u27_a_GT__u20_as_u20_core__fmt__Display_GT_3fmt17h10aa4a4d757dd8d6E();
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
            call _ZN4core3fmt9Formatter12pad_integral17h0448a12f34b5832aE();
            call popDiscard1();
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
            call _ZN4core3fmt9Formatter3pad17h9aa423b13caa25baE();
            call popDiscard1();
        } else if ((c) == (31)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN41__LT_char_u20_as_u20_core__fmt__Debug_GT_3fmt17h1d76b7570b573baeE();
            call popDiscard1();
        } else if ((c) == (32)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN53__LT_core__fmt__Error_u20_as_u20_core__fmt__Debug_GT_3fmt17h7f588df9817810faE();
            call popDiscard1();
        } else if ((c) == (33)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN55__LT__RF__u27_a_u20_T_u20_as_u20_core__fmt__Display_GT_3fmt17h6d0c5b884d1c1f3aE();
            call popDiscard1();
        } else if ((c) == (34)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN75__LT__RF__u27_a_u20_mut_u20_I_u20_as_u20_core__iter__iterator__Iterator_GT_4next17hbdf1d6a8669245deE();
        } else if ((c) == (35)) {
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
            call _ZN4core3str16slice_error_fail17h0272e9dec3021bceE();
        } else if ((c) == (36)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN71__LT_core__ops__range__Range_LT_Idx_GT__u20_as_u20_core__fmt__Debug_GT_3fmt17h4ea32a9382c97361E();
            call popDiscard1();
        } else if ((c) == (37)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core9panicking5panic17h388b19995485ab52E();
        } else if ((c) == (38)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E();
        } else if ((c) == (39)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core9panicking18panic_bounds_check17h5d8a2ea3d49d6e43E();
        } else if ((c) == (40)) {
            call _ZN4core6option13expect_failed17h6057b6d59655e712E();
        } else if ((c) == (41)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core5slice20slice_index_len_fail17hd29a24ba3407d757E();
        } else if ((c) == (42)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call _ZN4core5slice22slice_index_order_fail17h0c35223839c942e1E();
        } else if ((c) == (43)) {
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
            call _ZN4core12char_private5check17h25b77805391c8205E();
            call popDiscard1();
        } else if ((c) == (44)) {
            call __wasm_nullptr();
        }
    }
}

procedure CorralEntry__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation CorralEntry__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__090cfcb09e787bb38f93dace7f4586fd6bb7093ca409e2e1b7695c985d7bf43b();
    }
}

