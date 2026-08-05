(module
  (func $neg (param $a f32) (result f32)
    local.get $a
    f32.neg
  )
  (export "neg" (func $neg))
)