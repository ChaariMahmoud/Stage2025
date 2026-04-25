//Manual edit !
//problem in function parameter detection (reuslt == parameter) => parser & conversion problem
//Harness havoc correction 
//problem mapping function parameter names from wasm to boogie (my stack based model does not conserve names)

var $stack: [int]real;
var $sp: int;
var $tmp1: real;
var $tmp2: real;
var $tmp3: real;
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

const MAX_REQUESTS: real;

axiom((MAX_REQUESTS) == (10.0));
var active_requests: real;
procedure {:inline 1} initGlobals();
modifies active_requests;
ensures((active_requests) == (0.0));
implementation initGlobals()
{
    active_requests := 0.0;
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

procedure {:inline 1} acquire_request();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
//requires(((0.0) <= (n)) && ((n) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation acquire_request()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(active_requests);
    call arg2 := popArgs1();
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(MAX_REQUESTS);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) > ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc1 := popArgs1();
    } else {
        call push(loc2);
        call active_requests := popArgs1();
        call push(1.0);
        call loc1 := popArgs1();
    }
    call push(loc1);
}

procedure {:inline 1} release_request();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
//requires(((0.0) <= (n)) && ((n) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation release_request()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var loc2: real;
    var loc3: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (1));
    call arg1 := popArgs1();
    loc1 := 0.0;
    loc2 := 0.0;
    loc3 := 0.0;
    call push(active_requests);
    call arg2 := popArgs1();
    call push(arg2);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call loc2 := popArgs1();
    call push(loc2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        call loc1 := popArgs1();
    } else {
        call push(loc2);
        call active_requests := popArgs1();
        call push(1.0);
        call loc1 := popArgs1();
    }
    call push(loc1);
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

procedure {:inline 1} CorralChoice_request_spec_param();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation CorralChoice_request_spec_param()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (2)));
    if ((c) == (0)) {
havoc argTmp;
assume 0.0 <= argTmp && argTmp <= MAX_REQUESTS;
assume argTmp == real(int(argTmp));
call push(argTmp);
        call acquire_request();
        call popDiscard1();
        assert (((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
    } else if ((c) == (1)) {
havoc argTmp;
assume 0.0 <= argTmp && argTmp <= MAX_REQUESTS;
assume argTmp == real(int(argTmp));
call push(argTmp);
        call release_request();
        call popDiscard1();
        assert (((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
    }
}

procedure BoogieEntry_request_spec_param();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation BoogieEntry_request_spec_param()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    invariant ((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS));
    invariant (MAX_REQUESTS) == (real(int(MAX_REQUESTS)));
    invariant (active_requests) == (real(int(active_requests)));
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (2)));
        if ((c) == (0)) {
havoc argTmp;
assume 0.0 <= argTmp && argTmp <= MAX_REQUESTS;
assume argTmp == real(int(argTmp));
call push(argTmp);
            call acquire_request();
            call popDiscard1();
        } else if ((c) == (1)) {
havoc argTmp;
assume 0.0 <= argTmp && argTmp <= MAX_REQUESTS;
assume argTmp == real(int(argTmp));
call push(argTmp);
            call release_request();
            call popDiscard1();
        }
    }
}

procedure CorralEntry_request_spec_param();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation CorralEntry_request_spec_param()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice_request_spec_param();
    }
}

