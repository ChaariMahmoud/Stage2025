(module
  (func $if_no_else_false (param $cond i32) (param $a i32) (param $b i32) (result i32)
    local.get $cond
    (if (result i32)
      (then
        local.get $a
        local.get $b
        i32.add
      )
    )
  )
  (export "if_no_else_false" (func $if_no_else_false))
)