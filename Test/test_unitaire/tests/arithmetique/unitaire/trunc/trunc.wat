(module
  (func $trunc (param $a f32) (result f32)
    local.get $a
    f32.trunc
  )
  (export "trunc" (func $trunc))
)