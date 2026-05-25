(module
  (global $MAX_REQUESTS i32 (i32.const 10))
  (global $active_requests (mut i32) (i32.const 0))

  (func $acquire_request (param $n i32) (result i32)
    (local $current i32)
    (local $ret i32)
    (local $new_value i32)

    (local.set $current (global.get $active_requests))
    (local.set $new_value
      (i32.add (local.get $current) (local.get $n))
    )

    (if (i32.gt_s (local.get $new_value) (global.get $MAX_REQUESTS))
      (then
        (local.set $ret (i32.const 0))
      )
      (else
        (global.set $active_requests (local.get $new_value))
        (local.set $ret (i32.const 1))
      )
    )

    (local.get $ret)
  )


  (func $release_request (param $n i32) (result i32)
    (local $current i32)
    (local $ret i32)
    (local $new_value i32)

    (local.set $current (global.get $active_requests))
    (local.set $new_value
      (i32.sub (local.get $current) (local.get $n))
    )

    (if (i32.lt_s (local.get $new_value) (i32.const 0))
      (then
        (local.set $ret (i32.const 0))
      )
      (else
        (global.set $active_requests (local.get $new_value))
        (local.set $ret (i32.const 1))
      )
    )

    (local.get $ret)
  )
)

