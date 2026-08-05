(module
  (table 1 funcref)
  (elem (i32.const 0) $target)
  (func $target)
  (func $table_set
    i32.const 0
    ref.func $target
    table.set 0
  )
)