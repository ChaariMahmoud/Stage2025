(module
  (func $nested_if (param $cond1 i32) (param $cond2 i32) (result i32)
    local.get $cond1
    (if (result i32)
      (then
        local.get $cond2
        (if (result i32)
          (then (i32.const 42))
          (else (i32.const 0))
        )
      )
      (else (i32.const 99))
    )
  )
)