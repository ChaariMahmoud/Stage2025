(module
  (global $my_global (mut i32) (i32.const 0))
  (func $global_set
    i32.const 100
    global.set $my_global
  )
)