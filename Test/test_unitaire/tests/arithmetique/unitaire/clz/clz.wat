(module
  (func $clz (param $a i32) (result i32)
    local.get $a
    i32.clz
  )
  (export "clz" (func $clz))
)