(module
  (func (export "main")
    (drop
      (i32.rem_s
        (i32.const 17)
        (i32.const 5)
      )
    )

    (drop
      (i32.rem_u
        (i32.const 17)
        (i32.const 5)
      )
    )

    (drop
      (i64.rem_s
        (i64.const 20)
        (i64.const 6)
      )
    )

    (drop
      (i64.rem_u
        (i64.const 20)
        (i64.const 6)
      )
    )
  )
)