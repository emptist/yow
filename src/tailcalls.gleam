// let's calculates the factorial of a list of numbers, first
fn factorial_list(list: List(Int), total: Int) -> Int {
  case list {
    [] -> total
    [first, ..rest] ->
      case total {
        0 -> factorial_list(rest, first)
        _ -> factorial_list(rest, total * first)
      }
  }
}

// now it's easy to understand:
fn factorial_loop(x: Int, accumulator: Int) -> Int {
  case x {
    0 -> accumulator
    1 -> accumulator
    _ -> factorial_loop(x - 1, accumulator * x)
  }
}

pub fn factorial(x: Int) -> Int {
  // The public function calls the private tail recursive function
  x |> factorial_loop(1)
}

pub fn main() {
  echo factorial_list([], 0)
  echo factorial_list([18, 56, 35, 85, 91], 0)
  echo factorial_loop(5, 1)
  echo factorial_loop(7, 1)
}
