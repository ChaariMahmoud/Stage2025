(module
  (memory 1)
  (func $memory_copy
    i32.const 0
    i32.const 16
    i32.const 8
    memory.copy
  )
)