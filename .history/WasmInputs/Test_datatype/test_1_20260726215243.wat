(module
  (;@inv true == true;)

  (;@requires true == true;)
  (;@ensures  true == true;)

  (func $test_simple
    i32.const 1
    drop
  )
)