(module
  (func $gt_ft (param $a f32) (param $b f32) (result i32)
    local.get $a
    local.get $b
    f32.gt
  )
  (export "gt_ft" (func $gt_ft))
)