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
const global_1: real;

axiom((global_1) == (17802.0));
const global_2: real;

axiom((global_2) == (17802.0));
procedure {:inline 1} initGlobals();
modifies $mem_pages;
modifies global_0;
ensures(($mem_pages) == (0));
ensures((global_0) == (8192.0));
implementation initGlobals()
{
    $mem_pages := 0;
    global_0 := 8192.0;
}

procedure {:inline 1} eosio_assert();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation eosio_assert()
{
}

procedure {:inline 1} eosio_exit();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation eosio_exit()
{
}

procedure {:inline 1} action_data_size();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation action_data_size()
{
}

procedure {:inline 1} read_action_data();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation read_action_data()
{
}

procedure {:inline 1} db_find_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_find_i64()
{
}

procedure {:inline 1} memcpy();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation memcpy()
{
}

procedure {:inline 1} current_time();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation current_time()
{
}

procedure {:inline 1} send_deferred();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation send_deferred()
{
}

procedure {:inline 1} current_receiver();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation current_receiver()
{
}

procedure {:inline 1} db_update_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_update_i64()
{
}

procedure {:inline 1} db_store_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_store_i64()
{
}

procedure {:inline 1} require_auth2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation require_auth2()
{
}

procedure {:inline 1} printui();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation printui()
{
}

procedure {:inline 1} db_next_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_next_i64()
{
}

procedure {:inline 1} require_auth();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation require_auth()
{
}

procedure {:inline 1} db_get_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_get_i64()
{
}

procedure {:inline 1} db_remove_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_remove_i64()
{
}

procedure {:inline 1} abort();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation abort()
{
}

procedure {:inline 1} memset();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation memset()
{
}

procedure {:inline 1} memmove();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation memmove()
{
}

procedure {:inline 1} __unordtf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __unordtf2()
{
}

procedure {:inline 1} __eqtf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __eqtf2()
{
}

procedure {:inline 1} __multf3();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __multf3()
{
}

procedure {:inline 1} __addtf3();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __addtf3()
{
}

procedure {:inline 1} __subtf3();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __subtf3()
{
}

procedure {:inline 1} __netf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __netf2()
{
}

procedure {:inline 1} __fixunstfsi();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __fixunstfsi()
{
}

procedure {:inline 1} __floatunsitf();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __floatunsitf()
{
}

procedure {:inline 1} __fixtfsi();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __fixtfsi()
{
}

procedure {:inline 1} __floatsitf();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __floatsitf()
{
}

procedure {:inline 1} __extenddftf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __extenddftf2()
{
}

procedure {:inline 1} __extendsftf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __extendsftf2()
{
}

procedure {:inline 1} __divtf3();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __divtf3()
{
}

procedure {:inline 1} __letf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __letf2()
{
}

procedure {:inline 1} __trunctfdf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __trunctfdf2()
{
}

procedure {:inline 1} __getf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __getf2()
{
}

procedure {:inline 1} __trunctfsf2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation __trunctfsf2()
{
}

procedure {:inline 1} set_blockchain_parameters_packed();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation set_blockchain_parameters_packed()
{
}

procedure {:inline 1} get_blockchain_parameters_packed();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation get_blockchain_parameters_packed()
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
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

procedure {:inline 1} fimport_1();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_1()
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

procedure {:inline 1} fimport_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_2()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} fimport_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_3()
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

procedure {:inline 1} fimport_4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_4()
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

procedure {:inline 1} fimport_5();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_5()
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
}

procedure {:inline 1} fimport_6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_6()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} popArgs5() returns (a1: real, a2: real, a3: real, a4: real, a5: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (5));
ensures(($sp) == ((old($sp)) - (5)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (5)]));
ensures((a2) == (old($stack)[(old($sp)) - (4)]));
ensures((a3) == (old($stack)[(old($sp)) - (3)]));
ensures((a4) == (old($stack)[(old($sp)) - (2)]));
ensures((a5) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs5() returns (a1: real, a2: real, a3: real, a4: real, a5: real)
{
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

procedure {:inline 1} fimport_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_7()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
}

procedure {:inline 1} fimport_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_8()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} fimport_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_9()
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

procedure {:inline 1} popArgs6() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (6));
ensures(($sp) == ((old($sp)) - (6)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (6)]));
ensures((a2) == (old($stack)[(old($sp)) - (5)]));
ensures((a3) == (old($stack)[(old($sp)) - (4)]));
ensures((a4) == (old($stack)[(old($sp)) - (3)]));
ensures((a5) == (old($stack)[(old($sp)) - (2)]));
ensures((a6) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs6() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real)
{
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

procedure {:inline 1} fimport_10();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_10()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var arg6: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (6));
    call arg1, arg2, arg3, arg4, arg5, arg6 := popArgs6();
}

procedure {:inline 1} fimport_11();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_11()
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
}

procedure {:inline 1} fimport_12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_12()
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

procedure {:inline 1} fimport_13();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_13()
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
}

procedure {:inline 1} fimport_14();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_14()
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

procedure {:inline 1} fimport_15();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_15()
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
}

procedure {:inline 1} fimport_16();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_16()
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

procedure {:inline 1} fimport_17();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_17()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} fimport_18();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_18()
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
}

procedure {:inline 1} fimport_19();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_19()
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
}

procedure {:inline 1} fimport_20();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_20()
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

procedure {:inline 1} fimport_21();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_21()
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

procedure {:inline 1} fimport_22();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_22()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
}

procedure {:inline 1} fimport_23();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_23()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
}

procedure {:inline 1} fimport_24();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_24()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
}

procedure {:inline 1} fimport_25();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_25()
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

procedure {:inline 1} fimport_26();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_26()
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
}

procedure {:inline 1} fimport_27();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_27()
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
}

procedure {:inline 1} fimport_28();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_28()
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
}

procedure {:inline 1} fimport_29();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_29()
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
}

procedure {:inline 1} fimport_30();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_30()
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
}

procedure {:inline 1} fimport_31();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_31()
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
}

procedure {:inline 1} fimport_32();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_32()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
}

procedure {:inline 1} fimport_33();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_33()
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

procedure {:inline 1} fimport_34();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_34()
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
}

procedure {:inline 1} fimport_35();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_35()
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

procedure {:inline 1} fimport_36();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_36()
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
}

procedure {:inline 1} fimport_37();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_37()
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
}

procedure {:inline 1} fimport_38();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation fimport_38()
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
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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
modifies global_0;
implementation func_1()
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
    call push(global_0);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call func_0();
    call push(loc1);
    call push(136.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(152.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(160.0);
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
    call push(176.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(184.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
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
    call push(loc1);
    call push(200.0);
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
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (128);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (168);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(7.0);
    call arg1 := popArgs1();
label$1_start_2:
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(13.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_2;
    }
    call push(-2147483648.0);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_5;
    }
    call push(5.0);
    call arg1 := popArgs1();
label$3_start_6:
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(13.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_6;
    }
    call push(2147483647.0);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8192.0);
    call fimport_0();
label$2_end_5:
    call push(0.0);
    call arg1 := popArgs1();
    call push(59.0);
    call loc2 := popArgs1();
    call push(8256.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$4_start_9:
    call push(arg1);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_15;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_14;
    }
    call push(loc5);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    goto label$7_end_13;
label$9_end_15:
    call push(0.0);
    call loc6 := popArgs1();
    call push(arg1);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_12;
    }
    goto label$5_end_11;
label$8_end_14:
    call push(loc5);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc5);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc5 := popArgs1();
label$7_end_13:
    call push(loc5);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call loc6 := popArgs1();
label$6_end_12:
    call push(loc6);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc2);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc6 := popArgs1();
label$5_end_11:
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc2);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_9;
    }
    call push(loc4);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_18;
    }
    call push(0.0);
    call arg1 := popArgs1();
    call push(59.0);
    call loc6 := popArgs1();
    call push(8265.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$11_start_19:
    call push(0.0);
    call loc2 := popArgs1();
    call push(arg1);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_21;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_23;
    }
    call push(loc5);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    goto label$13_end_22;
label$14_end_23:
    call push(loc5);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc5);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc5 := popArgs1();
label$13_end_22:
    call push(loc5);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc6);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc2 := popArgs1();
label$12_end_21:
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(loc2);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc6);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_19;
    }
    call push(loc4);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_18;
    }
    call push(loc1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_2();
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(1128415488.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_26;
    }
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_4();
    call pop();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_27;
    }
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$16_end_27:
    call push(loc1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_28;
    }
    call push(loc1);
    call push(196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_31;
    }
label$20_start_34:
    call push(loc3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_37;
    }
    call push(loc5);
    call func_39();
label$21_end_37:
    call push(loc7);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_start_34;
    }
    call push(loc1);
    call push(192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$18_end_30;
label$19_end_31:
    call push(loc7);
    call loc3 := popArgs1();
label$18_end_30:
    call push(loc8);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call func_39();
label$17_end_28:
    call push(loc1);
    call push(152.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_end_38;
    }
    call push(loc1);
    call push(156.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_41;
    }
label$25_start_44:
    call push(loc3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$26_end_47;
    }
    call push(loc5);
    call func_39();
label$26_end_47:
    call push(loc7);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$25_start_44;
    }
    call push(loc1);
    call push(152.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$23_end_40;
label$24_end_41:
    call push(loc7);
    call loc3 := popArgs1();
label$23_end_40:
    call push(loc8);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call func_39();
label$22_end_38:
    call push(0.0);
    call func_53();
    call push(loc1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_48;
label$15_end_26:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_18;
    }
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$10_end_18:
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$29_end_51;
    }
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$28_end_50;
    }
    call push(arg3);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$27_end_49;
    }
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_6();
    call pop();
    call push(0.0);
    call fimport_1();
    assume (false);
label$29_end_51:
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(3.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_4();
    call pop();
    call push(0.0);
    call fimport_1();
    assume (false);
label$28_end_50:
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_6();
    call pop();
label$27_end_49:
    call push(0.0);
    call fimport_1();
    assume (false);
func_exit_48:
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
modifies global_0;
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
    call push(global_0);
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call fimport_2();
    call loc3 := popArgs1();
    call push(loc3);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_53;
    }
    call push(loc3);
    call func_61();
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc3);
    call fimport_3();
    call pop();
    call push(arg1);
    call push(loc1);
    call push(loc3);
    call func_9();
    call push(loc2);
    call global_0 := popArgs1();
    goto func_exit_56;
