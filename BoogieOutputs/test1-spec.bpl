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
procedure {:inline true} InitRuntime(); 
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

procedure {:inline true} push(val: real);
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

procedure {:inline true} popToTmp1();
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

procedure {:inline true} popToTmp2();
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

procedure {:inline true} popToTmp3();
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

procedure {:inline true} pop();
modifies $sp;
requires(($sp) > (0));
ensures(($sp) == ((old($sp)) - (1)));
ensures((0) <= ($sp));
implementation pop()
{
    $sp := ($sp) - (1);
}

const MAX_BALANCE: real;

axiom((MAX_BALANCE) == (100.0));
var balance: real;
var locked: real;
procedure initGlobals();
modifies balance;
modifies locked;
ensures((balance) == (0.0));
ensures((locked) == (0.0));
implementation initGlobals()
{
    balance := 0.0;
    locked := 0.0;
}

procedure {:inline true} popArgs2() returns (a1: real, a2: real);
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

procedure {:inline true} popArgs1() returns (a1: real);
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

procedure deposit();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies balance;
requires((((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE))) && ((locked) == (0.0)));
ensures(((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE)));
implementation deposit()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    call push(locked);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) == ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
    } else {
        call push(balance);
        call push(arg1);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) + ($tmp1));
        call arg2 := popArgs1();
        call push(arg2);
        call push(MAX_BALANCE);
        call popToTmp1();
        call popToTmp2();
        call push(bool_to_real(($tmp2) <= ($tmp1)));
        call popToTmp1();
        if (real_to_bool($tmp1)) {
            call push(arg2);
            call balance := popArgs1();
        }
    }
}

procedure withdraw();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies balance;
requires((((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE))) && ((locked) == (0.0)));
ensures(((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE)));
implementation withdraw()
{
    var arg1: real;
    var arg2: real;
    var loc1: real;
    var entry_sp: int;
    entry_sp := $sp;
    assume (($sp) >= (2));
    call arg1, arg2 := popArgs2();
    loc1 := 0.0;
    call push(balance);
    call push(arg1);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call arg2 := popArgs1();
    call push(arg2);
    call push(0.0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real(($tmp2) >= ($tmp1)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(arg2);
        call balance := popArgs1();
    }
}

procedure lock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies locked;
requires(((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE)));
ensures((locked) == (1.0));
implementation lock()
{
    var entry_sp: int;
    entry_sp := $sp;
    call push(1.0);
    call locked := popArgs1();
}

procedure unlock();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies locked;
requires((locked) == (1.0));
ensures((locked) == (0.0));
implementation unlock()
{
    var entry_sp: int;
    entry_sp := $sp;
    call push(0.0);
    call locked := popArgs1();
}

procedure CorralChoice_test1_spec();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies balance;
modifies locked;
implementation CorralChoice_test1_spec()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (4)));
    if ((c) == (0)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call deposit();
    } else if ((c) == (1)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        call withdraw();
    } else if ((c) == (2)) {
        call lock();
    } else if ((c) == (3)) {
        call unlock();
    }
}

procedure BoogieEntry_test1_spec();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies balance;
modifies locked;
implementation BoogieEntry_test1_spec()
{
    call InitRuntime();
    call initGlobals();
    call CorralChoice_test1_spec();
}

procedure CorralEntry_test1_spec();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies balance;
modifies locked;
implementation CorralEntry_test1_spec()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    invariant (((0.0) <= (balance)) && ((balance) <= (MAX_BALANCE))) && ((locked) == (0.0));
    {
        call InitRuntime();
        call CorralChoice_test1_spec();
    }
}

