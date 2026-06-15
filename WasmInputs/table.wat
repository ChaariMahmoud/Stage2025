(module
  (table 4 funcref)

  (func (export "main")

    ;; table.size
    (drop
      (table.size)
    )

    ;; table.set: index + funcref
    (table.set
      (i32.const 0)
      (ref.null func)
    )

    ;; table.get retourne funcref
    (drop
      (table.get
        (i32.const 0)
      )
    )

    ;; table.grow: funcref + delta
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