label$1_end_53:
    call push(loc1);
    call push(loc3);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(loc3);
    call fimport_3();
    call pop();
    call push(arg1);
    call push(loc1);
    call push(loc3);
    call func_9();
    call push(loc2);
    call global_0 := popArgs1();
func_exit_56:
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
    call push(global_0);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_2();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (160);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_62;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (168);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_62;
    }
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(10.0);
    call func_45();
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_65;
    }
label$8_start_69:
    call push(loc6);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_68;
    }
    call push(loc7);
    call loc6 := popArgs1();
    call push(loc5);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_69;
    }
    goto label$6_end_65;
label$7_end_68:
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_65;
    }
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$5_end_64;
label$6_end_65:
    call push(loc4);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(loc3);
    call fimport_4();
    call func_10();
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$5_end_64:
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8287.0);
    call fimport_0();
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg1);
    call push(76.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_76;
    }
label$13_start_80:
    call push(loc6);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_79;
    }
    call push(loc7);
    call loc6 := popArgs1();
    call push(loc5);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_start_80;
    }
    goto label$11_end_76;
label$12_end_79:
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_76;
    }
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$10_end_75;
label$11_end_76:
    call push(0.0);
    call loc7 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(loc3);
    call fimport_4();
    call loc6 := popArgs1();
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_74;
    }
    call push(loc4);
    call push(loc6);
    call func_11();
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$10_end_75:
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc8);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8315.0);
    call fimport_0();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (176);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8303.0);
    call fimport_0();
    call push(loc1);
    call push(152.0);
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
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(8307.0);
    call func_60();
    call loc7 := popArgs1();
    call push(loc7);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_59;
    }
    call push(loc7);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_89;
    }
    call push(loc1);
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_88;
    }
    goto label$14_end_87;
label$16_end_89:
    call push(loc7);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call func_37();
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (152);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (148);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$15_end_88:
    call push(loc6);
    call push(8307.0);
    call push(loc7);
    call fimport_5();
    call pop();
label$14_end_87:
    call push(loc8);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc6);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call fimport_6();
    call loc2 := popArgs1();
    call push(loc1);
    call push(108.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(124.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(132.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (92);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (100);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (116);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(1000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    // // wrap: no-op under real semantics
    call push(60.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(116.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc11 := popArgs1();
    call push(6.0);
    call loc2 := popArgs1();
label$17_start_91:
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(13.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_start_91;
    }
    call push(loc1);
    call push(2147483647.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc2 := popArgs1();
    call push(59.0);
    call loc3 := popArgs1();
    call push(8265.0);
    call loc7 := popArgs1();
    call push(0.0);
    call loc12 := popArgs1();
label$18_start_94:
    call push(0.0);
    call loc13 := popArgs1();
    call push(loc2);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_96;
    }
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_98;
    }
    call push(loc6);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    goto label$20_end_97;
label$21_end_98:
    call push(loc6);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc6);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc6 := popArgs1();
label$20_end_97:
    call push(loc6);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc13 := popArgs1();
label$19_end_96:
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc13);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc12 := popArgs1();
    call push(loc3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_start_94;
    }
    call push(loc1);
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc2 := popArgs1();
    call push(59.0);
    call loc13 := popArgs1();
    call push(8256.0);
    call loc7 := popArgs1();
    call push(0.0);
    call loc12 := popArgs1();
label$22_start_101:
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$27_end_107;
    }
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$26_end_106;
    }
    call push(loc6);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    goto label$25_end_105;
label$27_end_107:
    call push(0.0);
    call loc3 := popArgs1();
    call push(loc2);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_104;
    }
    goto label$23_end_103;
label$26_end_106:
    call push(loc6);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc6);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc6 := popArgs1();
label$25_end_105:
    call push(loc6);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call loc3 := popArgs1();
label$24_end_104:
    call push(loc3);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc3 := popArgs1();
label$23_end_103:
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc3);
    call push(loc12);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc12 := popArgs1();
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc13 := popArgs1();
    call push(loc13);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_start_101;
    }
    call push(loc1);
    call push(loc12);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
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
    call push(loc1);
    call push(loc11);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_42();
    call pop();
    call push(loc10);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call func_12();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$28_end_110;
    }
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$28_end_110:
    call push(loc8);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc1);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call fimport_6();
    call loc2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(1000000.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    // // wrap: no-op under real semantics
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_13();
    call push(loc1);
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(1.0);
    call fimport_7();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$29_end_112;
    }
    call push(loc1);
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call func_39();
label$29_end_112:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(1.0);
    call push(8380.0);
    call fimport_0();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(loc8);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (160);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc9);
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
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(1.0);
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(loc8);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc6);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call push(loc1);
    call push(32.0);
    call fimport_9();
    call push(loc2);
    call push(arg1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$30_end_114;
    }
    call push(loc7);
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$30_end_114:
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_14();
    call pop();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_62;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (152);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (192);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_61;
    }
    goto label$2_end_60;
label$9_end_74:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8571.0);
    call fimport_0();
    call push(48.0);
    call func_37();
    call loc5 := popArgs1();
    call push(loc5);
    call push(1398362880.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(8701.0);
    call fimport_0();
    call push(loc5);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc14 := popArgs1();
    call push(loc5);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(5462355.0);
    call loc2 := popArgs1();
label$32_start_118:
    call push(0.0);
    call loc9 := popArgs1();
    call push(loc2);
    // // wrap: no-op under real semantics
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(-1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(452984832.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$31_end_117;
    }
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc13 := popArgs1();
    call push(loc2);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$33_end_120;
    }
    call push(loc13);
    call loc2 := popArgs1();
    call push(1.0);
    call loc9 := popArgs1();
    call push(loc7);
    call loc6 := popArgs1();
    call push(loc6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc6);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$32_start_118;
    }
    goto label$31_end_117;
label$33_end_120:
    call push(loc13);
    call loc2 := popArgs1();
label$34_start_122:
    call push(loc2);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$31_end_117;
    }
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc7);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc6 := popArgs1();
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call loc7 := popArgs1();
    call push(loc6);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$34_start_122;
    }
    call push(1.0);
    call loc9 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$32_start_118;
    }
label$31_end_117:
    call push(loc9);
    call push(8750.0);
    call fimport_0();
    call push(loc5);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (160);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc10);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (176);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc10);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(24.0);
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
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(loc5);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(loc5);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc10);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc14);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(arg1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(loc12);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call push(32.0);
    call fimport_10();
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$35_end_127;
    }
    call push(loc7);
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$35_end_127:
    call push(loc1);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(76.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(arg1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$37_end_131;
    }
    call push(loc7);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc7);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc8);
    call push(loc7);
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$36_end_130;
    }
    goto label$4_end_62;
label$37_end_131:
    call push(arg1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_15();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_62;
    }
label$36_end_130:
    call push(loc7);
    call func_39();
label$4_end_62:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (192);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_60;
    }
label$3_end_61:
    call push(loc1);
    call push(200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$2_end_60:
    call push(loc1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_134;
label$1_end_59:
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_41();
    assume (false);
func_exit_134:
}

procedure {:inline 1} popDiscard2();
modifies $sp;
requires(($sp) >= (2));
ensures(($sp) == ((old($sp)) - (2)));
ensures((0) <= ($sp));
implementation popDiscard2()
{
    $sp := ($sp) - (2);
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
modifies global_0;
implementation func_4()
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
    call push(global_0);
    call loc1 := popArgs1();
    call push(loc1);
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
    call fimport_2();
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_136;
    }
    call push(loc4);
    call push(512.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_138;
    }
    call push(loc4);
    call func_61();
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc4);
    call fimport_3();
    call pop();
    call push(loc1);
    call func_64();
    goto label$1_end_136;
label$2_end_138:
    call push(loc1);
    call push(loc4);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(loc4);
    call fimport_3();
    call pop();
label$1_end_136:
    call push(arg1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_141;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
label$3_end_141:
    call push(loc4);
    call push(arg2);
    call popDiscard2();
    call push(loc2);
    call global_0 := popArgs1();
    call push(1.0);
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
modifies global_0;
implementation func_5()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(59.0);
    call loc4 := popArgs1();
    call push(8278.0);
    call loc5 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
label$1_start_143:
    call push(loc3);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_149;
    }
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_148;
    }
    call push(loc7);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    goto label$4_end_147;
label$6_end_149:
    call push(0.0);
    call loc8 := popArgs1();
    call push(loc3);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_146;
    }
    goto label$2_end_145;
label$5_end_148:
    call push(loc7);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc7);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc7 := popArgs1();
label$4_end_147:
    call push(loc7);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call loc8 := popArgs1();
label$3_end_146:
    call push(loc8);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc8 := popArgs1();
label$2_end_145:
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc8);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_143;
    }
    call push(loc2);
    call push(loc6);
    call fimport_11();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(arg2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc3 := popArgs1();
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_153;
    }
label$10_start_157:
    call push(loc7);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_156;
    }
    call push(loc5);
    call loc7 := popArgs1();
    call push(loc10);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_157;
    }
    goto label$8_end_153;
label$9_end_156:
    call push(loc10);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_153;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$7_end_152;
label$8_end_153:
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(loc3);
    call fimport_4();
    call loc5 := popArgs1();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_152;
    }
    call push(loc9);
    call push(loc5);
    call func_10();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$7_end_152:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8380.0);
    call fimport_0();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call fimport_12();
    call push(arg2);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg2);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc8);
    call push(loc1);
    call push(16.0);
    call fimport_9();
    call push(loc3);
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_164;
    }
    call push(loc5);
    call push(-2.0);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$11_end_164:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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
modifies global_0;
implementation func_6()
{
    var arg1: real;
    var arg2: real;
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
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
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
    call loc4 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call fimport_2();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_167;
    }
    call push(arg2);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_170;
    }
    call push(arg2);
    call func_61();
    call loc5 := popArgs1();
    goto label$2_end_169;
label$3_end_170:
    call push(loc1);
    call push(arg2);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call global_0 := popArgs1();
label$2_end_169:
    call push(loc5);
    call push(arg2);
    call fimport_3();
    call pop();
label$1_end_167:
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call push(4.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_172;
    }
    call push(loc5);
    call func_64();
