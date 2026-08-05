(module
  (memory 1)
  (func $memory_size (result i32)
    memory.size
  )
  (export "memory_size" (func $memory_size))
)