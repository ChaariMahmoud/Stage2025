(module
  (func $local_get (param $a i32) (result i32)
    local.get $a
  )
  (export "local_get" (func $local_get))
)