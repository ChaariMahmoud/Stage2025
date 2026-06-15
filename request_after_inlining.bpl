// Boogie program verifier version 3.5.5.0, Copyright (c) 2003-2014, Microsoft.
// Command Line Options: /trace /tracePOs /errorTrace:2 /proc:BoogieEntry_request /inline:spec /inlineDepth:4 /printInstrumented /print:request_after_inlining.bpl BoogieOutputs/request.bpl

var $stack: [int]real;

var $sp: int;

var $tmp1: real;

var $tmp2: real;

var $tmp3: real;

function bool_to_real(b: bool) : real
uses {
axiom (forall b: bool :: 
  { bool_to_real(b): real } 
  bool_to_real(b): real == (if b then 1e0 else 0e0));
}

function real_to_bool(r: real) : bool
uses {
axiom (forall r: real :: 
  { real_to_bool(r): bool } 
  real_to_bool(r): bool == (if r == 0e0 then false else true));
}

axiom (forall b: bool :: 
  { bool_to_real(b) } 
  bool_to_real(b) == 0e0 || bool_to_real(b) == 1e0);

axiom (forall b: bool :: 
  { real_to_bool(bool_to_real(b)) } 
  real_to_bool(bool_to_real(b)) == b);

axiom (forall r: real :: { real_to_bool(r) } real_to_bool(r) == false <==> r == 0e0);

procedure {:inline 1} InitRuntime();
  modifies $sp, $tmp1, $tmp2, $tmp3;
  ensures $sp == 0;
  ensures 0 <= $sp;



implementation InitRuntime()
{

  anon0:
    $sp := 0;
    $tmp1 := 0e0;
    $tmp2 := 0e0;
    $tmp3 := 0e0;
    return;
}



procedure {:inline 1} push(val: real);
  requires 0 <= $sp;
  modifies $sp, $stack;
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



procedure {:inline 1} popToTmp1();
  requires $sp > 0;
  modifies $sp, $tmp1;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp1 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation popToTmp1()
{

  anon0:
    $sp := $sp - 1;
    $tmp1 := $stack[$sp];
    return;
}



procedure {:inline 1} popToTmp2();
  requires $sp > 0;
  modifies $sp, $tmp2;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp2 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation popToTmp2()
{

  anon0:
    $sp := $sp - 1;
    $tmp2 := $stack[$sp];
    return;
}



procedure {:inline 1} popToTmp3();
  requires $sp > 0;
  modifies $sp, $tmp3;
  ensures $sp == old($sp) - 1;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures $tmp3 == old($stack)[old($sp) - 1];
  ensures 0 <= $sp;



implementation popToTmp3()
{

  anon0:
    $sp := $sp - 1;
    $tmp3 := $stack[$sp];
    return;
}



procedure {:inline 1} pop();
  requires $sp > 0;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;



implementation pop()
{

  anon0:
    $sp := $sp - 1;
    return;
}



const MAX_REQUESTS: real;

axiom MAX_REQUESTS == 1e1;

var active_requests: real;

procedure {:inline 1} initGlobals();
  modifies active_requests;
  ensures active_requests == 0e0;



implementation initGlobals()
{

  anon0:
    active_requests := 0e0;
    return;
}



procedure {:inline 1} popArgs1() returns (a1: real);
  requires $sp >= 1;
  modifies $sp, $stack;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;
  ensures (forall i: int :: $stack[i] == old($stack)[i]);
  ensures a1 == old($stack)[old($sp) - 1];



implementation popArgs1() returns (a1: real)
{

  anon0:
    $sp := $sp - 1;
    a1 := $stack[$sp];
    return;
}



procedure {:inline 1} acquire_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;



implementation acquire_request()
{
  var loc1: real;
  var loc2: real;
  var entry_sp: int;
  var idx: int;
  var load_i: int;
  var store_i: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    loc2 := 0e0;
    call push(active_requests);
    call loc1 := popArgs1();
    call push(loc1);
    call push(MAX_REQUESTS);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real($tmp2 >= $tmp1));
    call popToTmp1();
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} real_to_bool($tmp1);
    call push(0e0);
    call loc2 := popArgs1();
    goto anon3;

  anon4_Else:
    assume {:partition} !real_to_bool($tmp1);
    call push(loc1);
    call push(1e0);
    call popToTmp1();
    call popToTmp2();
    call push($tmp2 + $tmp1);
    call active_requests := popArgs1();
    call push(1e0);
    call loc2 := popArgs1();
    goto anon3;

  anon3:
    call push(loc2);
    return;
}



procedure {:inline 1} release_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;



implementation release_request()
{
  var loc1: real;
  var entry_sp: int;
  var idx: int;
  var load_i: int;
  var store_i: int;

  anon0:
    entry_sp := $sp;
    loc1 := 0e0;
    call push(active_requests);
    call loc1 := popArgs1();
    call push(loc1);
    call push(0e0);
    call popToTmp1();
    call popToTmp2();
    call push(bool_to_real($tmp2 > $tmp1));
    call popToTmp1();
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} real_to_bool($tmp1);
    call push(loc1);
    call push(1e0);
    call popToTmp1();
    call popToTmp2();
    call push($tmp2 - $tmp1);
    call active_requests := popArgs1();
    return;

  anon2_Else:
    assume {:partition} !real_to_bool($tmp1);
    return;
}



procedure {:inline 1} popDiscard1();
  requires $sp >= 1;
  modifies $sp;
  ensures $sp == old($sp) - 1;
  ensures 0 <= $sp;



implementation popDiscard1()
{

  anon0:
    $sp := $sp - 1;
    return;
}



procedure {:inline 1} CorralChoice_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;



implementation CorralChoice_request()
{
  var c: int;

  anon0:
    havoc c;
    assume 0 <= c && c < 2;
    goto anon3_Then, anon3_Else;

  anon3_Then:
    assume {:partition} c == 0;
    call acquire_request();
    call popDiscard1();
    return;

  anon3_Else:
    assume {:partition} c != 0;
    goto anon4_Then, anon4_Else;

  anon4_Then:
    assume {:partition} c == 1;
    call release_request();
    return;

  anon4_Else:
    assume {:partition} c != 1;
    return;
}



procedure BoogieEntry_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;



implementation BoogieEntry_request()
{
  var c: int;

  anon0:
    call initGlobals();
    call InitRuntime();
    goto anon4_LoopHead;

  anon4_LoopHead:
    assert 0 <= $sp;
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} true;
    havoc c;
    assume 0 <= c && c < 2;
    goto anon5_Then, anon5_Else;

  anon5_Then:
    assume {:partition} c == 0;
    call acquire_request();
    call popDiscard1();
    goto anon4_LoopHead;

  anon5_Else:
    assume {:partition} c != 0;
    goto anon6_Then, anon6_Else;

  anon6_Then:
    assume {:partition} c == 1;
    call release_request();
    goto anon4_LoopHead;

  anon6_Else:
    assume {:partition} c != 1;
    goto anon4_LoopHead;

  anon4_LoopDone:
    assume {:partition} !true;
    return;
}



procedure CorralEntry_request();
  modifies $tmp1, $tmp2, $tmp3, $sp, $stack, active_requests;



implementation CorralEntry_request()
{

  anon0:
    call InitRuntime();
    call initGlobals();
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call CorralChoice_request();
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


