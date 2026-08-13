(module

  (func $test_add_result (result i32)
   (;@ensures $stack[old($sp)].value_i32 == 3;)
    i32.const 1
    i32.const 2
    i32.add
  )
)