(module
  (func $floor (param $a f32) (result f32)
    local.get $a
    f32.floor
  )
  (export "floor" (func $floor))
)