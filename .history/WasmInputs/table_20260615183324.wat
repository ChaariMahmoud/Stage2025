(module
  (table 4 funcref)

  (func (export "main")

    (drop
      (table.size)
    )

    (table.set
      (i32.const 0)
      (f32.const 42)
    )

    (drop
      (table.get
        (i32.const 0)
      )
    )

    (drop
      (table.grow
        (f32.const 123)
        (i32.const 2)
      )
    )

    (drop
      (table.size)
    )
  )
)