import gleam/int
import gleam/io
import gleam/result.{map as do, try, unwrap}

pub fn showresults() {
  io.println("=== map ===")
  let _ = echo Ok(1) |> do(fn(x) { x * 4 })
  let _ = echo Error(1) |> do(fn(x) { x * 10 })

  io.println("=== try ===")
  let _ = echo Ok("1") |> try(int.parse)
  let _ = echo Ok("no") |> try(int.parse)
  //== Error(Nil)
  let _ = echo Error(Nil) |> try(int.parse)

  io.println("=== unwrap ===")
  echo Ok("1234") |> unwrap("default")
  echo Error(Nil) |> unwrap("default")
  echo int.parse("58")
    |> unwrap(-1)
    |> fn(x, y) { x * y }(5)
  //{_* 5}
  // |> unwrap(0) |> try(int.absolute_value) 

  //   echo observer() |> unwrap("observer may fail")

  io.println("=== pipeline ===")
  int.parse("-1234")
  |> do(int.absolute_value)
  |> try(int.remainder(_, 42))
  |> echo
}

// @external(erlang, "observer", "start")
// fn observer() -> a

pub fn main() {
  showresults()
}
