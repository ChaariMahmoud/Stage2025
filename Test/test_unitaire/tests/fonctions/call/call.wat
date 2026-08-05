(module
  (func $add_two (param $p1 i32) (param $p2 i32) (result i32)
    local.get $p1
    local.get $p2
    i32.add
  )
  (func $call (param $a i32) (result i32)
    local.get $a
    i32.const 42
    call $add_two
  )
  (export "call" (func $call))
)