(module
  (func $promote_f32 (param $a f32) (result f64)
    local.get $a
    f64.promote_f32
  )
  (export "promote_f32" (func $promote_f32))
)