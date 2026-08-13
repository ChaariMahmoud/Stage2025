(module

(;@ensures $stack[old($sp)].value_i32 == 1;)
  (func $test_sub_mul_eq (result i32)
    i32.const 7
    i32.const 2
    i32.sub

    i32.const 3
    i32.mul

    i32.const 15
    i32.eq
  )
)