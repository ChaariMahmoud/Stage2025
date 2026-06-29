(module
  (func $two_loops
    ;; Première boucle
    (loop $L1
      i32.const 10
      drop
    )

    ;; Deuxième boucle
    (loop $L2
      i32.const 20
      drop
    )
  )

  (export "two_loops" (func $two_loops))
)