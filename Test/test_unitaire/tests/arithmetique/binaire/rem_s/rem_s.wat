(module
  (func $rem_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.rem_s
  )
  (export "rem_s" (func $rem_s))
)