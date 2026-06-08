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
const global_1: real;

axiom((global_1) == (9980.0));
const global_2: real;

axiom((global_2) == (9980.0));
procedure {:inline 1} initGlobals();
modifies global_0;
ensures((global_0) == (8192.0));
implementation initGlobals()
{
    global_0 := 8192.0;
}

procedure {:inline 1} require_auth2();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation require_auth2()
{
}

procedure {:inline 1} require_auth();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation require_auth()
{
}

procedure {:inline 1} eosio_assert();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation eosio_assert()
{
}

procedure {:inline 1} db_find_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_find_i64()
{
}

procedure {:inline 1} current_receiver();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation current_receiver()
{
}

procedure {:inline 1} db_store_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_store_i64()
{
}

procedure {:inline 1} db_update_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_update_i64()
{
}

procedure {:inline 1} memcpy();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation memcpy()
{
}

procedure {:inline 1} is_account();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation is_account()
{
}

procedure {:inline 1} require_recipient();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation require_recipient()
{
}

procedure {:inline 1} has_auth();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation has_auth()
{
}

procedure {:inline 1} db_next_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_next_i64()
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

procedure {:inline 1} db_get_i64();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation db_get_i64()
{
}

procedure {:inline 1} send_inline();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation send_inline()
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

procedure {:inline 1} current_time();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation current_time()
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
implementation fimport_2()
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

procedure {:inline 1} fimport_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_3()
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

procedure {:inline 1} fimport_4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_4()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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

procedure {:inline 1} fimport_5();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_5()
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

procedure {:inline 1} fimport_6();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_6()
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

procedure {:inline 1} fimport_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_7()
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

procedure {:inline 1} fimport_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_8()
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

procedure {:inline 1} fimport_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_9()
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

procedure {:inline 1} fimport_10();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_10()
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

procedure {:inline 1} fimport_11();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
implementation fimport_12()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} fimport_13();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
implementation fimport_14()
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

procedure {:inline 1} fimport_15();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_15()
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

procedure {:inline 1} fimport_16();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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

procedure {:inline 1} fimport_22();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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

procedure {:inline 1} fimport_39();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation fimport_39()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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
}

procedure {:inline 1} func_1();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
    var loc9: real;
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
    call push(global_0);
    call push(128.0);
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
    call fimport_1();
    call push(0.0);
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$3_start_5:
    // // unhandled raw instruction: i32.shl
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
        goto label$2_end_4;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_7;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call loc8 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_5;
    }
    goto label$1_end_3;
label$4_end_7:
    call push(loc6);
    call loc5 := popArgs1();
label$5_start_9:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_4;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_9;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_5;
    }
    goto label$1_end_3;
label$2_end_4:
    call push(0.0);
    call loc7 := popArgs1();
label$1_end_3:
    call push(loc7);
    call push(8192.0);
    call fimport_2();
    call push(0.0);
    call loc7 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_12;
    }
    call push(0.0);
    call loc2 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$8_start_15:
    // // unhandled raw instruction: i32.shl
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
        goto label$7_end_14;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_17;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call loc8 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_15;
    }
    goto label$6_end_12;
label$9_end_17:
    call push(loc6);
    call loc5 := popArgs1();
label$10_start_19:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_14;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_19;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_15;
    }
    goto label$6_end_12;
label$7_end_14:
    call push(0.0);
    call loc7 := popArgs1();
label$6_end_12:
    call push(loc7);
    call push(8212.0);
    call fimport_2();
    call push(loc9);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8313.0);
    call fimport_2();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(32.0);
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
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(loc4);
    call push(-2147483648.0);
    call push(loc4);
    call fimport_3();
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_24;
    }
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call func_2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
    call push(0.0);
    call loc2 := popArgs1();
    goto label$11_end_23;
label$12_end_24:
    call push(1.0);
    call loc2 := popArgs1();
label$11_end_23:
    call push(loc2);
    call push(8341.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9089.0);
    call fimport_2();
    call push(56.0);
    call func_37();
    call loc2 := popArgs1();
    call push(loc2);
    call func_3();
    call pop();
    call push(loc2);
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
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
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
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
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
    idx := (real_to_int($tmp1)) + (92);
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
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (116);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(104.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_4();
    call push(loc2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(loc6);
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call fimport_5();
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
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
        goto label$13_end_29;
    }
    call push(loc7);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$13_end_29:
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc1);
    call push(40.0);
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
        goto label$16_end_34;
    }
    call push(loc7);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc7);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
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
    idx := (real_to_int($tmp1)) + (112);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_33;
    }
    goto label$14_end_32;
label$16_end_34:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_5();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_32;
    }
label$15_end_33:
    call push(loc2);
    call func_39();
label$14_end_32:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_37;
    }
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_40;
    }
label$20_start_43:
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
    call loc7 := popArgs1();
    call push(loc2);
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
        goto label$21_end_46;
    }
    call push(loc7);
    call func_39();
label$21_end_46:
    call push(loc8);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$20_start_43;
    }
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    goto label$18_end_39;
label$19_end_40:
    call push(loc8);
    call loc2 := popArgs1();
label$18_end_39:
    call push(arg3);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$17_end_37:
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_2()
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
        goto label$1_end_48;
    }
label$3_start_52:
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
        goto label$2_end_51;
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
        goto label$3_start_52;
    }
    goto label$1_end_48;
label$2_end_51:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_48;
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
    goto func_exit_56;
label$1_end_48:
    // // unhandled raw instruction: i32.xor
    call push(9012.0);
    call fimport_2();
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_58;
    }
    call push(loc4);
    call func_46();
    call loc3 := popArgs1();
    goto label$4_end_57;
label$5_end_58:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call global_0 := popArgs1();
label$4_end_57:
    call push(arg2);
    call push(loc3);
    call push(loc4);
    call fimport_14();
    call pop();
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_60;
    }
    call push(loc3);
    call func_49();
label$6_end_60:
    call push(56.0);
    call func_37();
    call loc4 := popArgs1();
    call push(loc4);
    call func_3();
    call pop();
    call push(loc4);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (36);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc4);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_29();
    call push(loc4);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
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
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
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
        goto label$9_end_65;
    }
    call push(loc3);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
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
    call push(loc3);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc3);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
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
    if (real_to_bool($tmp1)) {
        goto label$8_end_64;
    }
    goto label$7_end_63;
label$9_end_65:
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
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_5();
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
        goto label$7_end_63;
    }
label$8_end_64:
    call push(arg2);
    call func_39();
label$7_end_63:
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc4);
func_exit_56:
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
    call push(arg1);
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call loc1 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
label$3_start_70:
    // // unhandled raw instruction: i32.shl
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
        goto label$2_end_69;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_72;
    }
    call push(loc3);
    call loc1 := popArgs1();
    call push(1.0);
    call loc4 := popArgs1();
    call push(loc2);
    call loc5 := popArgs1();
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc5);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_70;
    }
    goto label$1_end_68;
label$4_end_72:
    call push(loc3);
    call loc1 := popArgs1();
label$5_start_74:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_69;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc1 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc4 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call loc2 := popArgs1();
    call push(loc4);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_74;
    }
    call push(1.0);
    call loc4 := popArgs1();
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc5);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_70;
    }
    goto label$1_end_68;
label$2_end_69:
    call push(0.0);
    call loc4 := popArgs1();
label$1_end_68:
    call push(loc4);
    call push(8192.0);
    call fimport_2();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call loc1 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
label$8_start_80:
    // // unhandled raw instruction: i32.shl
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
        goto label$6_end_78;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_83;
    }
    call push(loc3);
    call loc1 := popArgs1();
    call push(1.0);
    call loc6 := popArgs1();
    call push(loc2);
    call loc4 := popArgs1();
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc4);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_80;
    }
    goto label$9_end_82;
label$10_end_83:
    call push(loc3);
    call loc1 := popArgs1();
label$11_start_85:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_79;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc1 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc4 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call loc2 := popArgs1();
    call push(loc4);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_85;
    }
    call push(1.0);
    call loc6 := popArgs1();
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc5);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_80;
    }
label$9_end_82:
    call push(loc6);
    call push(8192.0);
    call fimport_2();
    call push(arg1);
    goto func_exit_89;
label$7_end_79:
    call push(0.0);
    call push(8192.0);
    call fimport_2();
    call push(arg1);
    goto func_exit_89;
label$6_end_78:
    call push(0.0);
    call push(8192.0);
    call fimport_2();
    call push(arg1);
func_exit_89:
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call push(8.0);
    call fimport_7();
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
        goto label$2_end_97;
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
        goto label$4_end_102;
    }
    call push(loc3);
    // // unhandled raw instruction: i32.shl
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
        goto label$3_end_101;
    }
label$4_end_102:
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call func_37();
    call loc1 := popArgs1();
    goto label$1_end_96;
