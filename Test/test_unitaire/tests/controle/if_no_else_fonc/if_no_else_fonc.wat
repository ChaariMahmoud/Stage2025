(module
  (func $if_no_else_fonc (param $cond i32) (param $a i32) (result i32)
    local.get $cond
    (if
      (then
        (local.set $a (i32.const 100))
      )
    )
    local.get $a
  )
  (export "if_no_else_fonc" (func $if_no_else_fonc))
)