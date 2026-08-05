(module
  (func $trunc_ft_u (param $a f32) (result i32)
    local.get $a
    i32.trunc_f32_u
  )
  (export "trunc_ft_u" (func $trunc_ft_u))
)