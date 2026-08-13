(module
  ;; =========================
  ;; i32 arithmetic
  ;; =========================
  (func (export "test_i32_arith") (result i32)
    i32.const 10
    i32.const 32
    i32.add        ;; 42

    i32.const 5
    i32.mul        ;; 210

    i32.const 20
    i32.sub        ;; 190
  )

  ;; =========================
  ;; i64 arithmetic
  ;; =========================
  (func (export "test_i64_arith") (result i64)
    i64.const 100
    i64.const 20
    i64.sub        ;; 80

    i64.const 3
    i64.mul        ;; 240

    i64.const 10
    i64.add        ;; 250
  )

  ;; =========================
  ;; f32 arithmetic
  ;; =========================
  (func (export "test_f32_arith") (result f32)
    f32.const 10.5
    f32.const 2.0
    f32.add        ;; 12.5

    f32.const 3.0
    f32.mul        ;; 37.5

    f32.const 1.5
    f32.sub        ;; 36.0
  )

  ;; =========================
  ;; f64 arithmetic
  ;; =========================
  (func (export "test_f64_arith") (result f64)
    f64.const 20.0
    f64.const 4.0
    f64.sub        ;; 16.0

    f64.const 2.0
    f64.mul        ;; 32.0

    f64.const 5.0
    f64.add        ;; 37.0
  )

  ;; =========================
  ;; f32 / f64 division
  ;; only if you added f32.div and f64.div
  ;; =========================
  (func (export "test_f32_div") (result f32)
    f32.const 10.0
    f32.const 2.0
    f32.div        ;; 5.0
  )

  (func (export "test_f64_div") (result f64)
    f64.const 22.0
    f64.const 2.0
    f64.div        ;; 11.0
  )

  ;; =========================
  ;; i32 comparisons
  ;; all return i32: 0 or 1
  ;; =========================
  (func (export "test_i32_eq") (result i32)
    i32.const 10
    i32.const 10
    i32.eq
  )

  (func (export "test_i32_ne") (result i32)
    i32.const 10
    i32.const 20
    i32.ne
  )

  (func (export "test_i32_lt_s") (result i32)
    i32.const 10
    i32.const 20
    i32.lt_s
  )

  (func (export "test_i32_gt_s") (result i32)
    i32.const 20
    i32.const 10
    i32.gt_s
  )

  (func (export "test_i32_le_s") (result i32)
    i32.const 10
    i32.const 10
    i32.le_s
  )

  (func (export "test_i32_ge_s") (result i32)
    i32.const 20
    i32.const 10
    i32.ge_s
  )

  ;; unsigned currently treated like signed in your first model
  (func (export "test_i32_lt_u") (result i32)
    i32.const 10
    i32.const 20
    i32.lt_u
  )

  (func (export "test_i32_gt_u") (result i32)
    i32.const 20
    i32.const 10
    i32.gt_u
  )

  ;; =========================
  ;; i64 comparisons
  ;; =========================
  (func (export "test_i64_eq") (result i32)
    i64.const 100
    i64.const 100
    i64.eq
  )

  (func (export "test_i64_ne") (result i32)
    i64.const 100
    i64.const 200
    i64.ne
  )

  (func (export "test_i64_lt_s") (result i32)
    i64.const 100
    i64.const 200
    i64.lt_s
  )

  (func (export "test_i64_gt_s") (result i32)
    i64.const 200
    i64.const 100
    i64.gt_s
  )

  (func (export "test_i64_le_s") (result i32)
    i64.const 100
    i64.const 100
    i64.le_s
  )

  (func (export "test_i64_ge_s") (result i32)
    i64.const 200
    i64.const 100
    i64.ge_s
  )

  ;; =========================
  ;; f32 comparisons
  ;; =========================
  (func (export "test_f32_eq") (result i32)
    f32.const 1.5
    f32.const 1.5
    f32.eq
  )

  (func (export "test_f32_ne") (result i32)
    f32.const 1.5
    f32.const 2.5
    f32.ne
  )

  (func (export "test_f32_lt") (result i32)
    f32.const 1.5
    f32.const 2.5
    f32.lt
  )

  (func (export "test_f32_gt") (result i32)
    f32.const 2.5
    f32.const 1.5
    f32.gt
  )

  (func (export "test_f32_le") (result i32)
    f32.const 1.5
    f32.const 1.5
    f32.le
  )

  (func (export "test_f32_ge") (result i32)
    f32.const 2.5
    f32.const 1.5
    f32.ge
  )

  ;; =========================
  ;; f64 comparisons
  ;; =========================
  (func (export "test_f64_eq") (result i32)
    f64.const 3.14
    f64.const 3.14
    f64.eq
  )

  (func (export "test_f64_ne") (result i32)
    f64.const 3.14
    f64.const 2.71
    f64.ne
  )

  (func (export "test_f64_lt") (result i32)
    f64.const 2.71
    f64.const 3.14
    f64.lt
  )

  (func (export "test_f64_gt") (result i32)
    f64.const 3.14
    f64.const 2.71
    f64.gt
  )

  (func (export "test_f64_le") (result i32)
    f64.const 3.14
    f64.const 3.14
    f64.le
  )

  (func (export "test_f64_ge") (result i32)
    f64.const 3.14
    f64.const 2.71
    f64.ge
  )
)