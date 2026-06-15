(module
  (func (export "main")
    i32.const 12
    i32.const 10
    i32.and
    drop

    i32.const 12
    i32.const 10
    i32.or
    drop

    i32.const 12
    i32.const 10
    i32.xor
    drop
  )
)