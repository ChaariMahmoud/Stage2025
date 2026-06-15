(module
  (func (export "main")

    ;; table.size
    (drop
      (table.size)
    )

    ;; table.set avec une valeur abstraite real
    (table.set
      (i32.const 0)
      (f32.const 42)
    )

    ;; table.get
    (drop
      (table.get
        (i32.const 0)
      )
    )

    ;; table.grow avec valeur f32 et delta i32
    (drop
      (table.grow
        (f32.const 123)
        (i32.const 2)
      )
    )

    ;; table.size après grow
    (drop
      (table.size)
    )
  )
)