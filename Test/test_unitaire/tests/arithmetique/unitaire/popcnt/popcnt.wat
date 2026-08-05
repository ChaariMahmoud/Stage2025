(module
  (func $popcnt (param $a i32) (result i32)
    local.get $a
    i32.popcnt
  )
  (export "popcnt" (func $popcnt))
)