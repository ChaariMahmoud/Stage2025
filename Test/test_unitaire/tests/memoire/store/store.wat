(module
  (memory 1)
  (func $store (param $addr i32) (param $value i32)
    local.get $addr
    local.get $value
    i32.store
  )
  (export "store" (func $store))
)