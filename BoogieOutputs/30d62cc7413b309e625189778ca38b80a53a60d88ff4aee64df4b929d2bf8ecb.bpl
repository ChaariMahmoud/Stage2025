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

var global_0: real;
procedure {:inline 1} initGlobals();
modifies global_0;
ensures((global_0) == (10.0));
implementation initGlobals()
{
    global_0 := 10.0;
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

procedure {:inline 1} func_0();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_0()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto func_exit_1;
    }
    call push(global_0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_0 := popArgs1();
func_exit_1:
}

procedure {:inline 1} func_1();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_1()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(global_0);
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(global_0);
        call push(1.0);
        call popToTmp1();
        call popToTmp2();
        call push(($tmp2) - ($tmp1));
        call global_0 := popArgs1();
    }
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

procedure {:inline 1} func_2();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_2()
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
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        goto func_exit_3;
    }
    call push(global_0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_0 := popArgs1();
    call push(67108864.0);
func_exit_3:
}

procedure {:inline 1} popArgs7() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real);
modifies $sp;
modifies $stack;
requires(($sp) >= (7));
ensures(($sp) == ((old($sp)) - (7)));
ensures((0) <= ($sp));
ensures(forall  i:int ::  (($stack[i]) == (old($stack)[i])));
ensures((a1) == (old($stack)[(old($sp)) - (7)]));
ensures((a2) == (old($stack)[(old($sp)) - (6)]));
ensures((a3) == (old($stack)[(old($sp)) - (5)]));
ensures((a4) == (old($stack)[(old($sp)) - (4)]));
ensures((a5) == (old($stack)[(old($sp)) - (3)]));
ensures((a6) == (old($stack)[(old($sp)) - (2)]));
ensures((a7) == (old($stack)[(old($sp)) - (1)]));
implementation popArgs7() returns (a1: real, a2: real, a3: real, a4: real, a5: real, a6: real, a7: real)
{
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

procedure {:inline 1} func_3();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_3()
{
    var arg1: real;
    var arg2: real;
    var arg3: real;
    var arg4: real;
    var arg5: real;
    var arg6: real;
    var arg7: real;
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    assume (($sp) >= (7));
    call arg1, arg2, arg3, arg4, arg5, arg6, arg7 := popArgs7();
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        call push(0.0);
        goto func_exit_5;
    }
    call push(global_0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_0 := popArgs1();
    // // unsupported const value: -nan:0xffffffffffff2
func_exit_5:
}

procedure {:inline 1} func_4();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_4()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$1_end_6;
    }
    call push(global_0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_0 := popArgs1();
label$1_end_6:
    call push(global_0);
    call popToTmp1();
    call push(bool_to_real(($tmp1) == (0.0)));
    call popToTmp1();
    if (real_to_bool($tmp1)) {
        goto label$2_end_7;
    }
    call push(global_0);
    call push(1.0);
    call popToTmp1();
    call popToTmp2();
    call push(($tmp2) - ($tmp1));
    call global_0 := popArgs1();
label$2_end_7:
}

procedure {:inline 1} func_5();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation func_5()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(10.0);
    call global_0 := popArgs1();
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

procedure {:inline 1} CorralChoice__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation CorralChoice__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb()
{
    var c: int;
    var argTmp: real;
    havoc c;
    assume (((0) <= (c)) && ((c) < (6)));
    if ((c) == (0)) {
        call func_0();
    } else if ((c) == (1)) {
        call func_1();
    } else if ((c) == (2)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_2();
        call popDiscard1();
    } else if ((c) == (3)) {
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        call push(argTmp);
        havoc argTmp;
        assume ((argTmp) == (real(int(argTmp))));
        call push(argTmp);
        call func_3();
        call popDiscard1();
    } else if ((c) == (4)) {
        call func_4();
    } else if ((c) == (5)) {
        call func_5();
    }
}

procedure BoogieEntry__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation BoogieEntry__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb()
{
    var c: int;
    var argTmp: real;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (6)));
        if ((c) == (0)) {
            call func_0();
        } else if ((c) == (1)) {
            call func_1();
        } else if ((c) == (2)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_2();
            call popDiscard1();
        } else if ((c) == (3)) {
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            call push(argTmp);
            havoc argTmp;
            assume ((argTmp) == (real(int(argTmp))));
            call push(argTmp);
            call func_3();
            call popDiscard1();
        } else if ((c) == (4)) {
            call func_4();
        } else if ((c) == (5)) {
            call func_5();
        }
    }
}

procedure CorralEntry__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation CorralEntry__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__30d62cc7413b309e625189778ca38b80a53a60d88ff4aee64df4b929d2bf8ecb();
    }
}

