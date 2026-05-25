(module

  ;; ---------- Type ----------
  (type  (func (param i32 i32) (result i32)))

  ;; ---------- Import ----------
  (import "env" "add_external"
    (func $add_external (type 0)))

  ;; ---------- Internal function ----------
  (func $double (param $x i32) (result i32)
    local.get $x
    local.get $x
    i32.add
  )

  ;; ---------- Exported function ----------
  (func $main (param $a i32) (param $b i32) (result i32)

    ;; call imported function
    local.get $a
    local.get $b
    call $add_external

    ;; double the result
    call $double
  )

  ;; ---------- Exports ----------
  (export "main" (func $main))
  (export "double" (func $double))

)