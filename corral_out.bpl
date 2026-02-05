var $stack: [int]real;

var $sp: int;

var $tmp1: real;

var $tmp2: real;

var $tmp3: real;

function bool_to_real(b: bool) : real;

axiom (forall b: bool :: { bool_to_real(b): real } bool_to_real(b): real == (if b then 1e0 else 0e0));

function real_to_bool(r: real) : bool;

axiom (forall r: real :: { real_to_bool(r): bool } real_to_bool(r): bool <==> (if r == 0e0 then false else true));

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



implementation push(val: real)
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



const MAX_REQUESTS: real;

axiom MAX_REQUESTS == 1e1;

var active_requests: real;

procedure initGlobals();
  modifies active_requests;
  ensures active_requests == 0e0;



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



procedure acquire_request();
  modifies $sp, $tmp1, $tmp2, $tmp3, $stack, active_requests;



implementation acquire_request()
{
  var loc1: real;
  var loc2: real;
  var entry_sp: int;

  anon0:
    entry_sp := $sp;
    call {:si_unique_call 0} InitRuntime();
    loc1 := 0e0;
    loc2 := 0e0;
    call {:si_unique_call 1} push(active_requests);
    call {:si_unique_call 2} loc1 := popArgs1();
    call {:si_unique_call 3} push(loc1);
    call {:si_unique_call 4} push(MAX_REQUESTS);
    call {:si_unique_call 5} popToTmp1();
    call {:si_unique_call 6} popToTmp2();
    call {:si_unique_call 7} push(bool_to_real($tmp2 >= $tmp1));
    call {:si_unique_call 8} popToTmp1();
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} real_to_bool($tmp1);
    call {:si_unique_call 9} push(0e0);
    call {:si_unique_call 10} loc2 := popArgs1();
    goto anon3;

  anon4_Else:
    assume {:partition} !real_to_bool($tmp1);
    call {:si_unique_call 11} push(loc1);
    call {:si_unique_call 12} push(1e0);
    call {:si_unique_call 13} popToTmp1();
    call {:si_unique_call 14} popToTmp2();
    call {:si_unique_call 15} push($tmp2 + $tmp1);
    call {:si_unique_call 16} active_requests := popArgs1();
    call {:si_unique_call 17} push(1e0);
    call {:si_unique_call 18} loc2 := popArgs1();
    goto anon3;

  anon3:
    assert active_requests <= MAX_REQUESTS;
    call {:si_unique_call 19} push(loc2);
    return;
}



procedure release_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;


