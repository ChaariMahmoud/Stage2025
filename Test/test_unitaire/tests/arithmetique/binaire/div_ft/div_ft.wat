(module
  (func $div_ft (param $a f32) (param $b f32) (result f32)
    local.get $a
    local.get $b
    f32.div
  )
  (export "div_ft" (func $div_ft))
)