(module
  (func $loop (param $a i32) (param $b i32) (result i32)
    (loop $L (result i32)
      local.get $a
      local.get $b
      i32.add
    )
  )

  (export "loop" (func $loop))
)