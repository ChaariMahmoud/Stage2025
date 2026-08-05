(module
  (func $le_ft (param $a f32) (param $b f32) (result i32)
    local.get $a
    local.get $b
    f32.le
  )
  (export "le_ft" (func $le_ft))
)