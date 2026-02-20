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



implementation {:ForceInline} initGlobals()
{

  anon0:
    active_requests := 0e0;
    return;
}



procedure popArgs1() returns (a1: real);
  requires $sp >= 1;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;
  ensures a1 == old($stack)[old($sp) - 1];



implementation {:ForceInline} popArgs1() returns (a1: real)
{

  anon0:
    $sp := $sp - 1;
    a1 := $stack[$sp];
    return;
}



procedure acquire_request();
  requires 0e0 <= active_requests && active_requests <= MAX_REQUESTS;
  modifies $stack, $sp, $tmp1, $tmp2, active_requests;
  ensures 0e0 <= active_requests && active_requests <= MAX_REQUESTS;



implementation {:ForceInline} acquire_request()
{
  var loc1: real;
  var loc2: real;
  var entry_sp: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    loc2 := 0e0;
    call {:si_unique_call 0} push(active_requests);
    call {:si_unique_call 1} loc1 := popArgs1();
    call {:si_unique_call 2} push(loc1);
    call {:si_unique_call 3} push(MAX_REQUESTS);
    call {:si_unique_call 4} popToTmp1();
    call {:si_unique_call 5} popToTmp2();
    call {:si_unique_call 6} push(bool_to_real($tmp2 >= $tmp1));
    call {:si_unique_call 7} popToTmp1();
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} real_to_bool($tmp1);
    call {:si_unique_call 8} push(0e0);
    call {:si_unique_call 9} loc2 := popArgs1();
    goto anon3;

  anon4_Else:
    assume {:partition} !real_to_bool($tmp1);
    call {:si_unique_call 10} push(loc1);
    call {:si_unique_call 11} push(3e0);
    call {:si_unique_call 12} popToTmp1();
    call {:si_unique_call 13} popToTmp2();
    call {:si_unique_call 14} push($tmp2 + $tmp1);
    call {:si_unique_call 15} active_requests := popArgs1();
    call {:si_unique_call 16} push(1e0);
    call {:si_unique_call 17} loc2 := popArgs1();
    goto anon3;

  anon3:
    call {:si_unique_call 18} push(loc2);
    return;
}



procedure release_request();
  requires 0e0 <= active_requests && active_requests <= MAX_REQUESTS;
  modifies $stack, $sp, $tmp1, $tmp2, active_requests;
  ensures 0e0 <= active_requests && active_requests <= MAX_REQUESTS;



implementation {:ForceInline} release_request()
{
  var loc1: real;
  var entry_sp: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    call {:si_unique_call 19} push(active_requests);
    call {:si_unique_call 20} loc1 := popArgs1();
    call {:si_unique_call 21} push(loc1);
    call {:si_unique_call 22} push(0e0);
    call {:si_unique_call 23} popToTmp1();
    call {:si_unique_call 24} popToTmp2();
    call {:si_unique_call 25} push(bool_to_real($tmp2 > $tmp1));
    call {:si_unique_call 26} popToTmp1();
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} real_to_bool($tmp1);
    call {:si_unique_call 27} push(loc1);
    call {:si_unique_call 28} push(1e0);
    call {:si_unique_call 29} popToTmp1();
    call {:si_unique_call 30} popToTmp2();
    call {:si_unique_call 31} push($tmp2 - $tmp1);
    call {:si_unique_call 32} active_requests := popArgs1();
    return;

  anon2_Else:
    assume {:partition} !real_to_bool($tmp1);
    return;
}



procedure popDiscard1();
  requires $sp >= 1;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;



implementation {:ForceInline} popDiscard1()
{

  anon0:
    $sp := $sp - 1;
    return;
}



procedure CorralChoice_request();
  requires 0e0 <= active_requests && active_requests <= MAX_REQUESTS;
  modifies $stack, $sp, $tmp1, $tmp2, active_requests;
  ensures 0e0 <= active_requests && active_requests <= MAX_REQUESTS;



implementation {:ForceInline} CorralChoice_request()
{
  var c: int;

  anon0:
    havoc c;
    assume 0 <= c && c < 2;
    goto anon3_Then, anon3_Else;

  anon3_Then:
    assume {:partition} c == 0;
    call {:si_unique_call 33} acquire_request();
    call {:si_unique_call 34} popDiscard1();
    return;

  anon3_Else:
    assume {:partition} c != 0;
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} c == 1;
    call {:si_unique_call 35} release_request();
    return;

  anon4_Else:
    assume {:partition} c != 1;
    return;
}



procedure BoogieEntry_request();
  requires 0e0 <= active_requests && active_requests <= MAX_REQUESTS;
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;
  ensures 0e0 <= active_requests && active_requests <= MAX_REQUESTS;



procedure CorralEntry_request();
  modifies $sp, $tmp1, $tmp2, $tmp3, active_requests, $stack;



implementation CorralEntry_request()
{

  anon0:
    call {:si_unique_call 36} InitRuntime();
    call {:si_unique_call 37} initGlobals();
    goto anon2_LoopHead;

  anon2_LoopHead:
    assert 0e0 <= active_requests;
    assert active_requests <= MAX_REQUESTS;
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call {:si_unique_call 38} CorralChoice_request();
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


