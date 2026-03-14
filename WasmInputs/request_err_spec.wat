(module



  (;@inv 0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (global $MAX_REQUESTS i32 (i32.const 10))

  (global $active_requests (mut i32) (i32.const 0))



  (;@requires 0 <= active_requests && active_requests <= MAX_REQUESTS;)
  (;@ensures  0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (func $acquire_request (result i32)
    (local $current i32)
    (local $ret i32)

    (local.set $current (global.get $active_requests))

    (if (i32.ge_s (local.get $current) (global.get $MAX_REQUESTS))
      (then
        (local.set $ret (i32.const 0))
      )
      (else
        (global.set $active_requests
          (i32.add (local.get $current) (i32.const 5))
        )
        (local.set $ret (i32.const 1))
      )
    )

    (local.get $ret)
  )



  (;@requires 0 <= active_requests && active_requests <= MAX_REQUESTS;)
  (;@ensures  0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (func $release_request
    (local $current i32)

    (local.set $current (global.get $active_requests))

    (if (i32.gt_s (local.get $current) (i32.const 0))
      (then
        (global.set $active_requests
          (i32.sub (local.get $current) (i32.const 1))
        )
      )
    )
  )
)
