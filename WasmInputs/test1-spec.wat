(module

  ;; ==========================================
  ;; GLOBAL INVARIANT
  ;; ==========================================
  (;@inv 0 <= balance && balance <= MAX_BALANCE && locked == 0;)

  (global $MAX_BALANCE i32 (i32.const 100))
  (global $balance (mut i32) (i32.const 0))
  (global $locked (mut i32) (i32.const 0)) ;; 0 = unlocked, 1 = locked

  ;; ==========================================
  ;; deposit(amount)
  ;; ==========================================
  (;@requires 0 <= balance && balance <= MAX_BALANCE && locked == 0;)
  (;@ensures  0 <= balance && balance <= MAX_BALANCE;)

  (func $deposit (param $amount i32)

    (local $newBalance i32)

    (if (i32.eq (global.get $locked) (i32.const 1))
      (then
        ;; do nothing if locked
      )
      (else
        (local.set $newBalance
          (i32.add (global.get $balance) (local.get $amount))
        )

        (if (i32.le_s (local.get $newBalance) (global.get $MAX_BALANCE))
          (then
            (global.set $balance (local.get $newBalance))
          )
        )
      )
    )
  )

  ;; ==========================================
  ;; withdraw(amount)
  ;; ==========================================
  (;@requires 0 <= balance && balance <= MAX_BALANCE && locked == 0;)
  (;@ensures  0 <= balance && balance <= MAX_BALANCE;)

  (func $withdraw (param $amount i32)

    (local $newBalance i32)

    (local.set $newBalance
      (i32.sub (global.get $balance) (local.get $amount))
    )

    (if (i32.ge_s (local.get $newBalance) (i32.const 0))
      (then
        (global.set $balance (local.get $newBalance))
      )
    )
  )

  ;; ==========================================
  ;; lock account
  ;; ==========================================
  (;@requires 0 <= balance && balance <= MAX_BALANCE;)
  (;@ensures  locked == 1;)

  (func $lock
    (global.set $locked (i32.const 1))
  )

  ;; ==========================================
  ;; unlock account
  ;; ==========================================
  (;@requires locked == 1;)
  (;@ensures  locked == 0;)

  (func $unlock
    (global.set $locked (i32.const 0))
  )

)