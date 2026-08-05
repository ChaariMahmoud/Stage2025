(module
  (func $le_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.le_s
  )
  (export "le_s" (func $le_s))
)