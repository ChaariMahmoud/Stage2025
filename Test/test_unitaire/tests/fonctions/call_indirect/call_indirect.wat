(module
  (type $sig (func))
  (table 1 funcref)
  (elem (i32.const 0) $target)
  (func $target
  )
  (func $call_indirect
    i32.const 0
    call_indirect (type $sig)
  )
)