(module
  (func $ceil (param $a f32) (result f32)
    local.get $a
    f32.ceil
  )
  (export "ceil" (func $ceil))
)