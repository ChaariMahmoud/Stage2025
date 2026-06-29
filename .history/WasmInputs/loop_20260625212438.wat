(module
  (func $loop_example
    (loop $L
      (i32.add
        (i32.const 5)
        (i32.const 7)
      )
      drop
      br $L
    )
  )
)