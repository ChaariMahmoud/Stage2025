(module
  (func $shl (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.shl
  )
  (export "shl" (func $shl))
)