(module
  (func $local_tee (param $a i32) (result i32)
    i32.const 42
    local.tee $a
  )
  (export "local_tee" (func $local_tee))
)