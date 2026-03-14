var $stack: [int]real;

var $sp: int;

var $tmp1: real;

var $tmp2: real;

var $tmp3: real;

function bool_to_real(b: bool) : real;

axiom (forall b: bool :: { bool_to_real(b): real } bool_to_real(b): real == (if b then 1e0 else 0e0));

function real_to_bool(r: real) : bool;

axiom (forall r: real :: { real_to_bool(r): bool } real_to_bool(r): bool <==> (if r == 0e0 then false else true));

axiom (forall b: bool :: { bool_to_real(b) } bool_to_real(b) == 0e0 || bool_to_real(b) == 1e0);

axiom (forall b: bool :: { real_to_bool(bool_to_real(b)) } real_to_bool(bool_to_real(b)) <==> b);

axiom (forall r: real :: { real_to_bool(r) } real_to_bool(r) <==> false <==> r == 0e0);

procedure InitRuntime();
  modifies $sp, $tmp1, $tmp2, $tmp3;
  ensures $sp == 0;
  ensures 0 <= $sp;



implementation {:ForceInline} InitRuntime()
{

  anon0:
    $sp := 0;
    $tmp1 := 0e0;
    $tmp2 := 0e0;
    $tmp3 := 0e0;
    return;
}



procedure push(val: real);
  requires 0 <= $sp;
  modifies $stack, $sp;
  ensures $sp == old($sp) + 1;
  ensures $stack[old($sp)] == val;
  ensures (forall i: int :: i != old($sp) ==> $stack[i] == old($stack)[i]);
  ensures 0 <= $sp;



implementation {:ForceInline} push(val: real)
{

  anon0:
    $stack[$sp] := val;
    $sp := $sp + 1;
    return;
}



procedure popToTmp1();
  requires $sp > 0;
  modifies $sp, $tmp1;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp1 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation {:ForceInline} popToTmp1()
{

  anon0:
    $sp := $sp - 1;
    $tmp1 := $stack[$sp];
    return;
}



procedure popToTmp2();
  requires $sp > 0;
  modifies $sp, $tmp2;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp2 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation {:ForceInline} popToTmp2()
{

  anon0:
    $sp := $sp - 1;
    $tmp2 := $stack[$sp];
    return;
}



procedure popToTmp3();
  requires $sp > 0;
  modifies $sp, $tmp3;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp3 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



procedure pop();
  requires $sp > 0;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;



var temp: real;

procedure initGlobals();
  modifies temp;
  ensures temp == 98e0;



implementation {:ForceInline} initGlobals()
{

  anon0:
    temp := 98e0;
    return;
}



procedure popArgs1() returns (a1: real);
  requires $sp >= 1;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures a1 == old($stack)[old($sp) - 1];



implementation {:ForceInline} popArgs1() returns (a1: real)
{

  anon0:
    $sp := $sp - 1;
    a1 := $stack[$sp];
    return;
}



procedure heat_step();
  requires 0e0 <= temp && temp <= 1e2;
  modifies $stack, $sp, $tmp1, $tmp2, temp;
  ensures 0e0 <= temp && temp <= 1e2;



implementation {:ForceInline} heat_step()
{
  var loc1: real;
  var entry_sp: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    call {:si_unique_call 0} push(temp);
    call {:si_unique_call 1} loc1 := popArgs1();
    call {:si_unique_call 2} push(loc1);
    call {:si_unique_call 3} push(1e2);
    call {:si_unique_call 4} popToTmp1();
    call {:si_unique_call 5} popToTmp2();
    call {:si_unique_call 6} push(bool_to_real($tmp2 <= $tmp1));
    call {:si_unique_call 7} popToTmp1();
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} real_to_bool($tmp1);
    call {:si_unique_call 8} push(loc1);
    call {:si_unique_call 9} push(1e0);
    call {:si_unique_call 10} popToTmp1();
    call {:si_unique_call 11} popToTmp2();
    call {:si_unique_call 12} push($tmp2 + $tmp1);
    call {:si_unique_call 13} temp := popArgs1();
    return;

  anon2_Else:
    assume {:partition} !real_to_bool($tmp1);
    return;
}



procedure cool_step();
  requires 0e0 <= temp && temp <= 1e2;
  modifies $stack, $sp, $tmp1, $tmp2, temp;
  ensures 0e0 <= temp && temp <= 1e2;



implementation {:ForceInline} cool_step()
{
  var loc1: real;
  var entry_sp: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    call {:si_unique_call 14} push(temp);
    call {:si_unique_call 15} loc1 := popArgs1();
    call {:si_unique_call 16} push(loc1);
    call {:si_unique_call 17} push(1e0);
    call {:si_unique_call 18} popToTmp1();
    call {:si_unique_call 19} popToTmp2();
    call {:si_unique_call 20} push(bool_to_real($tmp2 >= $tmp1));
    call {:si_unique_call 21} popToTmp1();
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} real_to_bool($tmp1);
    call {:si_unique_call 22} push(loc1);
    call {:si_unique_call 23} push(1e0);
    call {:si_unique_call 24} popToTmp1();
    call {:si_unique_call 25} popToTmp2();
    call {:si_unique_call 26} push($tmp2 - $tmp1);
    call {:si_unique_call 27} temp := popArgs1();
    return;

  anon2_Else:
    assume {:partition} !real_to_bool($tmp1);
    return;
}



procedure CorralChoice_sanity_check2_violeted();
  requires 0e0 <= temp && temp <= 1e2;
  modifies $stack, $sp, $tmp1, $tmp2, temp;
  ensures 0e0 <= temp && temp <= 1e2;



implementation {:ForceInline} CorralChoice_sanity_check2_violeted()
{
  var c: int;

  anon0:
    havoc c;
    assume 0 <= c && c < 2;
    goto anon3_Then, anon3_Else;

  anon3_Then:
    assume {:partition} c == 0;
    call {:si_unique_call 28} heat_step();
    assert 0e0 <= temp && temp <= 1e2;
    return;

  anon3_Else:
    assume {:partition} c != 0;
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} c == 1;
    call {:si_unique_call 29} cool_step();
    assert 0e0 <= temp && temp <= 1e2;
    return;

  anon4_Else:
    assume {:partition} c != 1;
    return;
}



procedure BoogieEntry_sanity_check2_violeted();
  requires 0e0 <= temp && temp <= 1e2;
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, temp;
  ensures 0e0 <= temp && temp <= 1e2;



procedure CorralEntry_sanity_check2_violeted();
  requires 0e0 <= temp && temp <= 1e2;
  modifies $sp, $tmp1, $tmp2, $tmp3, temp, $stack;
  ensures 0e0 <= temp && temp <= 1e2;



implementation CorralEntry_sanity_check2_violeted()
{

  anon0:
    call {:si_unique_call 30} InitRuntime();
    call {:si_unique_call 31} initGlobals();
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call {:si_unique_call 32} CorralChoice_sanity_check2_violeted();
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


