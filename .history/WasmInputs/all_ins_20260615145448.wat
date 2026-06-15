(module

  (memory 1)

  (func (export "main")

    ;; =====================================================
    ;; BITWISE
    ;; =====================================================

    (drop
      (i32.and
        (i32.const 12)
        (i32.const 10)
      )
    )

    (drop
      (i32.or
        (i32.const 12)
        (i32.const 10)
      )
    )

    (drop
      (i32.xor
        (i32.const 12)
        (i32.const 10)
      )
    )

    (drop
      (i32.shl
        (i32.const 5)
        (i32.const 1)
      )
    )

    (drop
      (i32.shr_s
        (i32.const -8)
        (i32.const 1)
      )
    )

    (drop
      (i32.shr_u
        (i32.const 20)
        (i32.const 2)
      )
    )

    (drop
      (i32.rotl
        (i32.const 7)
        (i32.const 3)
      )
    )

    (drop
      (i32.rotr
        (i32.const 7)
        (i32.const 3)
      )
    )

    ;; =====================================================
    ;; REMAINDER
    ;; =====================================================

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

    ;; =====================================================
    ;; INTEGER UNARY
    ;; =====================================================

    (drop
      (i32.clz
        (i32.const 8)
      )
    )

    (drop
      (i32.ctz
        (i32.const 8)
      )
    )

    (drop
      (i32.popcnt
        (i32.const 15)
      )
    )

    (drop
      (i64.clz
        (i64.const 8)
      )
    )

    (drop
      (i64.ctz
        (i64.const 8)
      )
    )

    (drop
      (i64.popcnt
        (i64.const 15)
      )
    )

    ;; =====================================================
    ;; FLOAT MATH
    ;; =====================================================

    (drop
      (f32.ceil
        (f32.const 3.2)
      )
    )

    (drop
      (f32.trunc
        (f32.const 3.8)
      )
    )

    (drop
      (f64.ceil
        (f64.const -3.2)
      )
    )

    (drop
      (f64.trunc
        (f64.const -3.8)
      )
    )

    (drop
      (f32.copysign
        (f32.const 3.5)
        (f32.const -1.0)
      )
    )

    (drop
      (f64.copysign
        (f64.const -3.5)
        (f64.const 1.0)
      )
    )

    ;; =====================================================
    ;; NUMERIC CASTS
    ;; =====================================================

    (drop
      (i64.extend_i32_s
        (i32.const 42)
      )
    )

    (drop
      (i64.extend_i32_u
        (i32.const 42)
      )
    )

    (drop
      (i32.trunc_f32_s
        (f32.const 3.7)
      )
    )

    (drop
      (i32.trunc_f64_s
        (f64.const 3.7)
      )
    )

    (drop
      (i64.trunc_f32_s
        (f32.const 7.9)
      )
    )

    (drop
      (i64.trunc_f64_s
        (f64.const 7.9)
      )
    )

    (drop
      (f32.convert_i32_s
        (i32.const 42)
      )
    )

    (drop
      (f32.convert_i64_s
        (i64.const 42)
      )
    )

    (drop
      (f64.convert_i32_s
        (i32.const 42)
      )
    )

    (drop
      (f64.convert_i64_s
        (i64.const 42)
      )
    )

    (drop
      (f32.demote_f64
        (f64.const 3.14159)
      )
    )

    (drop
      (f64.promote_f32
        (f32.const 3.14)
      )
    )

    ;; =====================================================
    ;; MEMORY
    ;; =====================================================

    (drop
      (memory.size)
    )

    (drop
      (memory.grow
        (i32.const 1)
      )
    )

    (drop
      (memory.size)
    )
  )
)