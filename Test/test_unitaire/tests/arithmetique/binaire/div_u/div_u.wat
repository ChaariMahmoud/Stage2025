(module
  (func $div_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.div_u
  )
  (export "div_u" (func $div_u))
)