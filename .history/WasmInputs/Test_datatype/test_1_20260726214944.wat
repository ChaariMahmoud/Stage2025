(module
  (;@inv 0 <= $sp;)

  (;@requires 0 <= $sp;)
  (;@ensures  0 <= $sp;)
  (;@ensures  $stack[$sp - 1] is I32;)
  (;@ensures  $stack[$sp - 1]->value_i32 == 1;)

  (func $test_i32_result (result i32)
    i32.const -1
    i32.const 1
    i32.add
    i32.eqz
  )
)