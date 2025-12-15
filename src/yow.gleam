pub fn main() {
  let sum = sum_list([18, 56, 35, 85, 91], 0)
  echo sum
}

fn sum_list(list: List(Int), total: Int) -> Int {
  case list {
    [] -> total
    [first, ..rest] -> sum_list(rest, total + first)
  }
}
