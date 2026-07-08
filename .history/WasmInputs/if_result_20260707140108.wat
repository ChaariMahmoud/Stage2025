(module
  (func (result i32)
    i32.const 5
    i32.const 3
    i32.gt_s

    (if (result i32)
      (then
        i32.const 100
      )
      (else
        i32.const 200
      )
    )
  )
)