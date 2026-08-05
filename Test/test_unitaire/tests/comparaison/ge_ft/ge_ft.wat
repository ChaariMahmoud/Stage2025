(module
  (func $ge_ft (param $a f32) (param $b f32) (result i32)
    local.get $a
    local.get $b
    f32.ge
  )
  (export "ge_ft" (func $ge_ft))
)