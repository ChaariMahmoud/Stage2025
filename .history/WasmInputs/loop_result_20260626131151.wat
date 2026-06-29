(module
  (func (result i32)
    (block (result i32)
      i32.const 42

      (loop (result i32)
        br 1
      )
    )
  )
)