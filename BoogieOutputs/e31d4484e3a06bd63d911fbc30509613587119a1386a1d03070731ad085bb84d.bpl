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

procedure {:inline 1} test();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation test()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(1.0);
    call push(3.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(4.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(5.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(6.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
    call push(7.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) + ($tmp1));
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

procedure {:inline 1} CorralChoice_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralChoice_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (1)));
    if ((c) == (0)) {
        call test();
        call popDiscard1();
    }
}

procedure BoogieEntry_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation BoogieEntry_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d()
{
    var c: int;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (1)));
        if ((c) == (0)) {
            call test();
            call popDiscard1();
        }
    }
}

procedure CorralEntry_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralEntry_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice_e31d4484e3a06bd63d911fbc30509613587119a1386a1d03070731ad085bb84d();
    }
}

