(module
  (func $drop (param $a i32)
    local.get $a
    drop
  )
  (export "drop" (func $drop))
)