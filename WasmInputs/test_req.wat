(module
  (;@inv 0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (global $MAX_REQUESTS i32 (i32.const 10))
  (global $active_requests (mut i32) (i32.const 0))

  ;; acquire_request :
  ;; on exige qu'il reste au moins une place libre
  (;@requires 0 <= active_requests && active_requests < MAX_REQUESTS;)
  (;@ensures  0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (func $acquire_request (result i32)
    (global.set $active_requests
      (i32.add (global.get $active_requests) (i32.const 1))
    )
    (i32.const 1)
  )

  ;; release_request :
  ;; on exige qu'il y ait déjà au moins une requête active
  (;@requires 0 < active_requests && active_requests <= MAX_REQUESTS;)
  (;@ensures  0 <= active_requests && active_requests <= MAX_REQUESTS;)

  (func $release_request
    (global.set $active_requests
      (i32.sub (global.get $active_requests) (i32.const 1))
    )
  )
)