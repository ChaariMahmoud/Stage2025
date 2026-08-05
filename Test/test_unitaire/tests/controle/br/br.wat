(module
  (func $br (param $a i32) (result i32)
    (block $my_block
      br $my_block
      (local.set $a (i32.const 100))
    )
    local.get $a
  )
  (export "br" (func $br))
)