(module
  (memory 1)

  (func (export "main")
    (drop (memory.size))
    (drop (memory.grow (i32.const 1)))
    (drop (memory.size))
  )
)