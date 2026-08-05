(module
  (memory 1)
  (func $memory_fill
    i32.const 0
    i32.const 255
    i32.const 4
    memory.fill
  )
)