label$3_end_101:
    call push(0.0);
    call loc4 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$1_end_96;
label$2_end_97:
    call push(arg1);
    call func_44();
    assume (false);
label$1_end_96:
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
        goto label$6_end_109;
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
label$7_start_112:
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
        goto label$7_start_112;
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
    goto label$5_end_108;
label$6_end_109:
    call push(loc4);
    call arg3 := popArgs1();
label$5_end_108:
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
        goto label$8_end_115;
    }
label$9_start_116:
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
        goto label$10_end_119;
    }
    call push(arg2);
    call func_39();
label$10_end_119:
    call push(arg3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_116;
    }
label$8_end_115:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_120;
    }
    call push(arg3);
    call func_39();
label$11_end_120:
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
    call push(global_0);
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$3_start_125:
    // // unhandled raw instruction: i32.shl
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
        goto label$2_end_124;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_127;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call loc8 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_125;
    }
    goto label$1_end_123;
label$4_end_127:
    call push(loc6);
    call loc5 := popArgs1();
label$5_start_129:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_124;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_129;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_125;
    }
    goto label$1_end_123;
label$2_end_124:
    call push(0.0);
    call loc7 := popArgs1();
label$1_end_123:
    call push(loc7);
    call push(8192.0);
    call fimport_2();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_133;
    }
    // // unhandled raw instruction: i32.shr_u
    call loc2 := popArgs1();
    goto label$6_end_132;
label$7_end_133:
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$6_end_132:
    call push(loc2);
    call push(257.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(8374.0);
    call fimport_2();
    call push(0.0);
    call loc7 := popArgs1();
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(32.0);
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
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (104);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc8 := popArgs1();
    call push(loc5);
    call push(loc4);
    call push(-2147483648.0);
    call push(loc4);
    call fimport_3();
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_135;
    }
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call func_2();
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
label$8_end_135:
    call push(loc8);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8403.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_1();
    call push(loc8);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_138;
    }
    call push(0.0);
    call loc2 := popArgs1();
label$11_start_141:
    // // unhandled raw instruction: i32.shl
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
        goto label$10_end_140;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_143;
    }
    call push(loc6);
    call loc4 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call loc10 := popArgs1();
    call push(loc10);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc10);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_141;
    }
    goto label$9_end_138;
label$12_end_143:
    call push(loc6);
    call loc4 := popArgs1();
label$13_start_145:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_140;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_start_145;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc10);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc10);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_141;
    }
    goto label$9_end_138;
label$10_end_140:
    call push(0.0);
    call loc7 := popArgs1();
label$9_end_138:
    call push(loc7);
    call push(8463.0);
    call fimport_2();
    call push(loc5);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8480.0);
    call fimport_2();
    call push(loc3);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8509.0);
    call fimport_2();
    call push(loc5);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call push(8535.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9146.0);
    call fimport_2();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9192.0);
    call fimport_2();
    call push(loc3);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9302.0);
    call fimport_2();
    call push(loc8);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc5);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9345.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(9364.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    // // unhandled raw instruction: i64.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9243.0);
    call fimport_2();
    call push(loc1);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (192);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (188);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (184);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(184.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (200);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc8);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (212);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (208);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (216);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(200.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_4();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(0.0);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call fimport_6();
    call push(loc5);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_151;
    }
    call push(loc2);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$14_end_151:
    call push(loc1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc5);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call func_7();
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_154;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(6.0);
    call loc5 := popArgs1();
label$16_start_156:
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(13.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$16_start_156;
    }
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
    call push(arg3);
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
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg4);
    call func_42();
    call pop();
    call push(16.0);
    call func_37();
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(2147483647.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc7);
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
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc7);
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
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (208);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (216);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (212);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (128);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (136);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (160);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(-2147483648.0);
    call push(loc1);
    call push(208.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(128.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_8();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_164;
    }
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$17_end_164:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (208);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_end_165;
    }
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (212);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$18_end_165:
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_154;
    }
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$15_end_154:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (112);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$19_end_167;
    }
    call push(loc1);
    call push(116.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$21_end_170;
    }
label$22_start_173:
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
    call loc7 := popArgs1();
    call push(loc2);
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
        goto label$23_end_176;
    }
    call push(loc7);
    call func_39();
label$23_end_176:
    call push(loc8);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$22_start_173;
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
    call loc2 := popArgs1();
    goto label$20_end_169;
label$21_end_170:
    call push(loc8);
    call loc2 := popArgs1();
label$20_end_169:
    call push(loc10);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$19_end_167:
    call push(loc1);
    call push(224.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_7();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_7()
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
    call push(global_0);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(32.0);
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
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc3);
    call push(arg2);
    call push(2147483647.0);
    // // unhandled raw instruction: i64.shr_u
    call fimport_3();
    call arg1 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_182;
    }
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call func_9();
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
    call push(1.0);
    call push(9473.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9146.0);
    call fimport_2();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9192.0);
    call fimport_2();
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9302.0);
    call fimport_2();
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc4);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9345.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(9364.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call arg2 := popArgs1();
    call push(arg2);
    // // unhandled raw instruction: i64.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9243.0);
    call fimport_2();
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(8.0);
    call fimport_7();
    call pop();
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    // // unhandled raw instruction: i32.or
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(0.0);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call fimport_6();
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_181;
    }
    call push(loc2);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_180;
    }
    goto label$1_end_179;
label$4_end_182:
    call push(loc3);
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9089.0);
    call fimport_2();
    call push(32.0);
    call func_37();
    call loc6 := popArgs1();
    call push(loc6);
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc6);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(5459781.0);
    call arg2 := popArgs1();
label$6_start_192:
    call push(0.0);
    call loc8 := popArgs1();
    // // unhandled raw instruction: i32.shl
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
        goto label$5_end_191;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_194;
    }
    call push(loc4);
    call arg2 := popArgs1();
    call push(1.0);
    call loc8 := popArgs1();
    call push(loc2);
    call arg1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_192;
    }
    goto label$5_end_191;
label$7_end_194:
    call push(loc4);
    call arg2 := popArgs1();
label$8_start_196:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_191;
    }
    // // unhandled raw instruction: i64.shr_u
    call arg2 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call arg1 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_196;
    }
    call push(1.0);
    call loc8 := popArgs1();
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc5);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_192;
    }
label$5_end_191:
    call push(loc8);
    call push(8192.0);
    call fimport_2();
    call push(loc6);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg3);
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
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
    call push(8.0);
    call fimport_7();
    call pop();
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    // // unhandled raw instruction: i32.or
    call push(loc7);
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc6);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(arg4);
    // // unhandled raw instruction: i64.shr_u
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call fimport_5();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg2);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
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
        goto label$9_end_202;
    }
    call push(loc5);
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$9_end_202:
    call push(loc1);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    // // unhandled raw instruction: i64.shr_u
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc1);
    call push(40.0);
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
        goto label$11_end_206;
    }
    call push(loc2);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc6);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(loc2);
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
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_205;
    }
    goto label$3_end_181;
label$11_end_206:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_10();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_181;
    }
label$10_end_205:
    call push(loc2);
    call func_39();
label$3_end_181:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_179;
    }
label$2_end_180:
    call push(loc1);
    call push(36.0);
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
    call push(loc2);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_211;
    }
label$14_start_214:
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
    call arg1 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_217;
    }
    call push(arg1);
    call func_39();
label$15_end_217:
    call push(loc5);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_start_214;
    }
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    goto label$12_end_210;
label$13_end_211:
    call push(loc5);
    call loc2 := popArgs1();
label$12_end_210:
    call push(loc6);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$1_end_179:
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_8();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_8()
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
    call push(global_0);
    call push(96.0);
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
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_220;
    }
    // // unhandled raw instruction: i32.shr_s
    call loc2 := popArgs1();
    call push(loc2);
    call push(268435456.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_219;
    }
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call func_37();
    call loc4 := popArgs1();
    call push(loc4);
    // // unhandled raw instruction: i32.shl
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
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_225;
    }
    call push(loc4);
    call push(loc3);
    call push(arg3);
    call fimport_7();
    call pop();
    call push(loc1);
    call push(loc4);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto label$2_end_220;
label$3_end_225:
    call push(loc4);
    call loc3 := popArgs1();
label$2_end_220:
    call push(loc1);
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
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
    call push(loc2);
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
    call push(($tmp2) + ($tmp1));
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
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg4);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shr_u
    // // unhandled raw instruction: i32.and
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
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call arg1 := popArgs1();
    call push(loc1);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
