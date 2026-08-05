(module
  (func $demote_f64 (param $a f64) (result f32)
    local.get $a
    f32.demote_f64
  )
  (export "demote_f64" (func $demote_f64))
)