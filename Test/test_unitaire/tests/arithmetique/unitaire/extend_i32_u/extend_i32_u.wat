(module
  (func $extend_i32_u (param $a i32) (result i64)
    local.get $a
    i64.extend_i32_u
  )
  (export "extend_i32_u" (func $extend_i32_u))
)