label$4_start_230:
    call push(loc4);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call arg1 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_230;
    }
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_234;
    }
    call push(arg3);
    call push(loc4);
    call func_30();
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(loc1);
    call push(52.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    goto label$5_end_233;
label$6_end_234:
    call push(0.0);
    call arg3 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$5_end_233:
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (84);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(arg4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_31();
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_32();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (84);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call fimport_15();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_236;
    }
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (84);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call func_39();
label$7_end_236:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_238;
    }
    call push(loc1);
    call push(56.0);
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
label$8_end_238:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_240;
    }
    call push(loc1);
    call push(44.0);
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
label$9_end_240:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_242;
    }
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (12);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call func_39();
label$10_end_242:
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_244;
label$1_end_219:
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_44();
    assume (false);
func_exit_244:
}

procedure {:inline 1} func_9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_9()
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
        goto label$1_end_246;
    }
label$3_start_250:
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
        goto label$2_end_249;
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
        goto label$3_start_250;
    }
    goto label$1_end_246;
label$2_end_249:
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_246;
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
    goto func_exit_254;
label$1_end_246:
    // // unhandled raw instruction: i32.xor
    call push(9012.0);
    call fimport_2();
    call push(loc5);
    call push(512.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_256;
    }
    call push(arg2);
    call push(loc5);
    call func_46();
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc5);
    call fimport_14();
    call pop();
    call push(loc6);
    call func_49();
    goto label$4_end_255;
label$5_end_256:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call global_0 := popArgs1();
    call push(arg2);
    call push(loc6);
    call push(loc5);
    call fimport_14();
    call pop();
label$4_end_255:
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(32.0);
    call func_37();
    call loc8 := popArgs1();
    call push(loc8);
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc8);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(loc8);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(5459781.0);
    call loc10 := popArgs1();
    call push(0.0);
    call loc4 := popArgs1();
label$8_start_262:
    // // unhandled raw instruction: i32.shl
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
        goto label$7_end_261;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc11 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_264;
    }
    call push(loc11);
    call loc10 := popArgs1();
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
        goto label$8_start_262;
    }
    goto label$6_end_260;
label$9_end_264:
    call push(loc11);
    call loc10 := popArgs1();
label$10_start_266:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_261;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc10 := popArgs1();
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
        goto label$10_start_266;
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
        goto label$8_start_262;
    }
    goto label$6_end_260;
label$7_end_261:
    call push(0.0);
    call loc3 := popArgs1();
label$6_end_260:
    call push(loc3);
    call push(8192.0);
    call fimport_2();
    call push(loc8);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc5);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc8);
    call push(loc6);
    call push(8.0);
    call fimport_7();
    call pop();
    // // unhandled raw instruction: i32.and
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc9);
    call push(loc6);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc8);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
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
    // // unhandled raw instruction: i64.shr_u
    call loc10 := popArgs1();
    call push(loc10);
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
        goto label$13_end_272;
    }
    call push(loc4);
    call push(loc10);
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
    if (real_to_bool($tmp1)) {
        goto label$12_end_271;
    }
    goto label$11_end_270;
label$13_end_272:
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
    call func_10();
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
        goto label$11_end_270;
    }
label$12_end_271:
    call push(loc4);
    call func_39();
label$11_end_270:
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(loc8);
func_exit_254:
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
        goto label$2_end_276;
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
        goto label$4_end_281;
    }
    call push(loc3);
    // // unhandled raw instruction: i32.shl
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
        goto label$3_end_280;
    }
label$4_end_281:
    call push(loc4);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call func_37();
    call loc1 := popArgs1();
    goto label$1_end_275;
label$3_end_280:
    call push(0.0);
    call loc4 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$1_end_275;
label$2_end_276:
    call push(arg1);
    call func_44();
    assume (false);
label$1_end_275:
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
        goto label$6_end_288;
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
label$7_start_291:
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
        goto label$7_start_291;
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
    goto label$5_end_287;
label$6_end_288:
    call push(loc4);
    call arg3 := popArgs1();
label$5_end_287:
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
        goto label$8_end_294;
    }
label$9_start_295:
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
        goto label$10_end_298;
    }
    call push(arg2);
    call func_39();
label$10_end_298:
    call push(arg3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_start_295;
    }
label$8_end_294:
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_299;
    }
    call push(arg3);
    call func_39();
label$11_end_299:
}

procedure {:inline 1} func_11();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_11()
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
    call push(global_0);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(0.0);
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$3_start_304:
    // // unhandled raw instruction: i32.shl
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
        goto label$2_end_303;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_306;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call loc8 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_304;
    }
    goto label$1_end_302;
label$4_end_306:
    call push(loc6);
    call loc5 := popArgs1();
label$5_start_308:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_303;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc8 := popArgs1();
    call push(loc8);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_308;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc8);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc8);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_304;
    }
    goto label$1_end_302;
label$2_end_303:
    call push(0.0);
    call loc7 := popArgs1();
label$1_end_302:
    call push(loc7);
    call push(8192.0);
    call fimport_2();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_312;
    }
    // // unhandled raw instruction: i32.shr_u
    call loc2 := popArgs1();
    goto label$6_end_311;
label$7_end_312:
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
label$6_end_311:
    call push(loc2);
    call push(257.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(8374.0);
    call fimport_2();
    call push(0.0);
    call loc7 := popArgs1();
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(32.0);
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
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call loc8 := popArgs1();
    call push(loc5);
    call push(loc4);
    call push(-2147483648.0);
    call push(loc4);
    call fimport_3();
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_314;
    }
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call func_2();
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
label$8_end_314:
    call push(loc8);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8569.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_1();
    call push(loc8);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_317;
    }
    call push(0.0);
    call loc2 := popArgs1();
label$11_start_320:
    // // unhandled raw instruction: i32.shl
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
        goto label$10_end_319;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_322;
    }
    call push(loc5);
    call loc4 := popArgs1();
    call push(1.0);
    call loc7 := popArgs1();
    call push(loc2);
    call arg3 := popArgs1();
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg3);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_320;
    }
    goto label$9_end_317;
label$12_end_322:
    call push(loc5);
    call loc4 := popArgs1();
label$13_start_324:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_319;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc7 := popArgs1();
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call loc2 := popArgs1();
    call push(loc7);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_start_324;
    }
    call push(1.0);
    call loc7 := popArgs1();
    call push(arg3);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg3);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_320;
    }
    goto label$9_end_317;
label$10_end_319:
    call push(0.0);
    call loc7 := popArgs1();
label$9_end_317:
    call push(loc7);
    call push(8463.0);
    call fimport_2();
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8602.0);
    call fimport_2();
    call push(loc3);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8509.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9146.0);
    call fimport_2();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9192.0);
    call fimport_2();
    call push(loc3);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9382.0);
    call fimport_2();
    call push(loc8);
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc4);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9430.0);
    call fimport_2();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(9452.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    // // unhandled raw instruction: i64.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9243.0);
    call fimport_2();
    call push(loc1);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (128);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (124);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (120);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call push(120.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (136);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc8);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (148);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (144);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (152);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(144.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(136.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_4();
    call push(loc8);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(0.0);
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(40.0);
    call fimport_6();
    call push(loc5);
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_330;
    }
    call push(loc2);
    call push(loc5);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$14_end_330:
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc9);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(loc6);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_12();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$15_end_333;
    }
    call push(loc1);
    call push(68.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg3 := popArgs1();
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$17_end_336;
    }
label$18_start_339:
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
    call loc7 := popArgs1();
    call push(loc2);
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
        goto label$19_end_342;
    }
    call push(loc7);
    call func_39();
label$19_end_342:
    call push(loc8);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$18_start_339;
    }
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    goto label$16_end_335;
label$17_end_336:
    call push(loc8);
    call loc2 := popArgs1();
label$16_end_335:
    call push(arg3);
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$15_end_333:
    call push(loc1);
    call push(160.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_12();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_12()
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
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
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
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
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
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i64.shr_u
    call push(8733.0);
    call func_13();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call push(8757.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9146.0);
    call fimport_2();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9192.0);
    call fimport_2();
    call push(loc2);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9382.0);
    call fimport_2();
    call push(arg1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9430.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(9452.0);
    call fimport_2();
    // // unhandled raw instruction: i64.shr_u
    call loc2 := popArgs1();
    call push(loc2);
    // // unhandled raw instruction: i64.shr_u
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9243.0);
    call fimport_2();
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg1);
    call push(8.0);
    call fimport_7();
    call pop();
    call push(1.0);
    call push(9140.0);
    call fimport_2();
    // // unhandled raw instruction: i32.or
    call push(arg1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call fimport_6();
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_349;
    }
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
label$1_end_349:
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_350;
    }
    call push(loc1);
    call push(36.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_353;
    }
label$5_start_356:
    call push(arg1);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg3 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_359;
    }
    call push(arg3);
    call func_39();
label$6_end_359:
    call push(loc5);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_356;
    }
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    goto label$3_end_352;
label$4_end_353:
    call push(loc5);
    call arg1 := popArgs1();
label$3_end_352:
    call push(loc6);
    call push(loc5);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call func_39();
