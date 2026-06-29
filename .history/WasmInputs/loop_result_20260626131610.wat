(module
  (func (result i32)
    (block (result i32)
      (loop
        i32.const 42
        br 1
      )
      unreachable
    )
  )
)