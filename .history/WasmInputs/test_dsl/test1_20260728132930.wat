(module
  (;@requires $sp >= 0;)
  (;@ensures $stack[old($sp)].value_i32 == 3;)

  (func $push_three
    (result i32)

    (i32.const 3)
  )

  (export "push_three" (func $push_three))
)