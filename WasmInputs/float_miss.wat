(module
  (func (export "main")
    (drop (f32.ceil (f32.const 3.2)))
    (drop (f32.trunc (f32.const 3.8)))
    (drop (f64.ceil (f64.const -3.2)))
    (drop (f64.trunc (f64.const -3.8)))

    (drop
      (f32.copysign
        (f32.const 3.5)
        (f32.const -1.0)
      )
    )

    (drop
      (f64.copysign
        (f64.const -3.5)
        (f64.const 1.0)
      )
    )
  )
)