label$2_end_350:
    call push(loc1);
    call push(64.0);
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
modifies $mem;
implementation func_13()
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
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
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_360;
    }
label$3_start_364:
    // // unhandled raw instruction: i64.shr_u
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_363;
    }
    call push(loc3);
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_364;
    }
    goto label$1_end_360;
label$2_end_363:
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_360;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
    call push(loc4);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(arg3);
    call fimport_2();
    call push(loc4);
    goto func_exit_367;
label$1_end_360:
    call push(0.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(2147483647.0);
    call push(arg2);
    call fimport_3();
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_368;
    }
    call push(arg1);
    call push(loc2);
    call func_9();
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
label$4_end_368:
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(arg3);
    call fimport_2();
    call push(loc3);
func_exit_367:
}

procedure {:inline 1} func_14();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_14()
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
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(arg2);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(8632.0);
    call fimport_2();
    call push(arg2);
    call fimport_1();
    call push(arg3);
    call fimport_8();
    call push(8656.0);
    call fimport_2();
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call push(loc1);
    call push(104.0);
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
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(72.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call push(8682.0);
    call func_15();
    call loc5 := popArgs1();
    call push(arg2);
    call fimport_9();
    call push(arg3);
    call fimport_9();
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    call push(loc6);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_373;
    }
    call push(0.0);
    call loc7 := popArgs1();
label$3_start_376:
    // // unhandled raw instruction: i32.shl
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
        goto label$2_end_375;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc8 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_378;
    }
    call push(loc8);
    call loc4 := popArgs1();
    call push(1.0);
    call loc3 := popArgs1();
    call push(loc7);
    call loc9 := popArgs1();
    call push(loc9);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc9);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_376;
    }
    goto label$1_end_373;
label$4_end_378:
    call push(loc8);
    call loc4 := popArgs1();
label$5_start_380:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_375;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc4 := popArgs1();
    call push(loc7);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc3 := popArgs1();
    call push(loc7);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc9 := popArgs1();
    call push(loc9);
    call loc7 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_380;
    }
    call push(1.0);
    call loc3 := popArgs1();
    call push(loc9);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
    call push(loc9);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_376;
    }
    goto label$1_end_373;
label$2_end_375:
    call push(0.0);
    call loc3 := popArgs1();
label$1_end_373:
    call push(loc3);
    call push(8463.0);
    call fimport_2();
    call push(loc6);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(8701.0);
    call fimport_2();
    call push(loc2);
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8509.0);
    call fimport_2();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_384;
    }
    // // unhandled raw instruction: i32.shr_u
    call loc7 := popArgs1();
    goto label$6_end_383;
label$7_end_384:
    call push(arg5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
label$6_end_383:
    call push(loc7);
    call push(257.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(8374.0);
    call fimport_2();
    call push(arg3);
    call fimport_10();
    call loc7 := popArgs1();
    call push(loc1);
    call push(56.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg4);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg2);
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_12();
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc8);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call push(arg3);
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg3);
    call push(arg2);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call popToTmp3();
    if (real_to_bool($tmp1)) {
        call push($tmp3);
    } else {
        call push($tmp2);
    }
    call func_7();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (96);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_388;
    }
    call push(loc1);
    call push(100.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg4 := popArgs1();
    call push(arg4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call push(loc9);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_391;
    }
label$11_start_394:
    call push(loc7);
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
    call loc3 := popArgs1();
    call push(loc7);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_397;
    }
    call push(loc3);
    call func_39();
label$12_end_397:
    call push(loc9);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_start_394;
    }
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    goto label$9_end_390;
label$10_end_391:
    call push(loc9);
    call loc7 := popArgs1();
label$9_end_390:
    call push(arg4);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc7);
    call func_39();
label$8_end_388:
    call push(loc1);
    call push(112.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
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
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_398;
    }
label$3_start_402:
    // // unhandled raw instruction: i64.shr_u
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_401;
    }
    call push(loc3);
    call loc2 := popArgs1();
    call push(loc1);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_402;
    }
    goto label$1_end_398;
label$2_end_401:
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_398;
    }
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
    call push(loc4);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(arg3);
    call fimport_2();
    call push(loc4);
    goto func_exit_405;
label$1_end_398:
    call push(0.0);
    call loc3 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call push(-2147483648.0);
    call push(arg2);
    call fimport_3();
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_406;
    }
    call push(arg1);
    call push(loc2);
    call func_2();
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (40);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
label$4_end_406:
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(arg3);
    call fimport_2();
    call push(loc3);
func_exit_405:
}

procedure {:inline 1} func_16();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_16()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
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
    assume (($sp) >= (3));
    call arg1, arg2, arg3 := popArgs3();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    loc4 := 0.0;
    loc5 := 0.0;
    call push(global_0);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(32.0);
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
    call push(-1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(arg2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call arg1 := popArgs1();
    call push(loc2);
    call push(arg2);
    call push(2147483647.0);
    // // unhandled raw instruction: i64.shr_u
    call fimport_3();
    call loc3 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_411;
    }
    call push(loc1);
    call push(loc3);
    call func_9();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8961.0);
    call fimport_2();
label$1_end_411:
    call push(arg1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call loc3 := popArgs1();
    call push(loc3);
    call push(8775.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call push(8851.0);
    call fimport_2();
    call push(loc3);
    call push(9508.0);
    call fimport_2();
    call push(loc3);
    call push(9542.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call fimport_11();
    call loc3 := popArgs1();
    call push(loc3);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_415;
    }
    call push(loc1);
    call push(loc3);
    call func_9();
    call pop();
label$2_end_415:
    call push(loc1);
    call push(arg1);
    call func_17();
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_417;
    }
    call push(loc1);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    call push(arg1);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_420;
    }
label$6_start_423:
    call push(arg1);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_426;
    }
    call push(loc3);
    call func_39();
label$7_end_426:
    call push(loc4);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_423;
    }
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    goto label$4_end_419;
label$5_end_420:
    call push(loc4);
    call arg1 := popArgs1();
label$4_end_419:
    call push(loc5);
    call push(loc4);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(arg1);
    call func_39();
label$3_end_417:
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9572.0);
    call fimport_2();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call fimport_4();
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(9617.0);
    call fimport_2();
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
        goto label$1_end_428;
    }
    // // unhandled raw instruction: i64.xor
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_431;
    }
    call push(loc4);
    call loc2 := popArgs1();
    goto label$1_end_428;
label$2_end_431:
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
label$4_start_433:
    call push(loc6);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_432;
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
    // // unhandled raw instruction: i64.xor
    call push(256.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_start_433;
    }
    goto label$1_end_428;
label$3_end_432:
    call push(loc1);
    call loc2 := popArgs1();
label$1_end_428:
    call push(loc2);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9667.0);
    call fimport_2();
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
        goto label$7_end_438;
    }
    call push(loc2);
    call loc4 := popArgs1();
label$8_start_440:
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
        goto label$9_end_443;
    }
    call push(loc2);
    call func_39();
label$9_end_443:
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
        goto label$8_start_440;
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
        goto label$6_end_437;
    }
    goto label$5_end_436;
label$7_end_438:
    call push(loc2);
    call push(-24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc7 := popArgs1();
label$6_end_437:
label$10_start_446:
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
        goto label$11_end_449;
    }
    call push(loc4);
    call func_39();
label$11_end_449:
    call push(loc7);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_start_446;
    }
label$5_end_436:
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
    idx := (real_to_int($tmp1)) + (20);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call fimport_16();
}

procedure {:inline 1} func_18();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_18()
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
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call func_0();
    call push(7.0);
    call loc2 := popArgs1();
label$1_start_451:
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
        goto label$1_start_451;
    }
    call push(-2147483648.0);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_454;
    }
    call push(5.0);
    call loc2 := popArgs1();
label$3_start_455:
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
        goto label$3_start_455;
    }
    call push(2147483647.0);
    call push(arg2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call push(8897.0);
    call fimport_2();
label$2_end_454:
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_459;
    }
    call push(7.0);
    call loc2 := popArgs1();
label$6_start_460:
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
        goto label$6_start_460;
    }
    call push(-2147483648.0);
    call push(arg3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_458;
    }
label$5_end_459:
    call push(loc1);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_466;
    }
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_465;
    }
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_464;
    }
    call push(arg3);
    call push(2147483647.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_458;
    }
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (84);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_19();
    call pop();
    goto label$4_end_458;
label$10_end_466:
    call push(arg3);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_463;
    }
    call push(arg3);
    call push(-2147483648.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_458;
    }
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(2.0);
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
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_20();
    call pop();
    goto label$4_end_458;
label$9_end_465:
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(3.0);
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
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_21();
    call pop();
    goto label$4_end_458;
label$8_end_464:
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (76);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(4.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_22();
    call pop();
    goto label$4_end_458;
label$7_end_463:
    call push(loc1);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    call push(5.0);
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
    idx := (real_to_int($tmp1)) + (40);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc1);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_23();
    call pop();
