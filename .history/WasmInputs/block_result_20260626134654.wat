(module
  (func (result i32)
    (block $exit 
      i32.const 42
      br $exit
    )
  )
)