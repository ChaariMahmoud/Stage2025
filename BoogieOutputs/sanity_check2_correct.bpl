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

var temp: real;
procedure {:inline 1} initGlobals();
modifies temp;
ensures((temp) == (98.0));
implementation initGlobals()
{
    temp := 98.0;
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

procedure {:inline 1} heat_step();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies temp;
requires(((0.0) <= (temp)) && ((temp) <= (100.0)));
ensures(((0.0) <= (temp)) && ((temp) <= (100.0)));
implementation heat_step()
{
    var loc1: real;
    var entry_sp: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(temp);
    call loc1 := popArgs1();
    call push(loc1);
    call push(99.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) <= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call temp := popArgs1();
    }
}

procedure {:inline 1} cool_step();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies temp;
requires(((0.0) <= (temp)) && ((temp) <= (100.0)));
ensures(((0.0) <= (temp)) && ((temp) <= (100.0)));
implementation cool_step()
{
    var loc1: real;
    var entry_sp: int;
    entry_sp := $sp;
    loc1 := 0.0;
    call push(temp);
    call loc1 := popArgs1();
    call push(loc1);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(loc1);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call temp := popArgs1();
    }
}

procedure {:inline 1} CorralChoice_sanity_check2_correct();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies temp;
requires(((0.0) <= (temp)) && ((temp) <= (100.0)));
ensures(((0.0) <= (temp)) && ((temp) <= (100.0)));
implementation CorralChoice_sanity_check2_correct()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (2)));
    if ((c) == (0)) {
        call heat_step();
        assert (((0.0) <= (temp)) && ((temp) <= (100.0)));
    } else if ((c) == (1)) {
        call cool_step();
        assert (((0.0) <= (temp)) && ((temp) <= (100.0)));
    }
}

procedure BoogieEntry_sanity_check2_correct();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies temp;
requires(((0.0) <= (temp)) && ((temp) <= (100.0)));
ensures(((0.0) <= (temp)) && ((temp) <= (100.0)));
implementation BoogieEntry_sanity_check2_correct()
{
    var c: int;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    invariant ((0.0) <= (temp)) && ((temp) <= (100.0));
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (2)));
        if ((c) == (0)) {
            call heat_step();
        } else if ((c) == (1)) {
            call cool_step();
        }
    }
}

procedure CorralEntry_sanity_check2_correct();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies temp;
requires(((0.0) <= (temp)) && ((temp) <= (100.0)));
ensures(((0.0) <= (temp)) && ((temp) <= (100.0)));
implementation CorralEntry_sanity_check2_correct()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice_sanity_check2_correct();
    }
}

