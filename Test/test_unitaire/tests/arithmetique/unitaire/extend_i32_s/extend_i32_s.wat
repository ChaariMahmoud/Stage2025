(module
  (func $extend_i32_s (param $a i32) (result i64)
    local.get $a
    i64.extend_i32_s
  )
  (export "extend_i32_s" (func $extend_i32_s))
)