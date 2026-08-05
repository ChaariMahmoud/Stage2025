(module
  (func $eqz (param $a i32) (result i32)
    local.get $a
    i32.eqz
  )
  (export "eqz" (func $eqz))
)