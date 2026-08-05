(module
  (func $lt_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.lt_s
  )
  (export "lt_s" (func $lt_s))
)