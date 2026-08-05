(module
  (func $trunc_ft_s (param $a f32) (result i32)
    local.get $a
    i32.trunc_f32_s
  )
  (export "trunc_ft_s" (func $trunc_ft_s))
)