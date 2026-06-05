var $stack: [int]real;
var $sp: int;
var $tmp1: real;
var $tmp2: real;
var $tmp3: real;
function real_to_int(r: real) returns (result: int);
function int_to_real(i: int) returns (result: real);
function bits32_to_real(i: int) returns (result: real);
function bits64_to_real(i: int) returns (result: real);
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

procedure {:inline 1} func_0();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation func_0()
{
    var entry_sp: int;
    var idx: int;
    var load_i: int;
    var store_i: int;
    entry_sp := $sp;
    call push(0.0);
    // // wrap: no-op under real semantics
    call pop();
    // // unhandled raw instruction: i64.extend_i32_u
    call pop();
    // // unhandled raw instruction: i64.extend_i32_s
    call pop();
    // // unhandled raw instruction: i32.trunc_f32_s
    call pop();
    // // unhandled raw instruction: i32.trunc_f32_u
    call pop();
    // // unhandled raw instruction: i32.trunc_f64_s
    call pop();
    // // unhandled raw instruction: i32.trunc_f64_u
    call pop();
    // // unhandled raw instruction: i64.trunc_f32_s
    call pop();
    // // unhandled raw instruction: i64.trunc_f32_u
    call pop();
    // // unhandled raw instruction: i64.trunc_f64_s
    call pop();
    // // unhandled raw instruction: i64.trunc_f64_u
    call pop();
    // // unhandled raw instruction: f32.convert_i32_s
    call pop();
    // // unhandled raw instruction: f32.convert_i32_u
    call pop();
    // // unhandled raw instruction: f32.convert_i64_s
    call pop();
    // // unhandled raw instruction: f32.convert_i64_u
    call pop();
    // // unhandled raw instruction: f64.convert_i32_s
    call pop();
    // // unhandled raw instruction: f64.convert_i32_u
    call pop();
    // // unhandled raw instruction: f64.convert_i64_s
    call pop();
    // // unhandled raw instruction: f64.convert_i64_u
    call pop();
    // // unhandled raw instruction: f32.demote_f64
    call pop();
    // // unhandled raw instruction: f64.promote_f32
    call pop();
}

procedure {:inline 1} CorralChoice__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralChoice__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433()
{
    var c: int;
    havoc c;
    assume (((0) <= (c)) && ((c) < (1)));
    if ((c) == (0)) {
        call func_0();
    }
}

procedure BoogieEntry__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation BoogieEntry__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433()
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
            call func_0();
        }
    }
}

procedure CorralEntry__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433();
modifies $tmp1;
modifies $tmp2;
modifies $tmp3;
modifies $sp;
modifies $stack;
implementation CorralEntry__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433()
{
    call InitRuntime();
    call initGlobals();
    while (true)
    {
        call CorralChoice__0bb4d0e525286a0340113cd31b9491ea34e67446663bd83db445168ea1e6c433();
    }
}