label$4_end_172:
    call push(arg1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_173;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
label$5_end_173:
    call push(arg2);
    call push(loc1);
    call push(loc4);
    call popDiscard3();
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
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
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_14();
    call push(arg1);
    call push(1.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(2.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(3.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(4.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(5.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(6.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(7.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(8.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(9.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(10.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(11.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(12.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(13.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(14.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(15.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(16.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(17.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(18.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(19.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(20.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(21.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(22.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(23.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
    call push(arg1);
    call push(24.0);
    call push(5.0);
    call push(1.0);
    call func_17();
    call pop();
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
modifies global_0;
implementation func_8()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(59.0);
    call loc4 := popArgs1();
    call push(8278.0);
    call loc5 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
label$1_start_175:
    call push(loc3);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_181;
    }
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(-97.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(25.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_180;
    }
    call push(loc7);
    call push(-91.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    goto label$4_end_179;
label$6_end_181:
    call push(0.0);
    call loc8 := popArgs1();
    call push(loc3);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_178;
    }
    goto label$2_end_177;
label$5_end_180:
    call push(loc7);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call push(loc7);
    call push(-49.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(5.0);
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
    call loc7 := popArgs1();
label$4_end_179:
    call push(loc7);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    call loc8 := popArgs1();
label$3_end_178:
    call push(loc8);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc8 := popArgs1();
label$2_end_177:
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc8);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_175;
    }
    call push(loc2);
    call push(loc6);
    call fimport_11();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(arg2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc3 := popArgs1();
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_185;
    }
label$10_start_189:
    call push(loc7);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_188;
    }
    call push(loc5);
    call loc7 := popArgs1();
    call push(loc10);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_189;
    }
    goto label$8_end_185;
label$9_end_188:
    call push(loc10);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_185;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$7_end_184;
label$8_end_185:
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(loc3);
    call fimport_4();
    call loc5 := popArgs1();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_184;
    }
    call push(loc9);
    call push(loc5);
    call func_10();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$7_end_184:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8380.0);
    call fimport_0();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(1.0);
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg2);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call push(loc1);
    call push(16.0);
    call fimport_9();
    call push(loc8);
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_195;
    }
    call push(loc5);
    call push(-2.0);
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$11_end_195:
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(arg1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc10 := popArgs1();
    call push(loc10);
    call push(arg1);
    call push(76.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_198;
    }
label$15_start_202:
    call push(loc7);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_201;
    }
    call push(loc5);
    call loc7 := popArgs1();
    call push(loc10);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_202;
    }
    goto label$13_end_198;
label$14_end_201:
    call push(loc10);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_198;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$12_end_197;
label$13_end_198:
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(loc3);
    call fimport_4();
    call loc5 := popArgs1();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_197;
    }
    call push(loc9);
    call push(loc5);
    call func_11();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$12_end_197:
    call push(arg2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc5 := popArgs1();
    call push(loc5);
    call push(8790.0);
    call fimport_0();
    call push(loc5);
    call push(8839.0);
    call fimport_0();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call fimport_13();
    call loc5 := popArgs1();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_209;
    }
    call push(loc9);
    call push(loc5);
    call func_11();
    call pop();
label$16_end_209:
    call push(loc9);
    call push(arg2);
    call func_16();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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
modifies global_0;
implementation func_9()
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
    call push(global_0);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1398362880.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(8701.0);
    call fimport_0();
    call push(5462355.0);
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
label$3_start_214:
    call push(loc2);
    // // wrap: no-op under real semantics
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(-1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(452984832.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_213;
    }
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc2);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_216;
    }
    call push(loc4);
    call loc2 := popArgs1();
    call push(1.0);
    call loc5 := popArgs1();
    call push(loc3);
    call loc6 := popArgs1();
    call push(loc6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc6);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_214;
    }
    goto label$1_end_212;
label$4_end_216:
    call push(loc4);
    call loc2 := popArgs1();
label$5_start_218:
    call push(loc2);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_213;
    }
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc3);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc5 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call loc3 := popArgs1();
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_218;
    }
    call push(1.0);
    call loc5 := popArgs1();
    call push(loc6);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc6);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_214;
    }
    goto label$1_end_212;
label$2_end_213:
    call push(0.0);
    call loc5 := popArgs1();
label$1_end_212:
    call push(loc5);
    call push(8750.0);
    call fimport_0();
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
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
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
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_31();
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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
modifies global_0;
implementation func_10()
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
    call push(global_0);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_222;
    }
label$3_start_226:
    call push(loc4);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_225;
    }
    call push(loc3);
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_226;
    }
    goto label$1_end_222;
label$2_end_225:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_222;
    }
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc4);
    goto func_exit_230;
label$1_end_222:
    call push(arg2);
    call push(0.0);
    call push(0.0);
    call fimport_15();
    call loc3 := popArgs1();
    call push(loc3);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call push(8673.0);
    call fimport_0();
    call push(loc3);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_233;
    }
    call push(loc3);
    call func_61();
    call loc1 := popArgs1();
    goto label$4_end_232;
label$5_end_233:
    call push(loc1);
    call push(loc3);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
label$4_end_232:
    call push(arg2);
    call push(loc1);
    call push(loc3);
    call fimport_15();
    call pop();
    call push(32.0);
    call func_37();
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc4);
    call push(loc1);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc4);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_239;
    }
    call push(loc7);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc7);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(loc7);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_238;
    }
    goto label$6_end_237;
label$8_end_239:
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_30();
    call push(loc3);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_237;
    }
label$7_end_238:
    call push(loc1);
    call func_64();
label$6_end_237:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_242;
    }
    call push(arg2);
    call func_39();
label$9_end_242:
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc4);
func_exit_230:
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
modifies global_0;
implementation func_11()
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
    call push(global_0);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_244;
    }
label$3_start_248:
    call push(loc4);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_247;
    }
    call push(loc3);
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_248;
    }
    goto label$1_end_244;
label$2_end_247:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_244;
    }
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc4);
    goto func_exit_252;
label$1_end_244:
    call push(arg2);
    call push(0.0);
    call push(0.0);
    call fimport_15();
    call loc5 := popArgs1();
    call push(loc5);
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call push(8673.0);
    call fimport_0();
    call push(loc5);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_255;
    }
    call push(loc5);
    call func_61();
    call loc6 := popArgs1();
    goto label$4_end_254;
label$5_end_255:
    call push(loc1);
    call push(loc5);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call global_0 := popArgs1();
label$4_end_254:
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(arg2);
    call push(loc6);
    call push(loc5);
    call fimport_15();
    call pop();
    call push(loc2);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(48.0);
    call func_37();
    call loc8 := popArgs1();
    call push(loc8);
    call push(1398362880.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc8);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(8701.0);
    call fimport_0();
    call push(5462355.0);
    call loc9 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$8_start_260:
    call push(loc9);
    // // wrap: no-op under real semantics
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(-1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(452984832.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_259;
    }
    call push(loc9);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc10 := popArgs1();
    call push(loc9);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_262;
    }
    call push(loc10);
    call loc9 := popArgs1();
    call push(1.0);
    call loc3 := popArgs1();
    call push(loc4);
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_260;
    }
    goto label$6_end_258;
label$9_end_262:
    call push(loc10);
    call loc9 := popArgs1();
label$10_start_264:
    call push(loc9);
    call push(65280.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_259;
    }
    call push(loc9);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc9 := popArgs1();
    call push(loc4);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc3 := popArgs1();
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call loc4 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_264;
    }
    call push(1.0);
    call loc3 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_260;
    }
    goto label$6_end_258;
label$7_end_259:
    call push(0.0);
    call loc3 := popArgs1();
label$6_end_258:
    call push(loc3);
    call push(8750.0);
    call fimport_0();
    call push(loc8);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call func_34();
    call pop();
    call push(loc8);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(28.0);
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
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_270;
    }
    call push(loc4);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc4);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_269;
    }
    goto label$11_end_268;
label$13_end_270:
    call push(loc7);
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_15();
    call push(loc5);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_268;
    }
label$12_end_269:
    call push(loc6);
    call func_64();
label$11_end_268:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_273;
    }
    call push(loc4);
    call func_39();
label$14_end_273:
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc8);
func_exit_252:
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
modifies global_0;
implementation func_12()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var loc4: real;
    var loc5: real;
    var loc6: real;
    var loc7: real;
    var loc8: real;
    var loc9: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (5));
    call arg1, arg2, arg3, arg4, arg5 := popArgs5();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    loc6 := 0.0;
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    call push(global_0);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(107374184.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_276;
    }
    call push(107374184.0);
    call loc5 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(53687088.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_281;
    }
    call push(loc4);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc5);
    call push(loc4);
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
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_280;
    }
label$4_end_281:
    call push(loc5);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call func_37();
    call loc2 := popArgs1();
    goto label$1_end_275;
label$3_end_280:
    call push(0.0);
    call loc5 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    goto label$1_end_275;
label$2_end_276:
    call push(arg1);
    call func_51();
    assume (false);
label$1_end_275:
    call push(loc2);
    call push(loc3);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
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
    call push(arg4);
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
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(arg4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(16.0);
    call func_37();
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg4);
    call push(arg3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
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
    call push(arg3);
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
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg5);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc2);
    call push(loc5);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc3);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$5_start_291:
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(loc6);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_291;
    }
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_295;
    }
    call push(loc5);
    call push(arg3);
    call func_23();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    goto label$6_end_294;
label$7_end_295:
    call push(0.0);
    call arg2 := popArgs1();
    call push(0.0);
    call arg3 := popArgs1();
label$6_end_294:
    call push(loc1);
    call push(arg3);
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
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_35();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_297;
    }
    call push(arg3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc9 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
label$10_start_300:
    call push(loc3);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(-32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg5 := popArgs1();
    call push(arg5);
    call push(-32.0);
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
    call push(arg3);
    call push(-40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg5);
    call push(-40.0);
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
    call push(arg3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg5);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(arg4);
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
    call push(arg5);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
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
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg5);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
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
    call push(arg4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call push(arg5);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg5 := popArgs1();
    call push(arg5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg5);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc9);
    call push(loc5);
    call push(-40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_300;
    }
    call push(loc3);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    goto label$8_end_296;
label$9_end_297:
    call push(arg3);
    call arg2 := popArgs1();
label$8_end_296:
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
    call push(loc8);
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
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_313;
    }
label$12_start_314:
    call push(arg3);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg5 := popArgs1();
    call push(arg5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_316;
    }
    call push(arg3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg5);
    call func_39();
