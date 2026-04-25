(module
  ;; -------------------------
  ;; Globals
  ;; -------------------------
  (global $MAX_REQUESTS i32 (i32.const 10))
  (global $active_requests (mut i32) (i32.const 0))

  ;; -------------------------
  ;; Functions
  ;; -------------------------
  (func $acquire_request (result i32)
    (local $current i32)
    (local $ret i32)

    (local.set $current (global.get $active_requests))

    (if (i32.ge_s (local.get $current) (global.get $MAX_REQUESTS))
      (then (local.set $ret (i32.const 0)))
      (else
        (global.set $active_requests
          (i32.add (local.get $current) (i32.const 1))
        )
        (local.set $ret (i32.const 1))
      )
    )

    (local.get $ret)
  )

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

  ;; -------------------------
  ;; Custom section: specs for VeriWasm
  ;; (format libre: JSON / DSL)
  ;; -------------------------
  (custom "veriwasm.spec"
    "{
      \"globals\": {
        \"$active_requests\": {
          \"invariant\": \"0 <= active_requests && active_requests <= MAX_REQUESTS\"
        }
      },
      \"funcs\": {
        \"$acquire_request\": {
          \"requires\": [\"0 <= active_requests && active_requests <= MAX_REQUESTS\"],
          \"ensures\":  [\"0 <= active_requests && active_requests <= MAX_REQUESTS\"]
        },
        \"$release_request\": {
          \"requires\": [\"0 <= active_requests && active_requests <= MAX_REQUESTS\"],
          \"ensures\":  [\"0 <= active_requests && active_requests <= MAX_REQUESTS\"]
        }
      }
    }"
  )
)
