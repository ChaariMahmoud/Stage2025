(module
  (memory 1)
  (func $load (param $addr i32) (result i32)
    local.get $addr
    i32.load
  )
  (export "load" (func $load))
)