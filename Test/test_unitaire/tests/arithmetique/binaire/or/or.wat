(module
  (func $or (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.or
  )
  (export "or" (func $or))
)