label$13_end_316:
    call push(arg3);
    call push(-40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg5 := popArgs1();
    call push(arg3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_318;
    }
    call push(arg3);
    call push(-20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call func_39();
label$14_end_318:
    call push(arg5);
    call arg3 := popArgs1();
    call push(arg2);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_start_314;
    }
label$11_end_313:
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_320;
    }
    call push(arg2);
    call func_39();
label$15_end_320:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_13();
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
implementation func_13()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call func_22();
    call pop();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_323;
    }
    call push(arg1);
    call push(loc3);
    call func_23();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    goto label$1_end_322;
label$2_end_323:
    call push(0.0);
    call arg1 := popArgs1();
label$1_end_322:
    call push(loc1);
    call push(arg1);
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
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call func_24();
    call pop();
    call push(loc1);
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_25();
    call push(arg2);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_25();
    call push(arg2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_26();
    call pop();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_14();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_14()
{
    var arg1: real;
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
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_325;
    }
    call push(arg1);
    call push(52.0);
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
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_328;
    }
label$4_start_331:
    call push(loc3);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc3);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_333;
    }
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call func_39();
label$5_end_333:
    call push(loc4);
    call loc3 := popArgs1();
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_331;
    }
    call push(arg1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$2_end_327;
label$3_end_328:
    call push(loc1);
    call loc3 := popArgs1();
label$2_end_327:
    call push(loc2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call func_39();
label$1_end_325:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_335;
    }
    call push(arg1);
    call push(40.0);
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
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_338;
    }
label$9_start_341:
    call push(loc3);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_343;
    }
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call func_39();
label$10_end_343:
    call push(loc3);
    call push(-40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_345;
    }
    call push(loc3);
    call push(-20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call func_39();
label$11_end_345:
    call push(loc4);
    call loc3 := popArgs1();
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_341;
    }
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$7_end_337;
label$8_end_338:
    call push(loc1);
    call loc3 := popArgs1();
label$7_end_337:
    call push(loc2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call func_39();
label$6_end_335:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_347;
    }
    call push(arg1);
    call push(28.0);
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
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_350;
    }
label$15_start_353:
    call push(loc3);
    call push(-12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_355;
    }
    call push(loc3);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call func_39();
label$16_end_355:
    call push(loc3);
    call push(-40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_357;
    }
    call push(loc3);
    call push(-20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call func_39();
label$17_end_357:
    call push(loc4);
    call loc3 := popArgs1();
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_353;
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
    call loc3 := popArgs1();
    goto label$13_end_349;
label$14_end_350:
    call push(loc1);
    call loc3 := popArgs1();
label$13_end_349:
    call push(loc2);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call func_39();
label$12_end_347:
    call push(arg1);
}

procedure {:inline 1} func_15();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_15()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(178956976.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_360;
    }
    call push(178956976.0);
    call loc4 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(89478480.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_365;
    }
    call push(loc3);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc4);
    call push(loc3);
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
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_364;
    }
label$4_end_365:
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call func_37();
    call loc1 := popArgs1();
    goto label$1_end_359;
label$3_end_364:
    call push(0.0);
    call loc4 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$1_end_359;
label$2_end_360:
    call push(arg1);
    call func_51();
    assume (false);
label$1_end_359:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg3);
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
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_372;
    }
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
label$7_start_375:
    call push(arg3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg4 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg4);
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
    call push(-8.0);
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
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call push(-16.0);
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
    call push(arg2);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call arg3 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_375;
    }
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    goto label$5_end_371;
label$6_end_372:
    call push(loc4);
    call arg3 := popArgs1();
label$5_end_371:
    call push(arg1);
    call push(arg2);
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
    call push(loc3);
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
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_378;
    }
label$9_start_379:
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_382;
    }
    call push(arg2);
    call func_39();
label$10_end_382:
    call push(arg3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_379;
    }
label$8_end_378:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_383;
    }
    call push(arg3);
    call func_39();
label$11_end_383:
}

procedure {:inline 1} func_16();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_16()
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
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8869.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8914.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc1);
    call push(arg1);
    call push(28.0);
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
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_385;
    }
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_388;
    }
    call push(loc4);
    call loc2 := popArgs1();
    goto label$1_end_385;
label$2_end_388:
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
label$4_start_391:
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_390;
    }
    call push(loc4);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call loc4 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_391;
    }
    goto label$1_end_385;
label$3_end_390:
    call push(loc1);
    call loc2 := popArgs1();
label$1_end_385:
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8964.0);
    call fimport_0();
    call push(loc2);
    call push(loc3);
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
        goto label$7_end_396;
    }
    call push(loc2);
    call loc4 := popArgs1();
label$8_start_398:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc6);
    call push(loc7);
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
        goto label$9_end_401;
    }
    call push(loc2);
    call func_39();
label$9_end_401:
    call push(loc4);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(16.0);
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
    call push(loc4);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
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
    call push(loc1);
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_398;
    }
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
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
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_395;
    }
    goto label$5_end_394;
label$7_end_396:
    call push(loc2);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
label$6_end_395:
label$10_start_404:
    call push(loc2);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc2);
    call push(0.0);
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
        goto label$11_end_407;
    }
    call push(loc4);
    call func_39();
label$11_end_407:
    call push(loc7);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_404;
    }
label$5_end_394:
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call fimport_16();
}

procedure {:inline 1} func_17();
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
implementation func_17()
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
    call push(global_0);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_410;
    }
label$4_start_414:
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_413;
    }
    call push(loc5);
    call loc4 := popArgs1();
    call push(loc3);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_414;
    }
    goto label$2_end_410;
label$3_end_413:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_410;
    }
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
    goto label$1_end_409;
label$2_end_410:
    call push(0.0);
    call loc6 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(arg2);
    call fimport_4();
    call loc5 := popArgs1();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_409;
    }
    call push(loc2);
    call push(loc5);
    call func_10();
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8622.0);
    call fimport_0();
label$1_end_409:
    call push(arg3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_424;
    }
    call popToTmp1();
    idx := real_to_int($tmp1);
    if (((idx) < (0)) || ((idx) >= (5))) {
        goto label$10_end_426;
    } else {
        if ((idx) == (0)) {
            goto label$10_end_426;
        }
        if ((idx) == (1)) {
            goto label$8_end_423;
        }
        if ((idx) == (2)) {
            goto label$7_end_422;
        }
        if ((idx) == (3)) {
            goto label$6_end_421;
        }
        if ((idx) == (4)) {
            goto label$5_end_420;
        }
        goto label$10_end_426;
    }
label$10_end_426:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8380.0);
    call fimport_0();
    call push(loc2);
    call push(loc6);
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_18();
label$9_end_424:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(0.0);
    goto func_exit_428;
label$8_end_423:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8380.0);
    call fimport_0();
    call push(loc2);
    call push(loc6);
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_19();
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(0.0);
    goto func_exit_428;
label$7_end_422:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8380.0);
    call fimport_0();
    call push(loc2);
    call push(loc6);
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_20();
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(0.0);
    goto func_exit_428;
label$6_end_421:
    call push(loc1);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg2);
    goto func_exit_428;
label$5_end_420:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
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
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_21();
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(0.0);
func_exit_428:
}

procedure {:inline 1} func_18();
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
implementation func_18()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(arg2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(1.0);
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg2);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call push(loc1);
    call push(16.0);
    call fimport_9();
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_434;
    }
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_434:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_19();
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
implementation func_19()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(arg2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(1.0);
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg2);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call push(loc1);
    call push(16.0);
    call fimport_9();
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_436;
    }
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_436:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_20();
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
implementation func_20()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var loc1: real;
    var loc2: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (4));
    call arg1, arg2, arg3, arg4 := popArgs4();
    loc1 := 0.0;
    loc2 := 0.0;
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8415.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8461.0);
    call fimport_0();
    call push(arg2);
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(1.0);
    call push(8512.0);
    call fimport_0();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg2);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call push(loc1);
    call push(16.0);
    call fimport_9();
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_438;
    }
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_438:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_21();
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
implementation func_21()
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
    call push(global_0);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_8();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8571.0);
    call fimport_0();
    call push(loc1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
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
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(32.0);
    call func_37();
    call arg4 := popArgs1();
    call push(arg4);
    call push(arg2);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_29();
    call pop();
    call push(loc1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(28.0);
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
    call push(arg2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_444;
    }
    call push(loc4);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc4);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$1_end_443;
label$2_end_444:
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_30();
label$1_end_443:
    call push(arg1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_447;
    }
    call push(arg2);
    call func_39();
label$3_end_447:
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_22();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_22()
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
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_u32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$1_start_449:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_449;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_u32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$2_start_452:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_452;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
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
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$3_start_457:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_457;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_460;
    }
label$5_start_461:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc4);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$6_start_466:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_466;
    }
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_469;
    }
    call push(loc7);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$7_end_469:
    call push(loc1);
    call push(loc4);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$8_start_472:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_472;
    }
    call push(loc4);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_461;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$4_end_460:
    call push(arg2);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$9_start_478:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_478;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_481;
    }
label$11_start_482:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc4);
    call push(20.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$12_start_487:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_start_487;
    }
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_490;
    }
    call push(loc7);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$13_end_490:
    call push(loc1);
    call push(loc4);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$14_start_493:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_start_493;
    }
    call push(loc4);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_482;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$10_end_481:
    call push(arg2);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$15_start_499:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_start_499;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_502;
    }
label$17_start_503:
    call push(loc1);
    call push(loc4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
label$18_start_507:
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_start_507;
    }
    call push(loc4);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_start_503;
    }
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$16_end_502:
    call push(arg1);
}

procedure {:inline 1} func_23();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_23()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_515;
    }
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_513;
    }
    call push(2147483647.0);
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1073741824.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_521;
    }
    call push(loc5);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(loc5);
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
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_514;
    }
label$6_end_521:
    call push(loc6);
    call func_37();
    call loc1 := popArgs1();
    goto label$2_end_512;
label$5_end_515:
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
label$7_start_525:
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_525;
    }
    goto label$1_end_511;
label$4_end_514:
    call push(0.0);
    call loc6 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$2_end_512;
label$3_end_513:
    call push(arg1);
    call func_51();
    assume (false);
label$2_end_512:
    call push(loc1);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call loc2 := popArgs1();
label$8_start_530:
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_530;
    }
    call push(loc1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc4);
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_536;
    }
    call push(loc1);
    call push(arg2);
    call push(loc2);
    call fimport_5();
    call pop();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
