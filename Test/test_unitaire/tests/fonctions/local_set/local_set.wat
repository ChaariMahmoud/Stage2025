(module
  (func $local_set (param $a i32)
    i32.const 42
    local.set $a
  )
  (export "local_set" (func $local_set))
)