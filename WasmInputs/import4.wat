(module
  (type $bin_i32 (func (param i32 i32) (result i32)))
  (type $un_i32  (func (param i32) (result i32)))
  (type $void_i32 (func (param i32)))

  (import "env" "add_external"
    (func $add_external (type 0)))

  (import "env" "normalize_external"
    (func $normalize_external (type 1)))

  (import "env" "log_external"
    (func $log_external (type 2)))

  (func $square (param $x i32) (result i32)
    local.get $x
    local.get $x
    i32.mul
  )

  (func $compute (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    call $add_external
    call $square
    call $normalize_external
  )

  (func $main (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    call $compute
  )

  (export "main" (func $main))
  (export "compute" (func $compute))
  (export "square" (func $square))
)