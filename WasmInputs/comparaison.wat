(module
  (func (export "test_eq") (result i32)
    i32.const 10
    i32.const 10
    i32.eq
  )

  (func (export "test_lt") (result i32)
    i32.const 10
    i32.const 32
    i32.lt_s
  )

  (func (export "test_gt") (result i32)
    i32.const 32
    i32.const 10
    i32.gt_s
  )
)