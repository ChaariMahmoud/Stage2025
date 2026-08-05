(module
  (func $block (param $a i32) (result i32)
    (block $my_block
      (local.set $a (i32.const 42))
    )
    local.get $a
  )
  (export "block" (func $block))
)