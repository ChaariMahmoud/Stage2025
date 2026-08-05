(module
  (func $ge_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.ge_u
  )
  (export "ge_u" (func $ge_u))
)