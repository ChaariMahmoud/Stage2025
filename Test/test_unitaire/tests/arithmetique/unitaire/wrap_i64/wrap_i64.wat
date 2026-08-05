(module
  (func $wrap_i64 (param $a i64) (result i32)
    local.get $a
    i32.wrap_i64
  )
  (export "wrap_i64" (func $wrap_i64))
)