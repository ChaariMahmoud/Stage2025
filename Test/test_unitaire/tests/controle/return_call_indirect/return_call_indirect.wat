(module
  (type $sig (func))
  (table 1 funcref)
  (elem (i32.const 0) $target)

  (func $target
    ;; Fonction cible vide (void)
  )

  (func $return_call_indirect
    i32.const 0
    return_call_indirect (type $sig)
  )
)