label$4_end_458:
    call push(0.0);
    call func_45();
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
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

procedure {:inline 1} func_19();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_19()
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
    call push(96.0);
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
    call arg2 := popArgs1();
    call push(0.0);
    call loc5 := popArgs1();
    call fimport_12();
    call loc6 := popArgs1();
    call push(loc6);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_468;
    }
    call push(loc6);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_471;
    }
    call push(loc6);
    call func_46();
    call loc5 := popArgs1();
    goto label$2_end_470;
label$3_end_471:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call global_0 := popArgs1();
label$2_end_470:
    call push(loc5);
    call push(loc6);
    call fimport_13();
    call pop();
label$1_end_468:
    call push(loc2);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(5459781.0);
    call loc7 := popArgs1();
label$5_start_474:
    call push(0.0);
    call loc8 := popArgs1();
    // // unhandled raw instruction: i32.shl
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
        goto label$4_end_473;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc9 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_476;
    }
    call push(loc9);
    call loc7 := popArgs1();
    call push(1.0);
    call loc8 := popArgs1();
    call push(arg2);
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_474;
    }
    goto label$4_end_473;
label$6_end_476:
    call push(loc9);
    call loc7 := popArgs1();
label$7_start_478:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_473;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc7 := popArgs1();
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc1 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc10 := popArgs1();
    call push(loc10);
    call arg2 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_478;
    }
    call push(1.0);
    call loc8 := popArgs1();
    call push(loc10);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc10);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_start_474;
    }
label$4_end_473:
    call push(loc8);
    call push(8192.0);
    call fimport_2();
    call push(loc6);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call push(8.0);
    call fimport_7();
    call pop();
    // // unhandled raw instruction: i32.and
    call loc1 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(loc5);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc5);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc6);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_483;
    }
    call push(loc5);
    call func_49();
label$8_end_483:
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
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
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (24);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
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
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    // // unhandled raw instruction: i32.shr_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_485;
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
label$9_end_485:
    call push(loc2);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
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
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc9 := popArgs1();
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc9);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(loc7);
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc4);
    call popDiscard4();
    call push(loc2);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
}

procedure {:inline 1} func_20();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_20()
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
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call arg2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call fimport_12();
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_490;
    }
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_493;
    }
    call push(loc4);
    call func_46();
    call loc3 := popArgs1();
    goto label$2_end_492;
label$3_end_493:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call global_0 := popArgs1();
label$2_end_492:
    call push(loc3);
    call push(loc4);
    call fimport_13();
    call pop();
label$1_end_490:
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(5459781.0);
    call loc5 := popArgs1();
label$6_start_497:
    // // unhandled raw instruction: i32.shl
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
        goto label$5_end_496;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_499;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg2);
    call arg1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_497;
    }
    goto label$4_end_495;
label$7_end_499:
    call push(loc6);
    call loc5 := popArgs1();
label$8_start_501:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_496;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc1 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call arg2 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_501;
    }
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_497;
    }
    goto label$4_end_495;
label$5_end_496:
    call push(0.0);
    call loc1 := popArgs1();
label$4_end_495:
    call push(loc1);
    call push(8192.0);
    call fimport_2();
    call push(loc2);
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
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (88);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(88.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_26();
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_504;
    }
    call push(loc3);
    call func_49();
label$9_end_504:
    call push(loc2);
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call push(60.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call func_27();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_505;
    }
    call push(loc2);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$10_end_505:
    call push(loc2);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
}

procedure {:inline 1} func_21();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_21()
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
    call fimport_12();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_510;
    }
    call push(arg2);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_509;
    }
    call push(arg2);
    call func_46();
    call loc1 := popArgs1();
    goto label$2_end_508;
label$4_end_510:
    call push(0.0);
    call loc1 := popArgs1();
    goto label$1_end_507;
label$3_end_509:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
label$2_end_508:
    call push(loc1);
    call push(arg2);
    call fimport_13();
    call pop();
label$1_end_507:
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(loc1);
    call push(8.0);
    call fimport_7();
    call pop();
    // // unhandled raw instruction: i32.and
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
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
    call fimport_7();
    call pop();
    call push(arg2);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_513;
    }
    call push(loc1);
    call func_49();
label$5_end_513:
    call push(arg1);
    // // unhandled raw instruction: i32.shr_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc5 := popArgs1();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_514;
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
label$6_end_514:
    call push(arg2);
    call push(loc6);
    call push(loc5);
    call push(loc4);
    call popDiscard4();
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
}

procedure {:inline 1} func_22();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
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
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (60);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call arg2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call fimport_12();
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_517;
    }
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_520;
    }
    call push(loc4);
    call func_46();
    call loc3 := popArgs1();
    goto label$2_end_519;
label$3_end_520:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call global_0 := popArgs1();
label$2_end_519:
    call push(loc3);
    call push(loc4);
    call fimport_13();
    call pop();
label$1_end_517:
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(5459781.0);
    call loc5 := popArgs1();
label$6_start_524:
    // // unhandled raw instruction: i32.shl
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
        goto label$5_end_523;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_526;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg2);
    call arg1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_524;
    }
    goto label$4_end_522;
label$7_end_526:
    call push(loc6);
    call loc5 := popArgs1();
label$8_start_528:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_523;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc1 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call arg2 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_528;
    }
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_524;
    }
    goto label$4_end_522;
label$5_end_523:
    call push(0.0);
    call loc1 := popArgs1();
label$4_end_522:
    call push(loc1);
    call push(8192.0);
    call fimport_2();
    call push(loc2);
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
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (72);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(8.0);
    call fimport_7();
    call pop();
    // // unhandled raw instruction: i32.and
    call arg2 := popArgs1();
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc2);
    call push(loc3);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_24();
    call pop();
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_532;
    }
    call push(loc3);
    call func_49();
label$9_end_532:
    call push(loc2);
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (68);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call push(60.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (64);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_25();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_533;
    }
    call push(loc2);
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$10_end_533:
    call push(loc2);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
}

procedure {:inline 1} func_23();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
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
    call push(global_0);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call loc2 := popArgs1();
    call push(loc2);
    call push(arg1);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (44);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(0.0);
    call arg2 := popArgs1();
    call push(0.0);
    call loc3 := popArgs1();
    call fimport_12();
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_536;
    }
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_539;
    }
    call push(loc4);
    call func_46();
    call loc3 := popArgs1();
    goto label$2_end_538;
label$3_end_539:
    call push(loc1);
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc3 := popArgs1();
    call push(loc3);
    call global_0 := popArgs1();
label$2_end_538:
    call push(loc3);
    call push(loc4);
    call fimport_13();
    call pop();
label$1_end_536:
    call push(loc2);
    call push(1397703936.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(1.0);
    call push(9035.0);
    call fimport_2();
    call push(5459781.0);
    call loc5 := popArgs1();
label$6_start_543:
    // // unhandled raw instruction: i32.shl
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
        goto label$5_end_542;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_545;
    }
    call push(loc6);
    call loc5 := popArgs1();
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg2);
    call arg1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_543;
    }
    goto label$4_end_541;
label$7_end_545:
    call push(loc6);
    call loc5 := popArgs1();
label$8_start_547:
    // // unhandled raw instruction: i64.and
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_542;
    }
    // // unhandled raw instruction: i64.shr_u
    call loc5 := popArgs1();
    call push(arg2);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call loc1 := popArgs1();
    call push(arg2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call arg2 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_start_547;
    }
    call push(1.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(arg1);
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_start_543;
    }
    goto label$4_end_541;
label$5_end_542:
    call push(0.0);
    call loc1 := popArgs1();
label$4_end_541:
    call push(loc1);
    call push(8192.0);
    call fimport_2();
    call push(loc2);
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
    call push(loc2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (56);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc4);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(loc3);
    call push(8.0);
    call fimport_7();
    call pop();
    // // unhandled raw instruction: i32.and
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call push(9084.0);
    call fimport_2();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc2);
    call push(loc3);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_24();
    call pop();
    call push(loc4);
    call push(513.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_550;
    }
    call push(loc3);
    call func_49();
label$9_end_550:
    call push(loc2);
    call push(loc2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (52);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(loc2);
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call func_28();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_551;
    }
    call push(loc2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
label$10_end_551:
    call push(loc2);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(1.0);
}

procedure {:inline 1} func_24();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
    call func_36();
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
        goto label$8_end_560;
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
        goto label$3_end_555;
    }
    call push(loc3);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_end_559;
    }
    call push(loc1);
    // // unhandled raw instruction: i32.shl
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    // // unhandled raw instruction: i32.or
    call loc4 := popArgs1();
    goto label$6_end_558;
label$8_end_560:
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_557;
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
    goto label$4_end_556;
