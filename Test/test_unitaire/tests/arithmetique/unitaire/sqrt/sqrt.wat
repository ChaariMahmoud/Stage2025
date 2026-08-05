(module
  (func $sqrt (param $a f32) (result f32)
    local.get $a
    f32.sqrt
  )
  (export "sqrt" (func $sqrt))
)