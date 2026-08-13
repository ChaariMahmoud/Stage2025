(module
  (func (export "test_i32_eqz_true") (result i32)
    i32.const 0
    i32.eqz
  )

  (func (export "test_i32_eqz_false") (result i32)
    i32.const 42
    i32.eqz
  )

  (func (export "test_i64_eqz") (result i32)
    i64.const 0
    i64.eqz
  )

  (func (export "test_f32_neg") (result f32)
    f32.const 10.5
    f32.neg
  )

  (func (export "test_f64_abs") (result f64)
    f64.const -3.14
    f64.abs
  )

  (func (export "test_f64_sqrt") (result f64)
    f64.const 16.0
    f64.sqrt
  )

  (func (export "test_f32_floor") (result f32)
    f32.const 3.7
    f32.floor
  )

  (func (export "test_f64_nearest") (result f64)
    f64.const 3.6
    f64.nearest
  )

  (func (export "test_wrap") (result i32)
    i64.const 42
    i32.wrap_i64
  )
)