(module
  (func $convert_it_s (param $a i32) (result f32)
    local.get $a
    f32.convert_i32_s
  )
  (export "convert_it_s" (func $convert_it_s))
)