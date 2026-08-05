(module
  (func $shr_u (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.shr_u
  )
  (export "shr_u" (func $shr_u))
)