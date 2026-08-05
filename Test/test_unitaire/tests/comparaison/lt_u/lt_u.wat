(module
  (func $lt_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.lt_u
  )
  (export "lt_u" (func $lt_u))
)