label$9_end_536:
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(loc3);
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
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_511;
    }
    call push(arg2);
    call func_39();
    goto func_exit_537;
label$1_end_511:
func_exit_537:
}

procedure {:inline 1} func_24();
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
implementation func_24()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(4.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_u32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
label$1_start_542:
    call push(loc4);
    // // wrap: no-op under real semantics
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc4);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc5 := popArgs1();
    call push(loc5);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc2);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (14);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(14.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_542;
    }
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_u32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
label$2_start_551:
    call push(loc4);
    // // wrap: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc4);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call arg2 := popArgs1();
    call push(arg2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc5);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_551;
    }
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_25();
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
implementation func_25()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$1_start_557:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc7 := popArgs1();
    call push(loc7);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc6);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_557;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_562;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$3_start_565:
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    call push(loc7);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_28();
    call push(loc6);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_27();
    call pop();
    call push(loc6);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_562;
    }
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$3_start_565;
label$2_end_562:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_26();
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
implementation func_26()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
label$1_start_571:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc6 := popArgs1();
    call push(loc6);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc5);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(loc6);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_571;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_577;
    }
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
label$3_start_580:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call push(2.0);
    call fimport_5();
    call pop();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(2.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc5);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_27();
    call pop();
    call push(loc5);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_577;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$3_start_580;
label$2_end_577:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_27();
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
implementation func_27()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$1_start_585:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc7 := popArgs1();
    call push(loc7);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc6);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_585;
    }
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
    call push(4.0);
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
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(loc5);
    call fimport_5();
    call pop();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_28();
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
implementation func_28()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
label$1_start_594:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc1);
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc6 := popArgs1();
    call push(loc6);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc5);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
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
    call push(loc6);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_594;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_600;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$3_start_603:
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc5);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    call push(loc6);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_603;
    }
label$2_end_600:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_29();
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
implementation func_29()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(arg1);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(1.0);
    call push(8374.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call push(16.0);
    call fimport_10();
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_612;
    }
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-2.0);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(-3.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_612:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_30();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_30()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(178956976.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_614;
    }
    call push(178956976.0);
    call loc4 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(89478480.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_619;
    }
    call push(loc3);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc4);
    call push(loc3);
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
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_618;
    }
label$4_end_619:
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call func_37();
    call loc1 := popArgs1();
    goto label$1_end_613;
label$3_end_618:
    call push(0.0);
    call loc4 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$1_end_613;
label$2_end_614:
    call push(arg1);
    call func_51();
    assume (false);
label$1_end_613:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg3);
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
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg3);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_626;
    }
    call push(loc1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
label$7_start_629:
    call push(arg3);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg4 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(arg4);
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
    call push(-8.0);
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
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call push(-16.0);
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
    call push(arg2);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call arg3 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_629;
    }
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    goto label$5_end_625;
label$6_end_626:
    call push(loc4);
    call arg3 := popArgs1();
label$5_end_625:
    call push(arg1);
    call push(arg2);
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
    call push(loc3);
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
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_632;
    }
label$9_start_633:
    call push(loc4);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(loc4);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_636;
    }
    call push(arg2);
    call func_39();
label$10_end_636:
    call push(arg3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_633;
    }
label$8_end_632:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_637;
    }
    call push(arg3);
    call func_39();
label$11_end_637:
}

procedure {:inline 1} func_31();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_31()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_32();
    call pop();
}

procedure {:inline 1} func_32();
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
implementation func_32()
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
    call push(global_0);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_33();
    call pop();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_650;
    }
    call push(loc1);
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
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_645;
    }
    call push(loc3);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_649;
    }
    call push(loc1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc4 := popArgs1();
    goto label$6_end_648;
label$8_end_650:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_647;
    }
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u16(idx, store_i);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    goto label$4_end_646;
label$7_end_649:
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call func_37();
    call loc4 := popArgs1();
    call push(loc1);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$6_end_648:
    call push(loc3);
    call loc6 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$9_start_654:
    call push(loc5);
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
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc6);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_654;
    }
    call push(loc4);
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
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_658;
    }
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u16(idx, store_i);
    goto label$10_end_657;
label$11_end_658:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$10_end_657:
    call push(arg2);
    call push(0.0);
    call func_44();
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
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
    call push(arg2);
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
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_643;
    }
    goto label$2_end_644;
label$5_end_647:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$4_end_646:
    call push(arg2);
    call push(0.0);
    call func_44();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_644;
    }
    goto label$1_end_643;
label$3_end_645:
    call push(loc1);
    call func_41();
    assume (false);
label$2_end_644:
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$1_end_643:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_33();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_33()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$1_start_661:
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(8770.0);
    call fimport_0();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc5);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc6);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc6);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_661;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc3);
    // // wrap: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_667;
    }
    call push(arg2);
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call func_23();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    goto label$2_end_666;
label$3_end_667:
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_666;
    }
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_666:
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc2);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(loc6);
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
}

procedure {:inline 1} func_34();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_34()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8696.0);
    call fimport_0();
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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

procedure {:inline 1} func_35();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_35()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
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
    call arg1 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(arg1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_36();
    call pop();
}

procedure {:inline 1} func_36();
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
implementation func_36()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$1_start_684:
    call push(loc3);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc1);
    call push(loc3);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc7 := popArgs1();
    call push(loc7);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(loc6);
    call push(127.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call fimport_5();
    call pop();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_684;
    }
    call push(arg2);
    call push(4.0);
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
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc6);
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
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_689;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call push(8374.0);
    call fimport_0();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc7);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call push(loc2);
    call fimport_5();
    call pop();
    call push(loc4);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_689:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
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

procedure {:inline 1} func_37();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_37()
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
    call push(1.0);
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
    call push(loc1);
    call func_61();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_694;
    }
label$2_start_697:
    call push(0.0);
    call arg1 := popArgs1();
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9020);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_694;
    }
    call push(loc2);
    call popDiscard1();
    call push(loc1);
    call func_61();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_697;
    }
label$1_end_694:
    call push(arg1);
}

procedure {:inline 1} func_38();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_38()
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
    call func_37();
}

procedure {:inline 1} func_39();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_39()
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_701;
    }
    call push(arg1);
    call func_64();
label$1_end_701:
}

procedure {:inline 1} func_40();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_40()
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
    call func_39();
}

procedure {:inline 1} func_41();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_41()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call fimport_17();
    assume (false);
}

procedure {:inline 1} func_42();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_42()
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
    call loc1 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_703;
    }
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
    goto func_exit_705;
label$1_end_703:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_706;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_709;
    }
    call push(arg1);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_708;
    }
    call push(arg2);
    call push(loc1);
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
    goto func_exit_705;
label$4_end_709:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call func_37();
    call arg2 := popArgs1();
    call push(arg1);
    call push(loc3);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$3_end_708:
    call push(arg2);
    call push(loc2);
    call push(loc1);
    call fimport_5();
    call pop();
    call push(arg2);
    call push(loc1);
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
    goto func_exit_705;
label$2_end_706:
    call fimport_17();
    assume (false);
func_exit_705:
}

procedure {:inline 1} popArgs8() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real, a8: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (8));
ensures(($sp) == ((old($sp)) - (8)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (8)]));
ensures((a2) == (old($stack)[(old($sp)) - (7)]));
ensures((a3) == (old($stack)[(old($sp)) - (6)]));
ensures((a4) == (old($stack)[(old($sp)) - (5)]));
ensures((a5) == (old($stack)[(old($sp)) - (4)]));
ensures((a6) == (old($stack)[(old($sp)) - (3)]));
ensures((a7) == (old($stack)[(old($sp)) - (2)]));
ensures((a8) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs8() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real, a8: real)
{
    $sp := ($sp) - (1);
    a8 := $stack[$sp];
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

procedure {:inline 1} func_43();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_43()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var arg6: real;
    var arg7: real;
    var arg8: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (8));
    call arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 := popArgs8();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(-18.0);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_713;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_716;
    }
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(-17.0);
    call loc2 := popArgs1();
    call push(arg2);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_715;
    }
    goto label$2_end_714;
label$4_end_716:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(-17.0);
    call loc2 := popArgs1();
    call push(arg2);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_714;
    }
label$3_end_715:
    call push(11.0);
    call loc2 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(arg3);
    call push(loc3);
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
    call arg3 := popArgs1();
    call push(arg3);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_714;
    }
    call push(arg3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
label$2_end_714:
    call push(loc2);
    call func_37();
    call arg3 := popArgs1();
    call push(arg5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_720;
    }
    call push(arg3);
    call push(loc1);
    call push(arg5);
    call fimport_5();
    call pop();
label$5_end_720:
    call push(arg7);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_721;
    }
    call push(arg3);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg8);
    call push(arg7);
    call fimport_5();
    call pop();
label$6_end_721:
    call push(arg4);
    call push(arg6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg4 := popArgs1();
    call push(arg4);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg8 := popArgs1();
    call push(arg8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_722;
    }
    call push(arg3);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg8);
    call fimport_5();
    call pop();
label$7_end_722:
    call push(arg2);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_725;
    }
    call push(loc1);
    call func_39();
label$8_end_725:
    call push(arg1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
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
    call push(arg4);
    call push(arg7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg5 := popArgs1();
    call push(arg5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(arg5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto func_exit_727;
label$1_end_713:
    call fimport_17();
    assume (false);
func_exit_727:
}

procedure {:inline 1} func_44();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_44()
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
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_731;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_733;
    }
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(10.0);
    call loc3 := popArgs1();
    goto label$5_end_732;
label$6_end_733:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$5_end_732:
    call push(10.0);
    call loc4 := popArgs1();
    call push(loc2);
    call push(arg2);
    call push(loc2);
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
    call arg2 := popArgs1();
    call push(arg2);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_736;
    }
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
label$7_end_736:
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_740;
    }
    call push(loc4);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_741;
    }
    call push(1.0);
    call loc5 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(0.0);
    call loc6 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_738;
    }
    goto label$3_end_730;
label$11_end_741:
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_37();
    call arg2 := popArgs1();
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_739;
    }
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_739;
    }
label$10_end_740:
    goto func_exit_742;
label$9_end_739:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_743;
    }
    call push(1.0);
    call loc6 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_730;
    }
    goto label$8_end_738;
label$12_end_743:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(1.0);
    call loc5 := popArgs1();
    call push(1.0);
    call loc6 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_730;
    }
label$8_end_738:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_728;
    }
    goto label$2_end_729;
