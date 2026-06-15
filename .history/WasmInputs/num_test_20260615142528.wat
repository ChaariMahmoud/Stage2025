(module
  (func (export "main")
    (drop (i64.extend_i32_s (i32.const 42)))
    (drop (i64.extend_i32_u (i32.const 42)))

    (drop (i32.trunc_f32_s (f32.const 3.7)))
    (drop (i32.trunc_f64_s (f64.const 3.7)))

    (drop (f32.convert_i32_s (i32.const 42)))
    (drop (f64.convert_i64_s (i64.const 42)))

    (drop (f32.demote_f64 (f64.const 3.14)))
    (drop (f64.promote_f32 (f32.const 3.14)))
  )
)