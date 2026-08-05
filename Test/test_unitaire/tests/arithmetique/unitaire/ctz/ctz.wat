(module
  (func $ctz (param $a i32) (result i32)
    local.get $a
    i32.ctz
  )
  (export "ctz" (func $ctz))
)