(module
(;@ensures $stack[old($sp)]->value_i32 == 12;)
  (func $test_i32_mul (result i32)
    i32.const 3
    i32.const 4
    i32.mul
  )
)