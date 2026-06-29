(module
  (func (result i32)
    (block $exit (result i32)
      (loop $L
        i32.const 42
        br $exit
      )
    )
  )
)