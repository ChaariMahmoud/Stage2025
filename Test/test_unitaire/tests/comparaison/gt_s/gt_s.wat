(module
  (func $gt_s (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.gt_s
  )
  (export "gt_s" (func $gt_s))
)