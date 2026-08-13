(module
  (func (export "test_i32") (result i32)
    i32.const 10
    i32.const 32
    i32.add
    i32.const 5
    i32.mul
    i32.const 20
    i32.sub
  )

  (func (export "test_i64") (result i64)
    i64.const 100
    i64.const 20
    i64.sub
    i64.const 3
    i64.mul
    i64.const 10
    i64.add
  )

  (func (export "test_f32") (result f32)
    f32.const 10.5
    f32.const 2.0
    f32.add
    f32.const 3.0
    f32.mul
    f32.const 1.5
    f32.sub
  )

  (func (export "test_f64") (result f64)
    f64.const 20.0
    f64.const 4.0
    f64.sub
    f64.const 2.0
    f64.mul
    f64.const 5.0
    f64.add
  )
)