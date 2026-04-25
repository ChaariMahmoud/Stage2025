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

procedure {:inline 1} initGlobals();
implementation initGlobals()
{
}

procedure {:inline 1} CorralChoice__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralChoice__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (0)));
}

procedure BoogieEntry__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation BoogieEntry__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f()
{
    var c: int;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (0)));
    }
}

procedure CorralEntry__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralEntry__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__836e864ddc1b02e26d8c7d3496c7d6b8f9df3867a70242b7da021fff65c39a5f();
    }
}

