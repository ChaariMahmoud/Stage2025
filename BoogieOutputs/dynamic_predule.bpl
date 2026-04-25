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

var Counter: real;
const Max: real;

axiom((Max) == (100.0));
procedure initGlobals();
modifies Counter;
implementation initGlobals()
{
    Counter := 41.0;
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

procedure inc_and_check();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies Counter;
implementation inc_and_check()
{
    var idx: int;
    var entry_sp: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    $tmp1 := 0.0;
    $tmp2 := 0.0;
    $tmp3 := 0.0;
    call push(Counter);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call Counter := popArgs1();
    call push(Counter);
    call push(Max);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) < ($tmp1)));
}

