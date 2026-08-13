(module
(;@ensures $stack[old($sp)]->value_i32 == 1;)
  (func $test_signed_lt (result i32)
    i32.const -1
    i32.const 1
    i32.lt_s
  )
)