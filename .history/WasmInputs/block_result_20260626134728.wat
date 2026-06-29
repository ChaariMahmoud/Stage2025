(module
  (func (result i32)
    (block $exit 
    drop
      i32.const 42
       drop
      br $exit
     
    )
  )
)