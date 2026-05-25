(module

  (type (func (param i32) (result i32)))

  (import "env" "inc_external"
    (func $inc_external (type 0)))

  (func $main (param $x i32) (result i32)
    local.get $x
    call $inc_external
  )

  (export "main" (func $main))
)