(module
  ;; Invariant global
  (;@inv 0 <= counter && counter <= MAX_COUNTER;)

  ;; Constante globale
  (global $MAX_COUNTER i32
    (i32.const 10)
  )

  ;; Variable globale mutable
  (global $counter (mut i32)
    (i32.const 0)
  )

  ;; Précondition attachée à la fonction suivante
  (;@requires counter >= 0;)

  ;; Postcondition sur l’état global
  (;@ensures counter <= MAX_COUNTER;)

  (func $increment
    (global.set $counter
      (i32.add
        (global.get $counter)
        (i32.const 1)
      )
    )
  )

  (export "increment" (func $increment))
)