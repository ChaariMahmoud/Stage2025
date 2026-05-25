(module

  (type (func (param i32) (result i32)))

  (import "env" "f"
    (func $f (type 0)))

  (import "env" "g"
    (func $g (type 0)))

  (func $main (param $x i32) (result i32)

    local.get $x
    call $f
    call $g
  )

  (export "main" (func $main))
)