(module
  (func $nested_loops
    (loop $Outer
      i32.const 1
      drop

      (loop $Inner
        i32.const 2
        drop
      )
    )
  )

  (export "nested_loops" (func $nested_loops))
)