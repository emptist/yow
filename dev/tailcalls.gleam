// let's calculates the factorial of a list of numbers, first
fn factorial_list(list: List(Int), accumulator: Int) -> Int {
  case list {
    [] -> accumulator
    [first, ..rest] -> factorial_list(rest, accumulator * first)
  }
}

// now it's easy to understand:
fn factorial_loop(x: Int, accumulator: Int) -> Int {
  case x {
    0 -> 0
    1 -> accumulator
    _ -> factorial_loop(x - 1, accumulator * x)
  }
}

pub fn factorial(x: Int) -> Int {
  case x < 0 {
    True -> -factorial(-x)
    False ->
      // The public function calls the private tail recursive function
      x |> factorial_loop(1)
  }
}

pub fn factorial_l(l: List(Int)) -> Int {
  case l {
    [] -> factorial_list(l, 0)
    _ -> factorial_list(l, 1)
  }
}

pub fn main() {
  echo factorial_l([])
  echo factorial_l([18, 56, 35, 85, 91])
  echo 18 * 56 * 35 * 85 * 91
  //== 15_160_600
  echo factorial(5)
  echo factorial_loop(5, 1)
  echo factorial_loop(7, 1)
}
