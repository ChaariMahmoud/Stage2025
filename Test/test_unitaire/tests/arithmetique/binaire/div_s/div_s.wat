(module
  (func $div_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.div_s
  )
  (export "div_s" (func $div_s))
)