var $stack: [int]real;
var $sp: int;
var $tmp1: real;
var $tmp2: real;
var $tmp3: real;
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
requires(((0.0) <= (active_requests)) && ((active_requests) < (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation acquire_request()
{
    var entry_sp: int;
    entry_sp := $sp;
    call push(active_requests);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call active_requests := popArgs1();
    call push(1.0);
}

procedure {:inline 1} release_request();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) < (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation release_request()
{
    var entry_sp: int;
    entry_sp := $sp;
    call push(active_requests);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call active_requests := popArgs1();
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

procedure {:inline 1} CorralChoice_test_req();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation CorralChoice_test_req()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (2)));
    if ((c) == (0)) {
        call acquire_request();
        call popDiscard1();
        assert (((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
    } else if ((c) == (1)) {
        call release_request();
        assert (((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
    }
}

procedure BoogieEntry_test_req();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation BoogieEntry_test_req()
{
    var c: int;
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
            call acquire_request();
            call popDiscard1();
        } else if ((c) == (1)) {
            call release_request();
        }
    }
}

procedure CorralEntry_test_req();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies active_requests;
requires(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
ensures(((0.0) <= (active_requests)) && ((active_requests) <= (MAX_REQUESTS)));
implementation CorralEntry_test_req()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice_test_req();
    }
}

