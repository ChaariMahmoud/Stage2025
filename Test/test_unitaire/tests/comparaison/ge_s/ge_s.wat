(module
  (func $ge_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.ge_s
  )
  (export "ge_s" (func $ge_s))
)