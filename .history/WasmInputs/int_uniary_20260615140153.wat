(module
  (func (export "main")
    (drop (i32.clz (i32.const 8)))
    (drop (i32.ctz (i32.const 8)))
    (drop (i32.popcnt (i32.const 15)))

    (drop (i64.clz (i64.const 8)))
    (drop (i64.ctz (i64.const 8)))
    (drop (i64.popcnt (i64.const 15)))
  )
)