(module
  (func $rem_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.rem_u
  )
  (export "rem_u" (func $rem_u))
)