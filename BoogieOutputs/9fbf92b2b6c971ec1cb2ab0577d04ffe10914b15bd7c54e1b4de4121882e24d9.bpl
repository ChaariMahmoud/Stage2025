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

var global_0: real;
const global_1: real;

axiom((global_1) == (66560.0));
const global_2: real;

axiom((global_2) == (1024.0));
procedure {:inline 1} initGlobals();
modifies global_0;
ensures((global_0) == (66560.0));
implementation initGlobals()
{
    global_0 := 66560.0;
}

procedure {:inline 1} hello();
modifies $tmp1;
modifies $sp;
modifies $stack;
implementation hello()
{
}

procedure {:inline 1} _start();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _start()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
}

procedure {:inline 1} _Z21trigger_generic_monosv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _Z21trigger_generic_monosv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call _Z7genericI4ZeroEvv();
    call _Z7genericI3OneEvv();
    call _Z7genericI3TwoEvv();
}

procedure {:inline 1} _Z7genericI4ZeroEvv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _Z7genericI4ZeroEvv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(1.0);
    call hello();
}

procedure {:inline 1} _Z7genericI3OneEvv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _Z7genericI3OneEvv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(2.0);
    call hello();
}

procedure {:inline 1} _Z7genericI3TwoEvv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _Z7genericI3TwoEvv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(3.0);
    call hello();
}

procedure {:inline 1} _ZN4Zero4codeEv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _ZN4Zero4codeEv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(0.0);
}

procedure {:inline 1} _ZN3One4codeEv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _ZN3One4codeEv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(1.0);
}

procedure {:inline 1} _ZN3Two4codeEv();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation _ZN3Two4codeEv()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(2.0);
}

procedure {:inline 1} main();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation main()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(42.0);
}

procedure {:inline 1} __wasm_call_ctors();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation __wasm_call_ctors()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
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

procedure {:inline 1} CorralChoice__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation CorralChoice__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (10)));
    if ((c) == (0)) {
        call _start();
    } else if ((c) == (1)) {
        call _Z21trigger_generic_monosv();
    } else if ((c) == (2)) {
        call _Z7genericI4ZeroEvv();
    } else if ((c) == (3)) {
        call _Z7genericI3OneEvv();
    } else if ((c) == (4)) {
        call _Z7genericI3TwoEvv();
    } else if ((c) == (5)) {
        call _ZN4Zero4codeEv();
        call popDiscard1();
    } else if ((c) == (6)) {
        call _ZN3One4codeEv();
        call popDiscard1();
    } else if ((c) == (7)) {
        call _ZN3Two4codeEv();
        call popDiscard1();
    } else if ((c) == (8)) {
        call main();
        call popDiscard1();
    } else if ((c) == (9)) {
        call __wasm_call_ctors();
    }
}

procedure BoogieEntry__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation BoogieEntry__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9()
{
    var c: int;
    call initGlobals();
    call InitRuntime();
    while (true)
    invariant (0) <= ($sp);
    {
        havoc c;
        assume (((0) <= (c)) && ((c) < (10)));
        if ((c) == (0)) {
            call _start();
        } else if ((c) == (1)) {
            call _Z21trigger_generic_monosv();
        } else if ((c) == (2)) {
            call _Z7genericI4ZeroEvv();
        } else if ((c) == (3)) {
            call _Z7genericI3OneEvv();
        } else if ((c) == (4)) {
            call _Z7genericI3TwoEvv();
        } else if ((c) == (5)) {
            call _ZN4Zero4codeEv();
            call popDiscard1();
        } else if ((c) == (6)) {
            call _ZN3One4codeEv();
            call popDiscard1();
        } else if ((c) == (7)) {
            call _ZN3Two4codeEv();
            call popDiscard1();
        } else if ((c) == (8)) {
            call main();
            call popDiscard1();
        } else if ((c) == (9)) {
            call __wasm_call_ctors();
        }
    }
}

procedure CorralEntry__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
modifies global_0;
implementation CorralEntry__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__9fbf92b2b6c971ec1cb2ab0577d04ffe10914b15bd7c54e1b4de4121882e24d9();
    }
}

