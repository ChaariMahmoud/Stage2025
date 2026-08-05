(module
  (func $abs (param $a f32) (result f32)
    local.get $a
    f32.abs
  )
  (export "abs" (func $abs))
)