(module
  (global $my_global i32 (i32.const 42))
  (func $global_get
    global.get $my_global
    drop
  )
)