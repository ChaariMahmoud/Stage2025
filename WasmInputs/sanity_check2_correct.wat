(module
  (;@inv 0.0 <= temp && temp <= 100.0;)

  (global $temp (mut f32) (f32.const 98.0))

  ;; =========================
  ;; heat_step
  ;; =========================

  (;@requires 0.0 <= temp && temp <= 100.0;)
  (;@ensures  0.0 <= temp && temp <= 100.0;)

  (func $heat_step
    (local $cur f32)

    (local.set $cur (global.get $temp))

    ;; if cur <= 99.0 then temp := cur + 1.0
    (if (f32.le (local.get $cur) (f32.const 99.0))
      (then
        (global.set $temp
          (f32.add (local.get $cur) (f32.const 1.0))
        )
      )
    )
  )

  ;; =========================
  ;; cool_step
  ;; =========================

  (;@requires 0.0 <= temp && temp <= 100.0;)
  (;@ensures  0.0 <= temp && temp <= 100.0;)

  (func $cool_step
    (local $cur f32)

    (local.set $cur (global.get $temp))

    ;; if cur >= 1.0 then temp := cur - 1.0
    (if (f32.ge (local.get $cur) (f32.const 1.0))
      (then
        (global.set $temp
          (f32.sub (local.get $cur) (f32.const 1.0))
        )
      )
    )
  )
)