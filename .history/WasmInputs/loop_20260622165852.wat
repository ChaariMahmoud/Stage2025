(module
  (func $block_loop
    (block $B
      (loop $L
        i32.const 42
        drop
      )
    )
  )

  (export "block_loop" (func $block_loop))
)