label$4_end_731:
    call fimport_17();
    assume (false);
label$3_end_730:
    call push(loc1);
    call push(254.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_728;
    }
label$2_end_729:
    call push(arg2);
    call push(loc3);
    call push(loc1);
    call fimport_5();
    call pop();
label$1_end_728:
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_747;
    }
    call push(loc3);
    call func_39();
label$13_end_747:
    call push(loc6);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_748;
    }
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_742;
label$14_end_748:
    call push(arg1);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
func_exit_742:
}

procedure {:inline 1} func_45();
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
implementation func_45()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
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
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(17436.0);
    call func_60();
    call loc2 := popArgs1();
    call push(loc2);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_752;
    }
    call push(loc2);
    call push(11.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_756;
    }
    call push(loc1);
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_755;
    }
    goto label$4_end_754;
label$6_end_756:
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call func_37();
    call loc3 := popArgs1();
    call push(loc1);
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$5_end_755:
    call push(loc3);
    call push(17436.0);
    call push(loc2);
    call fimport_5();
    call pop();
label$4_end_754:
    call push(loc3);
    call push(loc2);
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
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call func_52();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call func_52();
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
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
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call func_59();
    call arg1 := popArgs1();
    call func_52();
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(loc3);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(34.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_751;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_750;
    }
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_761;
    }
    call push(arg2);
    call push(loc3);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$7_end_761:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_762;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$8_end_762:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
    goto func_exit_764;
label$3_end_752:
    call fimport_17();
    assume (false);
label$2_end_751:
    call push(loc1);
    call func_46();
    assume (false);
label$1_end_750:
    call push(loc1);
    call func_47();
    assume (false);
func_exit_764:
}

procedure {:inline 1} func_46();
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
implementation func_46()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(arg1);
    call push(8824.0);
    call func_48();
    call func_49();
    assume (false);
}

procedure {:inline 1} func_47();
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
implementation func_47()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(arg1);
    call push(8774.0);
    call func_48();
    call func_50();
    assume (false);
}

procedure {:inline 1} func_48();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_48()
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
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg3);
    call func_60();
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_770;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc3);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_777;
    }
    call push(arg1);
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_776;
    }
    goto label$5_end_775;
label$7_end_777:
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call func_37();
    call loc3 := popArgs1();
    call push(arg1);
    call push(loc6);
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
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_775;
    }
label$6_end_776:
    call push(loc3);
    call push(loc5);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call push(loc1);
    call fimport_5();
    call pop();
label$5_end_775:
    call push(loc3);
    call push(loc1);
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_780;
    }
    call push(10.0);
    call loc1 := popArgs1();
    call push(10.0);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_779;
    }
    goto label$3_end_769;
label$9_end_780:
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_769;
    }
label$8_end_779:
    call push(arg1);
    call push(loc1);
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
    call push(arg2);
    call push(0.0);
    call push(loc2);
    call push(arg3);
    call func_43();
    goto label$2_end_768;
label$4_end_770:
    call fimport_17();
    assume (false);
label$3_end_769:
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_768;
    }
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call push(loc2);
    call fimport_5();
    call pop();
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_767;
    }
    call push(arg1);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    goto func_exit_787;
label$2_end_768:
    goto func_exit_787;
label$1_end_767:
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
func_exit_787:
}

procedure {:inline 1} func_49();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_49()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call fimport_17();
    assume (false);
}

procedure {:inline 1} func_50();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_50()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call fimport_17();
    assume (false);
}

procedure {:inline 1} func_51();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_51()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call fimport_17();
    assume (false);
}

procedure {:inline 1} func_52();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_52()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(9024.0);
}

procedure {:inline 1} func_53();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_53()
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

procedure {:inline 1} popDiscard4();
modifies $sp;
requires(($sp) >= (4));
ensures(($sp) == ((old($sp)) - (4)));
ensures((0) <= ($sp));
implementation popDiscard4()
{
    $sp := ($sp) - (4);
}

procedure {:inline 1} func_54();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_54()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (74);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (74);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_789;
    }
    call push(arg1);
    call push(0.0);
    call push(0.0);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call pop();
label$1_end_789:
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(28.0);
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_790;
    }
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(27.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call push(31.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_s($tmp2, $tmp1));
    goto func_exit_794;
label$2_end_790:
    call push(arg1);
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(-1.0);
func_exit_794:
}

procedure {:inline 1} func_55();
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
implementation func_55()
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
    call push(global_0);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(-1.0);
    call loc2 := popArgs1();
    call push(arg1);
    call func_54();
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_796;
    }
    call push(arg1);
    call push(loc1);
    call push(15.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1.0);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popDiscard4();
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_796;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (15);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$1_end_796:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc2);
}

procedure {:inline 1} func_56();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_56()
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
    call push(arg1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_800;
    }
    call push(loc3);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_800;
    }
    call push(arg1);
    call push(loc2);
    call push(arg2);
    // // wrap: no-op under real semantics
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_801;
label$1_end_800:
    call push(arg1);
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
func_exit_801:
}

procedure {:inline 1} func_57();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_57()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_807;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_806;
    }
label$6_end_807:
    call push(arg1);
    call func_55();
    call loc2 := popArgs1();
    call push(loc2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_806;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_810;
    }
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc3);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_805;
    }
label$7_end_810:
    call push(arg1);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_804;
    }
    goto label$2_end_803;
label$5_end_806:
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(-1.0);
    goto func_exit_815;
label$4_end_805:
    call push(arg1);
    call push(loc4);
    call push(loc1);
    // // wrap: no-op under real semantics
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_803;
    }
label$3_end_804:
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$1_end_802;
label$2_end_803:
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_802:
    call push(loc2);
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_817;
    }
    call push(arg1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
label$8_end_817:
    call push(loc2);
func_exit_815:
}

procedure {:inline 1} func_58();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_58()
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
    var loc7: real;
    var loc8: real;
    var loc9: real;
    var loc10: real;
    var loc11: real;
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
    loc7 := 0.0;
    loc8 := 0.0;
    loc9 := 0.0;
    loc10 := 0.0;
    loc11 := 0.0;
    call push(arg2);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_835;
    }
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_835;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$18_start_836:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_end_839;
    }
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(loc3);
    call push(-9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_838;
    }
    goto label$18_start_836;
label$20_end_839:
    call push(loc2);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(-9.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_start_836;
    }
label$19_end_838:
    call push(loc3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_start_836;
    }
    call push(loc3);
    call push(45.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_843;
    }
    call push(loc3);
    call push(43.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_end_834;
    }
label$21_end_843:
    call push(-1.0);
    call push(0.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc4 := popArgs1();
    call push(arg1);
    call push(4.0);
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
    call push(loc3);
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_833;
    }
    call push(loc2);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_831;
    }
    goto label$14_end_832;
label$17_end_835:
    call func_52();
    call push(22.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    goto func_exit_848;
label$16_end_834:
    call push(0.0);
    call loc4 := popArgs1();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_832;
    }
    goto label$13_end_831;
label$15_end_833:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_831;
    }
label$14_end_832:
    call push(loc3);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_831;
    }
    call push(arg1);
    call push(4.0);
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
    call push(loc3);
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_830;
    }
    call push(loc2);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$11_end_829;
label$13_end_831:
    call push(arg2);
    call push(10.0);
    call push(arg2);
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
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_828;
    }
    call push(arg1);
    call push(104.0);
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
        goto label$22_end_852;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$22_end_852:
    call push(arg1);
    call push(0.0);
    call func_56();
    call func_52();
    call push(22.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    goto func_exit_848;
label$12_end_830:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
label$11_end_829:
    call push(loc3);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$23_end_855;
    }
    call push(arg1);
    call push(4.0);
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
    call push(loc3);
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_827;
    }
    call push(loc2);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$8_end_826;
label$23_end_855:
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_825;
    }
label$10_end_828:
    call push(arg2);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_824;
    }
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc3);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_820;
    }
    call push(0.0);
    call loc2 := popArgs1();
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
label$25_start_860:
    call push(loc2);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$27_end_863;
    }
    call push(arg3);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$26_end_862;
    }
    goto label$24_end_859;
label$27_end_863:
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(loc3);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$24_end_859;
    }
label$26_end_862:
    call push(loc2);
    call push(429496736.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$25_start_860;
    }
label$24_end_859:
    call push(loc2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc1);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_820;
    }
    call push(10.0);
    call arg2 := popArgs1();
    call push(loc5);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc1);
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call loc8 := popArgs1();
    call push(loc8);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$28_start_871:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$30_end_874;
    }
    call push(loc1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$29_end_873;
    }
    goto label$4_end_822;
label$30_end_874:
    call push(loc7);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(loc3);
    call push(-48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_822;
    }
label$29_end_873:
    call push(loc5);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_822;
    }
    call push(loc5);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc2);
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call loc8 := popArgs1();
    call push(loc8);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$28_start_871;
    }
    goto label$3_end_821;
label$9_end_827:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
label$8_end_826:
    call push(16.0);
    call arg2 := popArgs1();
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_824;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$31_end_882;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$31_end_882:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_823;
    }
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_819;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    goto func_exit_848;
label$7_end_825:
    call push(8.0);
    call arg2 := popArgs1();
label$6_end_824:
    call push(arg2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$32_end_887;
    }
    call push(0.0);
    call loc5 := popArgs1();
    call push(arg2);
    call push(loc3);
    call push(17537.0);
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
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$33_end_888;
    }
    call push(0.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
label$35_start_891:
    call push(loc2);
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$37_end_894;
    }
    call push(arg3);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(119304648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$36_end_893;
    }
    goto label$34_end_890;
label$37_end_894:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(119304648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$34_end_890;
    }
label$36_end_893:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$35_start_891;
    }
label$34_end_890:
    call push(loc1);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc5 := popArgs1();
label$33_end_888:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(loc5);
    call push(-1.0);
    call push(arg2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) / ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$38_start_900:
    call push(loc5);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$40_end_905;
    }
    call push(loc1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$39_end_904;
label$40_end_905:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
label$39_end_904:
    call push(loc7);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg2);
    call push(loc3);
    call push(17537.0);
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
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(loc5);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$38_start_900;
    }
    goto label$3_end_821;
