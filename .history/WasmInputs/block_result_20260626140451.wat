(module
  (func (result i32)
    (block $exit (result i32)

      ;; block result normal
      (block $b1 (result i32)
        i32.const 5
        i32.const 3
        i32.add
      )
      drop

      ;; block result avec br
      (block $b2 (result i32)
        i32.const 42
        br $b2
      )
      drop

      ;; loop dans block result
      (block $b3 (result i32)
        (loop $L1
          i32.const 100
          br $b3
        )
        unreachable
      )
      drop

      ;; loops imbriqués
      (block $b4 (result i32)
        (loop $L_outer
          (loop $L_inner
            i32.const 200
            br $b4
          )
          unreachable
        )
        unreachable
      )
      drop

      i32.const 999
      br $exit
    )
  )
)