label$7_end_559:
    // // unhandled raw instruction: i32.and
    call loc5 := popArgs1();
    call push(loc5);
    call func_37();
    call loc4 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.or
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
label$6_end_558:
    call push(loc3);
    call loc6 := popArgs1();
    call push(loc4);
    call loc5 := popArgs1();
label$9_start_564:
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
        goto label$9_start_564;
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
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_568;
    }
    call push(arg2);
    call push(0.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u16(idx, store_i);
    goto label$10_end_567;
label$11_end_568:
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
label$10_end_567:
    call push(arg2);
    call push(0.0);
    call func_43();
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
        goto label$1_end_553;
    }
    goto label$2_end_554;
label$5_end_557:
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
label$4_end_556:
    call push(arg2);
    call push(0.0);
    call func_43();
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
        goto label$2_end_554;
    }
    goto label$1_end_553;
label$3_end_555:
    call push(loc1);
    call func_41();
    assume (false);
label$2_end_554:
    call push(loc1);
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (20);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call func_39();
label$1_end_553:
    call push(loc1);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} popDiscard5();
modifies $sp;
requires(($sp) >= (5));
ensures(($sp) == ((old($sp)) - (5)));
ensures((0) <= ($sp));
implementation popDiscard5()
{
    $sp := ($sp) - (5);
}

procedure {:inline 1} func_25();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(32.0);
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
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_42();
    call arg2 := popArgs1();
    call push(loc1);
    call push(48.0);
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
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shr_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_573;
    }
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
label$1_end_573:
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(loc5);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call func_42();
    call loc4 := popArgs1();
    call push(loc1);
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
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc3);
    call push(loc1);
    call push(loc4);
    call push(arg1);
    call popDiscard5();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_577;
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_576;
    }
    goto label$2_end_575;
label$4_end_577:
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_575;
    }
label$3_end_576:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_578;
label$2_end_575:
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
func_exit_578:
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
    call push(9084.0);
    call fimport_2();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
    call push(arg1);
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
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
    call push(arg1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
    call push(arg1);
    call push(24.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
    call func_24();
    call pop();
}

procedure {:inline 1} popDiscard6();
modifies $sp;
requires(($sp) >= (6));
ensures(($sp) == ((old($sp)) - (6)));
ensures((0) <= ($sp));
implementation popDiscard6()
{
    $sp := ($sp) - (6);
}

procedure {:inline 1} func_27();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(32.0);
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
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (16);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(32.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call func_42();
    call arg2 := popArgs1();
    call push(loc1);
    call push(48.0);
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
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shr_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_585;
    }
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
label$1_end_585:
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call func_42();
    call loc5 := popArgs1();
    call push(loc1);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc6);
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
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc4);
    call push(loc3);
    call push(loc1);
    call push(loc5);
    call push(arg1);
    call popDiscard6();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_589;
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_588;
    }
    goto label$2_end_587;
label$4_end_589:
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_587;
    }
label$3_end_588:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_590;
label$2_end_587:
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
func_exit_590:
}

procedure {:inline 1} func_28();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_28()
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
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc1 := popArgs1();
    call push(loc1);
    call global_0 := popArgs1();
    call push(loc1);
    call push(32.0);
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
    call push(loc1);
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
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
    call func_42();
    call arg2 := popArgs1();
    call push(loc1);
    call push(48.0);
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
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (32);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    // // unhandled raw instruction: i32.shr_s
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_593;
    }
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg1 := popArgs1();
label$1_end_593:
    call push(loc1);
    call push(80.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc1);
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (48);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc1);
    call push(64.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call func_42();
    call loc3 := popArgs1();
    call push(loc1);
    call push(8.0);
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
    call push(loc1);
    call push(loc1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (80);
    call load_i := mem_read_s64(idx);
    call push(int_to_real(load_i));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u64(idx, store_i);
    call push(loc2);
    call push(loc1);
    call push(loc3);
    call push(arg1);
    call popDiscard4();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_597;
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_596;
    }
    goto label$2_end_595;
label$4_end_597:
    call push(loc3);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_595;
    }
label$3_end_596:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (8);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call func_39();
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    goto func_exit_598;
label$2_end_595:
    call push(loc1);
    call push(96.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
func_exit_598:
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
    call push(9084.0);
    call fimport_2();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
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
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
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
    call fimport_7();
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
    call push(9084.0);
    call fimport_2();
    call push(arg1);
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(8.0);
    call fimport_7();
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
        goto label$5_end_608;
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
        goto label$3_end_606;
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
        goto label$6_end_614;
    }
    call push(loc5);
    // // unhandled raw instruction: i32.shl
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
        goto label$4_end_607;
    }
label$6_end_614:
    call push(loc6);
    call func_37();
    call loc1 := popArgs1();
    goto label$2_end_605;
label$5_end_608:
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg1 := popArgs1();
label$7_start_618:
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
        goto label$7_start_618;
    }
    goto label$1_end_604;
label$4_end_607:
    call push(0.0);
    call loc6 := popArgs1();
    call push(0.0);
    call loc1 := popArgs1();
    goto label$2_end_605;
label$3_end_606:
    call push(arg1);
    call func_44();
    assume (false);
label$2_end_605:
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
label$8_start_623:
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
        goto label$8_start_623;
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
        goto label$9_end_629;
    }
    call push(loc1);
    call push(arg2);
    call push(loc2);
    call fimport_7();
    call pop();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call arg2 := popArgs1();
label$9_end_629:
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
        goto label$1_end_604;
    }
    call push(arg2);
    call func_39();
    goto func_exit_630;
label$1_end_604:
func_exit_630:
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
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (4);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc1);
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
    call func_33();
    call pop();
}

procedure {:inline 1} func_32();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
    call push(16.0);
    call loc2 := popArgs1();
    call push(arg2);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc7 := popArgs1();
label$1_start_636:
    call push(loc2);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc7 := popArgs1();
    call push(loc7);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_636;
    }
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_639;
    }
    // // unhandled raw instruction: i32.and
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
label$2_end_639:
    call push(arg2);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (28);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc4 := popArgs1();
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call push(arg2);
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
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(arg2);
    call push(28.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    // // unhandled raw instruction: i64.extend_i32_u
    call loc7 := popArgs1();
label$3_start_642:
    call push(loc2);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i64.shr_u
    call loc7 := popArgs1();
    call push(loc7);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_start_642;
    }
    call push(0.0);
    call loc4 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_646;
    }
    call push(arg1);
    call push(0.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call func_30();
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
    call loc2 := popArgs1();
    goto label$4_end_645;
label$5_end_646:
    call push(0.0);
    call loc2 := popArgs1();
label$4_end_645:
    call push(loc1);
    call push(loc2);
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
    call push(loc4);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg1 := popArgs1();
    call push(arg1);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call push(arg2);
    call push(8.0);
    call fimport_7();
    call pop();
    call push(arg1);
    call push(-8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call push(9140.0);
    call fimport_2();
    call push(loc2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(8.0);
    call fimport_7();
    call pop();
    call push(loc1);
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
    call push(loc1);
    call push(loc3);
    call func_34();
    call push(loc6);
    call func_35();
    call pop();
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
}

procedure {:inline 1} func_33();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
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
    // // unhandled raw instruction: i64.extend_i32_u
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
label$1_start_649:
    call push(loc3);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.or
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
        goto label$1_start_649;
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
    // // unhandled raw instruction: i32.shr_u
    // // unhandled raw instruction: i32.and
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
        goto label$2_end_652;
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
label$2_end_652:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_34();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_34()
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
    // // unhandled raw instruction: i64.extend_i32_u
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
label$1_start_657:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc5 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.or
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
        goto label$1_start_657;
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
        goto label$2_end_661;
    }
    call push(arg1);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
label$3_start_664:
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
    call push(9140.0);
    call fimport_2();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(loc6);
    call push(8.0);
    call fimport_7();
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
        goto label$3_start_664;
    }
label$2_end_661:
    call push(loc1);
    call push(16.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call global_0 := popArgs1();
    call push(arg1);
}

procedure {:inline 1} func_35();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation func_35()
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
    // // unhandled raw instruction: i64.extend_i32_u
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
label$1_start_671:
    call push(loc2);
    // // wrap: no-op under real semantics
    call loc6 := popArgs1();
    call push(loc1);
    // // unhandled raw instruction: i32.or
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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
        goto label$1_start_671;
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
    call push(9140.0);
    call fimport_2();
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
    call fimport_7();
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

procedure {:inline 1} func_36();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
label$1_start_677:
    call push(loc1);
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call push(9720.0);
    call fimport_2();
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
    // // unhandled raw instruction: i64.or
    call loc3 := popArgs1();
    call push(loc2);
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_start_677;
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
        goto label$3_end_682;
    }
    call push(arg2);
    call push(loc5);
    call push(loc4);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call func_30();
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
    goto label$2_end_681;
