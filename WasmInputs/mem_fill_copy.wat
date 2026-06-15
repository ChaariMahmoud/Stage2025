(module
  (memory 1)

  (func (export "main")
    (memory.fill
      (i32.const 0)
      (i32.const 255)
      (i32.const 10)
    )

    (memory.copy
      (i32.const 20)
      (i32.const 0)
      (i32.const 10)
    )
  )
)