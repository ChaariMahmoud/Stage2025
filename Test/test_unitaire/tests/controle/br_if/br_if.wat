(module
  (func $br_if (param $cond i32) (param $a i32) (result i32)
    (block $my_block
      local.get $cond
      br_if $my_block
      (local.set $a (i32.const 100))
    )
    local.get $a
  )
  (export "br_if" (func $br_if))
)