label$32_end_887:
    call push(arg2);
    call push(23.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(17793.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s8(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call push(arg2);
    call push(loc3);
    call push(17537.0);
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
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$41_end_908;
    }
    call push(0.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
label$43_start_911:
    call push(loc2);
    call push(loc1);
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc1 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc11);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$45_end_914;
    }
    call push(arg3);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(134217728.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$44_end_913;
    }
    goto label$42_end_910;
label$45_end_914:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(134217728.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$42_end_910;
    }
label$44_end_913:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$43_start_911;
    }
label$42_end_910:
    call push(loc1);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc5 := popArgs1();
label$41_end_908:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(-1.0);
    call push(loc6);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$46_start_920:
    call push(loc5);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc2);
    // // numeric cast i64.extend_i32_u: no-op under real semantics
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$48_end_923;
    }
    call push(loc1);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    goto label$47_end_922;
label$48_end_923:
    call push(arg1);
    call func_57();
    call loc3 := popArgs1();
label$47_end_922:
    call push(loc5);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(arg2);
    call push(loc3);
    call push(17537.0);
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
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_821;
    }
    call push(loc5);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$46_start_920;
    }
    goto label$3_end_821;
label$5_end_823:
    call push(arg1);
    call push(0.0);
    call func_56();
    call push(0.0);
    goto func_exit_848;
label$4_end_822:
    call push(loc2);
    call push(9.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_820;
    }
label$3_end_821:
    call push(arg2);
    call push(loc3);
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_820;
    }
    call push(arg1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$50_start_928:
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$51_end_930;
    }
    call push(loc2);
    call push(loc3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$50_start_928;
    }
    goto label$49_end_927;
label$51_end_930:
    call push(arg2);
    call push(arg1);
    call func_57();
    call push(17537.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$50_start_928;
    }
label$49_end_927:
    call func_52();
    call push(34.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(0.0);
    call push(arg4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc4 := popArgs1();
    call push(arg4);
    call loc5 := popArgs1();
label$2_end_820:
    call push(arg1);
    call push(104.0);
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
        goto label$52_end_932;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$52_end_932:
    call push(loc5);
    call push(arg4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$53_end_934;
    }
    call push(arg4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    // // wrap: no-op under real semantics
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$54_end_935;
    }
    call push(loc4);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$54_end_935;
    }
    call func_52();
    call push(34.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg4);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    goto func_exit_848;
label$54_end_935:
    call push(loc5);
    call push(arg4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$53_end_934;
    }
    call func_52();
    call push(34.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg4);
    goto func_exit_848;
label$53_end_934:
    call push(loc5);
    call push(loc4);
    // // numeric cast i64.extend_i32_s: no-op under real semantics
    call loc7 := popArgs1();
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
label$1_end_819:
    call push(loc5);
func_exit_848:
}

procedure {:inline 1} func_59();
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
implementation func_59()
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
    call push(global_0);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (76);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(-1.0);
    call push(arg1);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(0.0);
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
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call func_56();
    call push(loc1);
    call push(arg3);
    call push(1.0);
    call push(2147483647.0);
    call func_58();
    call loc2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_940;
    }
    call push(arg2);
    call push(arg1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_940:
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc2);
    // // wrap: no-op under real semantics
}

procedure {:inline 1} func_60();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_60()
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
    call loc1 := popArgs1();
    call push(arg1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_943;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_942;
    }
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$4_start_944:
    call push(loc1);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_943;
    }
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call loc1 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_944;
    }
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    goto func_exit_948;
label$3_end_943:
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$5_start_949:
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_xor($tmp2, $tmp1));
    call push(loc2);
    call push(-16843008.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-2139062144.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_949;
    }
    call push(loc2);
    call push(255.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_941;
    }
label$6_start_953:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (1);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call loc1 := popArgs1();
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_953;
    }
    call push(loc3);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    goto func_exit_948;
label$2_end_942:
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    goto func_exit_948;
label$1_end_941:
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
func_exit_948:
}

procedure {:inline 1} func_61();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_61()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(9040.0);
    call push(arg1);
    call func_62();
}

procedure {:inline 1} func_62();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_62()
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
        goto label$1_end_958;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8384);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_959;
    }
    call push(16.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(8384.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_959:
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8388);
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
        goto label$5_end_964;
    }
    call push(arg1);
    call push(loc3);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_966;
    }
    call push(arg1);
    call push(8196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_966;
    }
    call push(arg2);
    call push(8192.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$6_end_966:
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$7_start_968:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_970;
    }
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
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
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
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
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_963;
    }
label$8_end_970:
    call push(arg1);
    call func_63();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_968;
    }
label$5_end_964:
    call push(2147483647.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(8392.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg1);
    call push(8384.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8392);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call loc1 := popArgs1();
label$9_start_977:
    call push(arg1);
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(8200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(8192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(17441.0);
    call fimport_0();
    call push(arg2);
    call push(8196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
label$10_start_982:
    call push(loc9);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc11 := popArgs1();
    call push(loc11);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc12 := popArgs1();
    call push(loc12);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call arg2 := popArgs1();
    call push(loc12);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_986;
    }
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_987;
    }
label$13_start_988:
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_987;
    }
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_987;
    }
    call push(arg2);
    call push(loc3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_start_988;
    }
label$12_end_987:
    call push(loc11);
    call push(arg2);
    call push(loc2);
    call push(arg2);
    call push(loc2);
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
    call push(loc12);
    call push(-2147483648.0);
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
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_993;
    }
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$14_end_993:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_962;
    }
label$11_end_986:
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc10);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_982;
    }
    call push(0.0);
    call arg2 := popArgs1();
    call push(loc5);
    call push(0.0);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(loc1);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
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
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_977;
    }
label$4_end_963:
    call push(arg2);
    goto func_exit_998;
label$3_end_962:
    call push(loc11);
    call push(loc11);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    goto func_exit_998;
label$1_end_958:
    call push(0.0);
func_exit_998:
}

procedure {:inline 1} func_63();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_63()
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
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8388);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9032);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_1001;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    goto label$1_end_1000;
label$2_end_1001:
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(0.0);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9032);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(0.0);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_1000:
    call push(loc2);
    call loc3 := popArgs1();
    call push(loc2);
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_1006;
    }
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    idx := real_to_int($tmp1);
    call load_i := memory_grow(idx);
    call push(int_to_real(load_i));
    call pop();
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc4);
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_1005;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
label$6_end_1006:
    call push(0.0);
    call loc5 := popArgs1();
    call push(0.0);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_1005;
    }
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc4 := popArgs1();
    call push(loc2);
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(64512.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_1010;
    }
    call push(loc2);
    call push(65536.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    goto label$7_end_1009;
label$8_end_1010:
    call push(loc2);
    call push(131072.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(131071.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
label$7_end_1009:
    call push(arg1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc5);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9032);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_1012;
    }
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(0.0);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9032);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(0.0);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shl($tmp2, $tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$9_end_1012:
    call push(loc4);
    call push(8192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_1004;
    }
    call push(loc3);
    call loc6 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(65535.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_shr_u($tmp2, $tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_1014;
    }
    call push(loc5);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    idx := real_to_int($tmp1);
    call load_i := memory_grow(idx);
    call push(int_to_real(load_i));
    call pop();
    call push(loc5);
    call load_i := memory_size();
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_1004;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
label$10_end_1014:
    call push(0.0);
    call push(loc6);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9036);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_1004;
    }
    call push(arg1);
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call push(8196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_1003;
    }
    call push(loc5);
    call push(loc1);
    call push(8200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
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
        goto label$11_end_1021;
    }
    call push(loc6);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-4.0);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call push(loc4);
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
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$11_end_1021:
    call push(arg1);
    call push(8388.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(loc4);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(8192.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(8196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$5_end_1005:
    call push(loc5);
    goto func_exit_1030;
label$4_end_1004:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(arg1);
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(8200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_1031;
    }
    call push(loc3);
    call push(8196.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call push(-4.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bv_or($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$12_end_1031:
    call push(arg1);
    call push(arg1);
    call push(8388.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8384);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(0.0);
    goto func_exit_1030;
label$3_end_1003:
    call push(loc4);
    call push(loc5);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
func_exit_1030:
}

procedure {:inline 1} func_64();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $table;
modifies $table_size;
modifies $mem;
modifies $mem_pages;
implementation func_64()
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
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_1041;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (17424);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_1041;
    }
    call push(17232.0);
    call loc2 := popArgs1();
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(17232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$3_start_1043:
    call push(loc2);
    call push(4.0);
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
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_1041;
    }
    call push(loc1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_1046;
    }
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_1040;
    }
label$4_end_1046:
    call push(loc2);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_1043;
    }
label$2_end_1041:
    goto func_exit_1048;
label$1_end_1040:
    call push(arg1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bv_and($tmp2, $tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
func_exit_1048:
}

procedure {:inline 1} CorralChoice__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09();
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
implementation CorralChoice__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (104)));
    if ((c) == (0)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_0();
    } else if ((c) == (1)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_1();
    } else if ((c) == (2)) {
        call fimport_2();
        call popDiscard1();
    } else if ((c) == (3)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_3();
        call popDiscard1();
    } else if ((c) == (4)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_4();
        call popDiscard1();
    } else if ((c) == (5)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_5();
        call popDiscard1();
    } else if ((c) == (6)) {
        call fimport_6();
        call popDiscard1();
    } else if ((c) == (7)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_7();
    } else if ((c) == (8)) {
        call fimport_8();
        call popDiscard1();
    } else if ((c) == (9)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_9();
    } else if ((c) == (10)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_10();
        call popDiscard1();
    } else if ((c) == (11)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_11();
    } else if ((c) == (12)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_12();
    } else if ((c) == (13)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_13();
        call popDiscard1();
    } else if ((c) == (14)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_14();
    } else if ((c) == (15)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_15();
        call popDiscard1();
    } else if ((c) == (16)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_16();
    } else if ((c) == (17)) {
        call fimport_17();
    } else if ((c) == (18)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_18();
        call popDiscard1();
    } else if ((c) == (19)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_19();
        call popDiscard1();
    } else if ((c) == (20)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_20();
        call popDiscard1();
    } else if ((c) == (21)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_21();
        call popDiscard1();
    } else if ((c) == (22)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_22();
    } else if ((c) == (23)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_23();
    } else if ((c) == (24)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_24();
    } else if ((c) == (25)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_25();
        call popDiscard1();
    } else if ((c) == (26)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_26();
        call popDiscard1();
    } else if ((c) == (27)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_27();
    } else if ((c) == (28)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_28();
        call popDiscard1();
    } else if ((c) == (29)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_29();
    } else if ((c) == (30)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_30();
    } else if ((c) == (31)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_31();
    } else if ((c) == (32)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_32();
    } else if ((c) == (33)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_33();
        call popDiscard1();
    } else if ((c) == (34)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_34();
        call popDiscard1();
    } else if ((c) == (35)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_35();
        call popDiscard1();
    } else if ((c) == (36)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_36();
        call popDiscard1();
    } else if ((c) == (37)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_37();
    } else if ((c) == (38)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_38();
        call popDiscard1();
    } else if ((c) == (39)) {
        call func_0();
    } else if ((c) == (40)) {
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
    } else if ((c) == (41)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
    } else if ((c) == (42)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_3();
    } else if ((c) == (43)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_4();
        call popDiscard1();
    } else if ((c) == (44)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_5();
    } else if ((c) == (45)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_6();
        call popDiscard1();
    } else if ((c) == (46)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_7();
    } else if ((c) == (47)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_8();
    } else if ((c) == (48)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_9();
    } else if ((c) == (49)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_10();
        call popDiscard1();
    } else if ((c) == (50)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_11();
        call popDiscard1();
    } else if ((c) == (51)) {
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
        call func_12();
    } else if ((c) == (52)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_13();
    } else if ((c) == (53)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_14();
        call popDiscard1();
    } else if ((c) == (54)) {
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
        call func_15();
    } else if ((c) == (55)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_16();
    } else if ((c) == (56)) {
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
        call func_17();
        call popDiscard1();
    } else if ((c) == (57)) {
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
        call func_18();
    } else if ((c) == (58)) {
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
        call func_19();
    } else if ((c) == (59)) {
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
        call func_20();
    } else if ((c) == (60)) {
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
        call func_21();
    } else if ((c) == (61)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_22();
        call popDiscard1();
    } else if ((c) == (62)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_23();
    } else if ((c) == (63)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_24();
        call popDiscard1();
    } else if ((c) == (64)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_25();
        call popDiscard1();
    } else if ((c) == (65)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_26();
        call popDiscard1();
    } else if ((c) == (66)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_27();
        call popDiscard1();
    } else if ((c) == (67)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_28();
        call popDiscard1();
    } else if ((c) == (68)) {
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
    } else if ((c) == (69)) {
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
        call func_30();
    } else if ((c) == (70)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_31();
    } else if ((c) == (71)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_32();
        call popDiscard1();
    } else if ((c) == (72)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_33();
        call popDiscard1();
    } else if ((c) == (73)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_34();
        call popDiscard1();
    } else if ((c) == (74)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_35();
    } else if ((c) == (75)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_36();
        call popDiscard1();
    } else if ((c) == (76)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_37();
        call popDiscard1();
    } else if ((c) == (77)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_38();
        call popDiscard1();
    } else if ((c) == (78)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_39();
    } else if ((c) == (79)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_40();
    } else if ((c) == (80)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_41();
    } else if ((c) == (81)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_42();
        call popDiscard1();
    } else if ((c) == (82)) {
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_43();
    } else if ((c) == (83)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_44();
    } else if ((c) == (84)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_45();
        call popDiscard1();
    } else if ((c) == (85)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_46();
    } else if ((c) == (86)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_47();
    } else if ((c) == (87)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_48();
    } else if ((c) == (88)) {
        call func_49();
    } else if ((c) == (89)) {
        call func_50();
    } else if ((c) == (90)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_51();
    } else if ((c) == (91)) {
        call func_52();
        call popDiscard1();
    } else if ((c) == (92)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_53();
    } else if ((c) == (93)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_54();
        call popDiscard1();
    } else if ((c) == (94)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_55();
        call popDiscard1();
    } else if ((c) == (95)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_56();
    } else if ((c) == (96)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_57();
        call popDiscard1();
    } else if ((c) == (97)) {
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
        call func_58();
        call popDiscard1();
    } else if ((c) == (98)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_59();
        call popDiscard1();
    } else if ((c) == (99)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_60();
        call popDiscard1();
    } else if ((c) == (100)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_61();
        call popDiscard1();
    } else if ((c) == (101)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_62();
        call popDiscard1();
    } else if ((c) == (102)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_63();
        call popDiscard1();
    } else if ((c) == (103)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_64();
    }
}

