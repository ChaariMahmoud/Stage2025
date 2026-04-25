(module

  (;@inv 0 <= stock && stock <= CAPACITY;)

  (global $CAPACITY i32 (i32.const 20))
  (global $stock (mut i32) (i32.const 0))

  ;; =========================
  ;; add_item
  ;; =========================

  (;@requires 0 <= stock && stock <= CAPACITY;)
  (;@ensures  0 <= stock && stock <= CAPACITY;)

  (func $add_item (result i32)
    (local $current i32)
    (local $ret i32)

    (local.set $current (global.get $stock))

    (if (i32.lt_s (local.get $current) (global.get $CAPACITY))
      (then
        (global.set $stock
          (i32.add (local.get $current) (i32.const 1))
        )
        (local.set $ret (i32.const 1))
      )
      (else
        (local.set $ret (i32.const 0))
      )
    )

    (local.get $ret)
  )

  ;; =========================
  ;; remove_item
  ;; =========================

  (;@requires 0 <= stock && stock <= CAPACITY;)
  (;@ensures  0 <= stock && stock <= CAPACITY;)

  (func $remove_item
    (local $current i32)

    (local.set $current (global.get $stock))

    (if (i32.gt_s (local.get $current) (i32.const 0))
      (then
        (global.set $stock
          (i32.sub (local.get $current) (i32.const 1))
        )
      )
    )
  )
)