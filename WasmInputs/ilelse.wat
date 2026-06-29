(module
  (func $example
    i32.const 5
    i32.const 7
    i32.lt_s

    if
      i32.const 100
      drop
    else
      i32.const 200
      drop
    end
  )
)