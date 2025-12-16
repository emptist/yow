import gleam/int
import gleam/io
import gleam/result.{map, try, unwrap}

pub fn main() {
  io.println("=== map ===")
  let _ = echo Ok(1) |> map(fn(x) { x * 2 })
  let _ = echo Error(1) |> map(fn(x) { x * 2 })

  io.println("=== try ===")
  let _ = echo Ok("1") |> try(int.parse)
  let _ = echo Ok("no") |> try(int.parse)
  //== Error(Nil)
  let _ = echo Error(Nil) |> try(int.parse)

  io.println("=== unwrap ===")
  echo Ok("1234") |> unwrap("default")
  echo Error(Nil) |> unwrap("default")

  io.println("=== pipeline ===")
  int.parse("-1234")
  |> map(int.absolute_value)
  |> try(int.remainder(_, 42))
  |> echo
}