label$3_end_682:
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_681;
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
label$2_end_681:
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
    call push(9084.0);
    call fimport_2();
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
    call fimport_7();
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
modifies $mem;
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
    call func_46();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_690;
    }
label$2_start_693:
    call push(0.0);
    call arg1 := popArgs1();
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9724);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_690;
    }
    call push(loc2);
    call popDiscard1();
    call push(loc1);
    call func_46();
    call arg1 := popArgs1();
    call push(arg1);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_start_693;
    }
label$1_end_690:
    call push(arg1);
}

procedure {:inline 1} func_38();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
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
        goto label$1_end_697;
    }
    call push(arg1);
    call func_49();
label$1_end_697:
}

procedure {:inline 1} func_40();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
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
modifies $mem;
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
modifies $mem;
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
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_699;
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
    goto func_exit_701;
label$1_end_699:
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
        goto label$2_end_702;
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
        goto label$4_end_705;
    }
    call push(arg1);
    // // unhandled raw instruction: i32.shl
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
        goto label$3_end_704;
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
    goto func_exit_701;
label$4_end_705:
    // // unhandled raw instruction: i32.and
    call loc3 := popArgs1();
    call push(loc3);
    call func_37();
    call arg2 := popArgs1();
    call push(arg1);
    // // unhandled raw instruction: i32.or
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
label$3_end_704:
    call push(arg2);
    call push(loc2);
    call push(loc1);
    call fimport_7();
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
    goto func_exit_701;
label$2_end_702:
    call fimport_17();
    assume (false);
func_exit_701:
}

procedure {:inline 1} func_43();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_43()
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
        goto label$4_end_712;
    }
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_714;
    }
    // // unhandled raw instruction: i32.shr_u
    call loc2 := popArgs1();
    call push(10.0);
    call loc3 := popArgs1();
    goto label$5_end_713;
label$6_end_714:
    // // unhandled raw instruction: i32.and
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
label$5_end_713:
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
        goto label$7_end_715;
    }
    // // unhandled raw instruction: i32.and
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc4 := popArgs1();
label$7_end_715:
    call push(loc4);
    call push(loc3);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_719;
    }
    call push(loc4);
    call push(10.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_720;
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
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_717;
    }
    goto label$3_end_711;
label$11_end_720:
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
        goto label$9_end_718;
    }
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_718;
    }
label$10_end_719:
    goto func_exit_721;
label$9_end_718:
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_722;
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
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_711;
    }
    goto label$8_end_717;
label$12_end_722:
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
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_711;
    }
label$8_end_717:
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
        goto label$1_end_709;
    }
    goto label$2_end_710;
label$4_end_712:
    call fimport_17();
    assume (false);
label$3_end_711:
    // // unhandled raw instruction: i32.shr_u
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
        goto label$1_end_709;
    }
label$2_end_710:
    call push(arg2);
    call push(loc3);
    call push(loc1);
    call fimport_7();
    call pop();
label$1_end_709:
    call push(loc5);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$13_end_725;
    }
    call push(loc3);
    call func_39();
label$13_end_725:
    call push(loc6);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$14_end_726;
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
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    goto func_exit_721;
label$14_end_726:
    call push(arg1);
    // // unhandled raw instruction: i32.shl
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
func_exit_721:
}

procedure {:inline 1} func_44();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_44()
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

procedure {:inline 1} func_45();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_45()
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

procedure {:inline 1} func_46();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_46()
{
    var arg1: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    call push(9736.0);
    call push(arg1);
    call func_47();
}

procedure {:inline 1} func_47();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_47()
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
        goto label$1_end_727;
    }
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (232);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(loc1);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_728;
    }
    call push(16.0);
    call loc1 := popArgs1();
    call push(arg1);
    call push(232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(16.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$2_end_728:
    call push(arg2);
    call push(8.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i32.and
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
    idx := (real_to_int($tmp1)) + (236);
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
        goto label$5_end_733;
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
    call push(40.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call arg2 := popArgs1();
    call push(loc3);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_735;
    }
    call push(arg1);
    call push(44.0);
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
        goto label$6_end_735;
    }
    call push(arg2);
    call push(40.0);
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
label$6_end_735:
    call push(loc2);
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$7_start_737:
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
        goto label$8_end_739;
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
    // // unhandled raw instruction: i32.or
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
    // // unhandled raw instruction: i32.or
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
        goto label$4_end_732;
    }
label$8_end_739:
    call push(arg1);
    call func_48();
    call arg2 := popArgs1();
    call push(arg2);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$7_start_737;
    }
label$5_end_733:
    call push(2147483647.0);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc4 := popArgs1();
    call push(arg1);
    call push(240.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc5 := popArgs1();
    call push(arg1);
    call push(232.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(arg1);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (240);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc7 := popArgs1();
    call push(loc7);
    call loc1 := popArgs1();
label$9_start_746:
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
    call push(48.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call push(arg2);
    call push(40.0);
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
    call push(8227.0);
    call fimport_2();
    call push(arg2);
    call push(44.0);
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
label$10_start_751:
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
    // // unhandled raw instruction: i32.and
    call arg2 := popArgs1();
    call push(loc12);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$11_end_753;
    }
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$12_end_754;
    }
label$13_start_755:
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
        goto label$12_end_754;
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
        goto label$12_end_754;
    }
    call push(arg2);
    // // unhandled raw instruction: i32.and
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
        goto label$13_start_755;
    }
label$12_end_754:
    call push(loc11);
    // // unhandled raw instruction: i32.or
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
        goto label$14_end_760;
    }
    call push(loc1);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i32.and
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$14_end_760:
    call push(arg2);
    call push(loc2);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$3_end_731;
    }
label$11_end_753:
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
        goto label$10_start_751;
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
        goto label$9_start_746;
    }
label$4_end_732:
    call push(arg2);
    goto func_exit_765;
label$3_end_731:
    call push(loc11);
    // // unhandled raw instruction: i32.or
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc1);
    goto func_exit_765;
label$1_end_727:
    call push(0.0);
func_exit_765:
}

procedure {:inline 1} func_48();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_48()
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
    idx := (real_to_int($tmp1)) + (236);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc1 := popArgs1();
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9728);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_768;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc2 := popArgs1();
    goto label$1_end_767;
label$2_end_768:
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc2 := popArgs1();
    call push(0.0);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9728);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(0.0);
    // // unhandled raw instruction: i32.shl
    call loc2 := popArgs1();
    call push(loc2);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$1_end_767:
    call push(loc2);
    call loc3 := popArgs1();
    // // unhandled raw instruction: i32.shr_u
    call loc4 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$6_end_773;
    }
    call push(loc4);
    call push(loc5);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.grow
    call pop();
    call push(0.0);
    call loc5 := popArgs1();
    call push(loc4);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_772;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc3 := popArgs1();
label$6_end_773:
    call push(0.0);
    call loc5 := popArgs1();
    call push(0.0);
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$5_end_772;
    }
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call loc4 := popArgs1();
    // // unhandled raw instruction: i32.and
    call loc5 := popArgs1();
    call push(loc5);
    call push(64512.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$8_end_777;
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
    goto label$7_end_776;
label$8_end_777:
    call push(loc2);
    call push(131072.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    // // unhandled raw instruction: i32.and
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc5 := popArgs1();
label$7_end_776:
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
    idx := (real_to_int($tmp1)) + (9728);
    call load_i := mem_read_u8(idx);
    call push(int_to_real(load_i));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$9_end_779;
    }
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc3 := popArgs1();
    call push(0.0);
    call push(1.0);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9728);
    store_i := real_to_int($tmp2);
    call mem_write_u8(idx, store_i);
    call push(0.0);
    // // unhandled raw instruction: i32.shl
    call loc3 := popArgs1();
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$9_end_779:
    call push(loc4);
    call push(40.0);
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
        goto label$4_end_771;
    }
    call push(loc3);
    call loc6 := popArgs1();
    // // unhandled raw instruction: i32.shr_u
    call loc5 := popArgs1();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call loc8 := popArgs1();
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$10_end_781;
    }
    call push(loc5);
    call push(loc8);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.grow
    call pop();
    call push(loc5);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    // // unsupported memory op: memory.size
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) != ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_771;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    call load_i := mem_read_s32(idx);
    call push(int_to_real(load_i));
    call loc6 := popArgs1();
