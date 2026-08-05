(module
  (func $nearest (param $a f32) (result f32)
    local.get $a
    f32.nearest
  )
  (export "nearest" (func $nearest))
)