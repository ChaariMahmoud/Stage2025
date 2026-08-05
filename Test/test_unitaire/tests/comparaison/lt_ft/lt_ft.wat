(module
  (func $lt_ft (param $a f32) (param $b f32) (result i32)
    local.get $a
    local.get $b
    f32.lt
  )
  (export "lt_ft" (func $lt_ft))
)