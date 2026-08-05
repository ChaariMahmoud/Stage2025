(module
  (memory 1)
  (func $memory_grow (param $pages i32) (result i32)
    local.get $pages
    memory.grow
  )
  (export "memory_grow" (func $memory_grow))
)