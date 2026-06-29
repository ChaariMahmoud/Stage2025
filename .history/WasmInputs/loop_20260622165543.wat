(module
  (func $loop (param $a i32) (param $b i32)
    (loop $L
      local.get $a
      local.get $b
      i32.add
      drop
    )
  )

  (export "loop" (func $loop))
)