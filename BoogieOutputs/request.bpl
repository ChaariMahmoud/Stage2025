var $stack: [int]real;
var $sp: int;
var $tmp1: real;
var $tmp2: real;
var $tmp3: real;
var $globals_inited: bool;
function bool_to_real(b: bool) : real
{
    if b then (1.0) else (0.0)
}
function real_to_bool(r: real) : bool
{
    if (r) == (0.0) then (false) else (true)
}
procedure {:inline true} push(val: real);
modifies $sp;
modifies $stack;
implementation push(val: real)
{
    $stack[$sp] := val;
    $sp := ($sp) + (1);
}

procedure popToTmp1();
modifies $sp;
modifies $stack;
modifies $tmp1;
implementation popToTmp1()
{
    assume (($sp) > (0));
    $sp := ($sp) - (1);
    $tmp1 := $stack[$sp];
}

procedure popToTmp2();
modifies $sp;
modifies $stack;
modifies $tmp2;
implementation popToTmp2()
{
    assume (($sp) > (0));
    $sp := ($sp) - (1);
    $tmp2 := $stack[$sp];
}

procedure popToTmp3();
modifies $sp;
modifies $stack;
modifies $tmp3;
implementation popToTmp3()
{
    assume (($sp) > (0));
    $sp := ($sp) - (1);
    $tmp3 := $stack[$sp];
}

procedure pop();
modifies $sp;
implementation pop()
{
    assume (($sp) > (0));
    $sp := ($sp) - (1);
}

const MAX_REQUESTS: real;

axiom((MAX_REQUESTS) == (10.0));
var active_requests: real;
procedure initGlobals();
modifies active_requests;
implementation initGlobals()
{
    active_requests := 0.0;
}

procedure {:inline true} popArgs1() returns (a1: real);
modifies $sp;
modifies $stack;
implementation popArgs1() returns (a1: real)
{
    assume (($sp) >= (1));
    $sp := ($sp) - (1);
    a1 := $stack[$sp];
}

procedure acquire_request();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
implementation acquire_request()
{
    var loc1: real;
    var loc2: real;
    var idx: int;
    var entry_sp: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    $tmp1 := 0.0;
    $tmp2 := 0.0;
    $tmp3 := 0.0;
    loc1 := 0.0;
    loc2 := 0.0;
    call push(active_requests);
    call loc1 := popArgs1();
    call push(loc1);
    call push(MAX_REQUESTS);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc2 := popArgs1();
    } else {
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call active_requests := popArgs1();
        call push(1.0);
        call loc2 := popArgs1();
block_end_1:
    }
    call push(loc2);
}

procedure release_request();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
implementation release_request()
{
    var loc1: real;
    var idx: int;
    var entry_sp: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    $tmp1 := 0.0;
    $tmp2 := 0.0;
    $tmp3 := 0.0;
    loc1 := 0.0;
    call push(active_requests);
    call loc1 := popArgs1();
    call push(loc1);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call active_requests := popArgs1();
    }
}

