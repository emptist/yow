import gleam/io
import gleam/list.{filter, find, fold, map}

/// when using |> operator, the function name is the same as the function in the module
/// this looks similar to smalltalk
/// aCollection.collect: [ :each | each * 2 ]
/// aCollection.select: [ :each | each % 2 == 0 ]
/// aCollection.inject: 0 into: [ :count, :each | { count + 1 } * each ]
pub fn main() {
  let ints = [1, 2, 3, 4, 5]

  io.println("=== map ===")
  echo ints |> map(fn(x) { x * 2 })

  io.println("=== filter ===")
  echo ints |> filter(fn(x) { x % 2 == 0 })

  io.println("=== fold ===")
  echo ints |> fold(0, fn(count, e) { { count + 1 } * e })
  echo factorial(5)
  io.println("=== find ===")
  let _ = echo ints |> find(fn(x) { x > 3 })
  echo ints |> find(fn(x) { x > 13 })
}

fn factorial(n: Int) -> Int {
  case n {
    0 -> 1
    _ -> n * factorial(n - 1)
  }
}
