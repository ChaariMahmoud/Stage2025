(module
  (func $select (param $val1 i32) (param $val2 i32) (param $cond i32) (result i32)
    local.get $val1
    local.get $val2
    local.get $cond
    select
  )
  (export "select" (func $select))
)