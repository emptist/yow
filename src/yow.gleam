import gleam/option.{type Option, None, Some}

pub fn main() {
  let numbers = [1, 2, 3, 4, 5]
  echo get_first_larger(numbers, 2)
  echo get_first_larger(numbers, 3)
  echo get_first_larger(numbers, 5)
}

fn get_first_larger(numbers: List(Int), limit: Int) -> Option(Int) {
  case numbers {
    [] -> None
    [first, ..] if first > limit -> Some(first)
    [_, ..rest] -> get_first_larger(rest, limit)
  }
}
