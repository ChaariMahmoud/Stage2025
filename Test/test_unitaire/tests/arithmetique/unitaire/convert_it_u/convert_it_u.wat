(module
  (func $convert_it_u (param $a i32) (result f32)
    local.get $a
    f32.convert_i32_u
  )
  (export "convert_it_u" (func $convert_it_u))
)