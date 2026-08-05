(module
  (func $le_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.le_u
  )
  (export "le_u" (func $le_u))
)