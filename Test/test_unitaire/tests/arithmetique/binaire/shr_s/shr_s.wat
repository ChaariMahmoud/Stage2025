(module
  (func $shr_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.shr_s
  )
  (export "shr_s" (func $shr_s))
)