procedure BoogieEntry__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09();
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
implementation BoogieEntry__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (104)));
        if ((c) == (0)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_0();
        } else if ((c) == (1)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_1();
        } else if ((c) == (2)) {
            call fimport_2();
            call popDiscard1();
        } else if ((c) == (3)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_3();
            call popDiscard1();
        } else if ((c) == (4)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_4();
            call popDiscard1();
        } else if ((c) == (5)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_5();
            call popDiscard1();
        } else if ((c) == (6)) {
            call fimport_6();
            call popDiscard1();
        } else if ((c) == (7)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_7();
        } else if ((c) == (8)) {
            call fimport_8();
            call popDiscard1();
        } else if ((c) == (9)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_9();
        } else if ((c) == (10)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_10();
            call popDiscard1();
        } else if ((c) == (11)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_11();
        } else if ((c) == (12)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_12();
        } else if ((c) == (13)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_13();
            call popDiscard1();
        } else if ((c) == (14)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_14();
        } else if ((c) == (15)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_15();
            call popDiscard1();
        } else if ((c) == (16)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_16();
        } else if ((c) == (17)) {
            call fimport_17();
        } else if ((c) == (18)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_18();
            call popDiscard1();
        } else if ((c) == (19)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_19();
            call popDiscard1();
        } else if ((c) == (20)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_20();
            call popDiscard1();
        } else if ((c) == (21)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_21();
            call popDiscard1();
        } else if ((c) == (22)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_22();
        } else if ((c) == (23)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_23();
        } else if ((c) == (24)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_24();
        } else if ((c) == (25)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_25();
            call popDiscard1();
        } else if ((c) == (26)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_26();
            call popDiscard1();
        } else if ((c) == (27)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_27();
        } else if ((c) == (28)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_28();
            call popDiscard1();
        } else if ((c) == (29)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_29();
        } else if ((c) == (30)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_30();
        } else if ((c) == (31)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_31();
        } else if ((c) == (32)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_32();
        } else if ((c) == (33)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_33();
            call popDiscard1();
        } else if ((c) == (34)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_34();
            call popDiscard1();
        } else if ((c) == (35)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_35();
            call popDiscard1();
        } else if ((c) == (36)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_36();
            call popDiscard1();
        } else if ((c) == (37)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_37();
        } else if ((c) == (38)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_38();
            call popDiscard1();
        } else if ((c) == (39)) {
            call func_0();
        } else if ((c) == (40)) {
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
        } else if ((c) == (41)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
        } else if ((c) == (42)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_3();
        } else if ((c) == (43)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_4();
            call popDiscard1();
        } else if ((c) == (44)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_5();
        } else if ((c) == (45)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_6();
            call popDiscard1();
        } else if ((c) == (46)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_7();
        } else if ((c) == (47)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_8();
        } else if ((c) == (48)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_9();
        } else if ((c) == (49)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_10();
            call popDiscard1();
        } else if ((c) == (50)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_11();
            call popDiscard1();
        } else if ((c) == (51)) {
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
            call func_12();
        } else if ((c) == (52)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_13();
        } else if ((c) == (53)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_14();
            call popDiscard1();
        } else if ((c) == (54)) {
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
            call func_15();
        } else if ((c) == (55)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_16();
        } else if ((c) == (56)) {
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
            call func_17();
            call popDiscard1();
        } else if ((c) == (57)) {
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
            call func_18();
        } else if ((c) == (58)) {
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
            call func_19();
        } else if ((c) == (59)) {
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
            call func_20();
        } else if ((c) == (60)) {
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
            call func_21();
        } else if ((c) == (61)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_22();
            call popDiscard1();
        } else if ((c) == (62)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_23();
        } else if ((c) == (63)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_24();
            call popDiscard1();
        } else if ((c) == (64)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_25();
            call popDiscard1();
        } else if ((c) == (65)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_26();
            call popDiscard1();
        } else if ((c) == (66)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_27();
            call popDiscard1();
        } else if ((c) == (67)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_28();
            call popDiscard1();
        } else if ((c) == (68)) {
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
        } else if ((c) == (69)) {
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
            call func_30();
        } else if ((c) == (70)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_31();
        } else if ((c) == (71)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_32();
            call popDiscard1();
        } else if ((c) == (72)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_33();
            call popDiscard1();
        } else if ((c) == (73)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_34();
            call popDiscard1();
        } else if ((c) == (74)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_35();
        } else if ((c) == (75)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_36();
            call popDiscard1();
        } else if ((c) == (76)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_37();
            call popDiscard1();
        } else if ((c) == (77)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_38();
            call popDiscard1();
        } else if ((c) == (78)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_39();
        } else if ((c) == (79)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_40();
        } else if ((c) == (80)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_41();
        } else if ((c) == (81)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_42();
            call popDiscard1();
        } else if ((c) == (82)) {
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_43();
        } else if ((c) == (83)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_44();
        } else if ((c) == (84)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_45();
            call popDiscard1();
        } else if ((c) == (85)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_46();
        } else if ((c) == (86)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_47();
        } else if ((c) == (87)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_48();
        } else if ((c) == (88)) {
            call func_49();
        } else if ((c) == (89)) {
            call func_50();
        } else if ((c) == (90)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_51();
        } else if ((c) == (91)) {
            call func_52();
            call popDiscard1();
        } else if ((c) == (92)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_53();
        } else if ((c) == (93)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_54();
            call popDiscard1();
        } else if ((c) == (94)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_55();
            call popDiscard1();
        } else if ((c) == (95)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_56();
        } else if ((c) == (96)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_57();
            call popDiscard1();
        } else if ((c) == (97)) {
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
            call func_58();
            call popDiscard1();
        } else if ((c) == (98)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_59();
            call popDiscard1();
        } else if ((c) == (99)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_60();
            call popDiscard1();
        } else if ((c) == (100)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_61();
            call popDiscard1();
        } else if ((c) == (101)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_62();
            call popDiscard1();
        } else if ((c) == (102)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_63();
            call popDiscard1();
        } else if ((c) == (103)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_64();
        }
    }
}

procedure CorralEntry__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09();
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
implementation CorralEntry__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__7571845d394181ccec8139895798368541aa10b02d2c814b7e5e774af6871c09();
    }
}

