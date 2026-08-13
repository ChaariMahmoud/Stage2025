(module
(;@ensures $stack[old($sp)]->value_i32 == 0;)
  (func $test_unsigned_lt (result i32)
    i32.const -1
    i32.const 1
    i32.lt_u
  )
)