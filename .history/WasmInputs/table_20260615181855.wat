(module
  (table 4 funcref)

  (func (export "main")

    ;; table.size
    (drop
      (table.size)
    )

    ;; table.set
    (table.set
      (i32.const 0)
      (ref.null func)
    )

    ;; table.get
    (drop
      (table.get
        (i32.const 0)
      )
    )

    ;; table.grow
    (drop
      (table.grow
        (ref.null func)
        (i32.const 2)
      )
    )

    ;; table.size après grow
    (drop
      (table.size)
    )
  )
)