label$10_end_781:
    call push(0.0);
    call push(loc6);
    call push(loc7);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9732);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
    call push(loc3);
    call push(-1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$4_end_771;
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
    call push(44.0);
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
        goto label$3_end_770;
    }
    call push(loc5);
    call push(loc1);
    call push(48.0);
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
        goto label$11_end_787;
    }
    call push(loc6);
    call push(loc1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc6 := popArgs1();
    call push(loc6);
    // // unhandled raw instruction: i32.or
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
    // // unhandled raw instruction: i32.and
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$11_end_787:
    call push(arg1);
    call push(236.0);
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
    call push(40.0);
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
    call push(44.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(loc3);
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$5_end_772:
    call push(loc5);
    goto func_exit_796;
label$4_end_771:
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
    call push(48.0);
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
        goto label$12_end_797;
    }
    call push(loc3);
    call push(44.0);
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
    // // unhandled raw instruction: i32.or
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
    // // unhandled raw instruction: i32.and
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
label$12_end_797:
    call push(arg1);
    call push(arg1);
    call push(236.0);
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
    idx := (real_to_int($tmp1)) + (232);
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
    goto func_exit_796;
label$3_end_770:
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
func_exit_796:
}

procedure {:inline 1} func_49();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
implementation func_49()
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
        goto label$2_end_807;
    }
    call push(0.0);
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (9968);
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
        goto label$2_end_807;
    }
    call push(9776.0);
    call loc2 := popArgs1();
    call push(loc1);
    call push(12.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) * ($tmp1));
    call push(9776.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc3 := popArgs1();
label$3_start_809:
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
        goto label$2_end_807;
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
        goto label$4_end_812;
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
        goto label$1_end_806;
    }
label$4_end_812:
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
        goto label$3_start_809;
    }
label$2_end_807:
    goto func_exit_814;
label$1_end_806:
    call push(arg1);
    call push(-4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    // // unhandled raw instruction: i32.and
    call popToTmp2();
    call popToTmp1();
    idx := (real_to_int($tmp1)) + (0);
    store_i := real_to_int($tmp2);
    call mem_write_u32(idx, store_i);
func_exit_814:
}

procedure {:inline 1} CorralChoice__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralChoice__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (90)));
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
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_2();
    } else if ((c) == (3)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_3();
        call popDiscard1();
    } else if ((c) == (4)) {
        call fimport_4();
        call popDiscard1();
    } else if ((c) == (5)) {
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
        call fimport_5();
        call popDiscard1();
    } else if ((c) == (6)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_6();
    } else if ((c) == (7)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_7();
        call popDiscard1();
    } else if ((c) == (8)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_8();
        call popDiscard1();
    } else if ((c) == (9)) {
        havoc argTmp;
        call push(argTmp);
        call fimport_9();
    } else if ((c) == (10)) {
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
        call popDiscard1();
    } else if ((c) == (12)) {
        call fimport_12();
        call popDiscard1();
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
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_14();
        call popDiscard1();
    } else if ((c) == (15)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call fimport_15();
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
        call fimport_39();
        call popDiscard1();
    } else if ((c) == (40)) {
        call func_0();
    } else if ((c) == (41)) {
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
    } else if ((c) == (42)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
        call popDiscard1();
    } else if ((c) == (43)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_3();
        call popDiscard1();
    } else if ((c) == (44)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_4();
    } else if ((c) == (45)) {
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
        call func_5();
    } else if ((c) == (46)) {
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
        call func_6();
    } else if ((c) == (47)) {
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
        call func_7();
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_8();
    } else if ((c) == (49)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_9();
        call popDiscard1();
    } else if ((c) == (50)) {
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
        call func_10();
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
        call func_11();
    } else if ((c) == (52)) {
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
    } else if ((c) == (53)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_13();
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
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_14();
    } else if ((c) == (55)) {
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
        call popDiscard1();
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
        call func_16();
    } else if ((c) == (57)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_17();
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
        call func_18();
    } else if ((c) == (59)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_19();
        call popDiscard1();
    } else if ((c) == (60)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_20();
        call popDiscard1();
    } else if ((c) == (61)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_21();
        call popDiscard1();
    } else if ((c) == (62)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_22();
        call popDiscard1();
    } else if ((c) == (63)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_23();
        call popDiscard1();
    } else if ((c) == (64)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_24();
        call popDiscard1();
    } else if ((c) == (65)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_25();
    } else if ((c) == (66)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_26();
    } else if ((c) == (67)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_27();
    } else if ((c) == (68)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_28();
    } else if ((c) == (69)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_29();
    } else if ((c) == (70)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_30();
    } else if ((c) == (71)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_31();
    } else if ((c) == (72)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_32();
    } else if ((c) == (73)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_33();
        call popDiscard1();
    } else if ((c) == (74)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_34();
        call popDiscard1();
    } else if ((c) == (75)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_35();
        call popDiscard1();
    } else if ((c) == (76)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_36();
        call popDiscard1();
    } else if ((c) == (77)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_37();
        call popDiscard1();
    } else if ((c) == (78)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_38();
        call popDiscard1();
    } else if ((c) == (79)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_39();
    } else if ((c) == (80)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_40();
    } else if ((c) == (81)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_41();
    } else if ((c) == (82)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_42();
        call popDiscard1();
    } else if ((c) == (83)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_43();
    } else if ((c) == (84)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_44();
    } else if ((c) == (85)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_45();
    } else if ((c) == (86)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_46();
        call popDiscard1();
    } else if ((c) == (87)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_47();
        call popDiscard1();
    } else if ((c) == (88)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_48();
        call popDiscard1();
    } else if ((c) == (89)) {
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_49();
    }
}

procedure BoogieEntry__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation BoogieEntry__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (90)));
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
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_2();
        } else if ((c) == (3)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_3();
            call popDiscard1();
        } else if ((c) == (4)) {
            call fimport_4();
            call popDiscard1();
        } else if ((c) == (5)) {
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
            call fimport_5();
            call popDiscard1();
        } else if ((c) == (6)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_6();
        } else if ((c) == (7)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_7();
            call popDiscard1();
        } else if ((c) == (8)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_8();
            call popDiscard1();
        } else if ((c) == (9)) {
            havoc argTmp;
            call push(argTmp);
            call fimport_9();
        } else if ((c) == (10)) {
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
            call popDiscard1();
        } else if ((c) == (12)) {
            call fimport_12();
            call popDiscard1();
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
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_14();
            call popDiscard1();
        } else if ((c) == (15)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            call fimport_15();
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
            call fimport_39();
            call popDiscard1();
        } else if ((c) == (40)) {
            call func_0();
        } else if ((c) == (41)) {
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
        } else if ((c) == (42)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
            call popDiscard1();
        } else if ((c) == (43)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_3();
            call popDiscard1();
        } else if ((c) == (44)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_4();
        } else if ((c) == (45)) {
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
            call func_5();
        } else if ((c) == (46)) {
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
            call func_6();
        } else if ((c) == (47)) {
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
            call func_7();
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_8();
        } else if ((c) == (49)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_9();
            call popDiscard1();
        } else if ((c) == (50)) {
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
            call func_10();
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
            call func_11();
        } else if ((c) == (52)) {
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
        } else if ((c) == (53)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_13();
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
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_14();
        } else if ((c) == (55)) {
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
            call popDiscard1();
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
            call func_16();
        } else if ((c) == (57)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_17();
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
            call func_18();
        } else if ((c) == (59)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_19();
            call popDiscard1();
        } else if ((c) == (60)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_20();
            call popDiscard1();
        } else if ((c) == (61)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_21();
            call popDiscard1();
        } else if ((c) == (62)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_22();
            call popDiscard1();
        } else if ((c) == (63)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_23();
            call popDiscard1();
        } else if ((c) == (64)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_24();
            call popDiscard1();
        } else if ((c) == (65)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_25();
        } else if ((c) == (66)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_26();
        } else if ((c) == (67)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_27();
        } else if ((c) == (68)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_28();
        } else if ((c) == (69)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_29();
        } else if ((c) == (70)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_30();
        } else if ((c) == (71)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_31();
        } else if ((c) == (72)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_32();
        } else if ((c) == (73)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_33();
            call popDiscard1();
        } else if ((c) == (74)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_34();
            call popDiscard1();
        } else if ((c) == (75)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_35();
            call popDiscard1();
        } else if ((c) == (76)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_36();
            call popDiscard1();
        } else if ((c) == (77)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_37();
            call popDiscard1();
        } else if ((c) == (78)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_38();
            call popDiscard1();
        } else if ((c) == (79)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_39();
        } else if ((c) == (80)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_40();
        } else if ((c) == (81)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_41();
        } else if ((c) == (82)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_42();
            call popDiscard1();
        } else if ((c) == (83)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_43();
        } else if ((c) == (84)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_44();
        } else if ((c) == (85)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_45();
        } else if ((c) == (86)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_46();
            call popDiscard1();
        } else if ((c) == (87)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_47();
            call popDiscard1();
        } else if ((c) == (88)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_48();
            call popDiscard1();
        } else if ((c) == (89)) {
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_49();
        }
    }
}

procedure CorralEntry__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies $mem;
modifies global_0;
implementation CorralEntry__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__01bd013c4f8be142b9cadf511f007c6ac201c068d529f01ed5661803c575befa();
    }
}

