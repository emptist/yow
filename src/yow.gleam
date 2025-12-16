import gleam/io
import gleam/list

pub fn main() {
  let ints = [1, 2, 3, 4, 5]

  io.println("=== map ===")
  echo list.map(ints, fn(x) { x * 2 })

  io.println("=== filter ===")
  echo list.filter(ints, fn(x) { x % 2 == 0 })

  io.println("=== fold ===")
  echo list.fold(ints, 0, fn(count, e) { { count + 1 } * e })
  echo factorial(5)
  io.println("=== find ===")
  let _ = echo list.find(ints, fn(x) { x > 3 })
  echo list.find(ints, fn(x) { x > 13 })
}

fn factorial(n: Int) -> Int {
  case n {
    0 -> 1
    _ -> n * factorial(n - 1)
  }
}
