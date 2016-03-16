(module
  (memory 256 256)
  (export "echo" $echo)
  (func $echo (param $x i32) (result i32)
    (get_local $x)
  )
)