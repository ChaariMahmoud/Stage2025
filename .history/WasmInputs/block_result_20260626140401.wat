(module
  (func (result i32)
    (block $exit (result i32)

      ;; block result normal : produit 8
      (block $b1 (result i32)
        i32.const 5
        i32.const 3
        i32.add
      )
      drop

      ;; block result avec br vers son propre label : produit 42
      (block $b2 (result i32)
        i32.const 42
        br $b2
      )
      drop

      ;; loop dans un block result : sortie avec valeur 100
      (block $b3 (result i32)
        (loop $L1
          i32.const 100
          br $b3
        )
      )
      drop

      ;; loops imbriqués dans un block result : sortie avec valeur 200
      (block $b4 (result i32)
        (loop $L_outer
          (loop $L_inner
            i32.const 200
            br $b4
          )
        )
      )
      drop

      ;; valeur finale retournée par la fonction
      i32.const 999
      br $exit
    )
  )
)