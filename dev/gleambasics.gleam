/// if external, use the erlang reverse function
@external(erlang, "lists", "reverse")
pub fn reverse(items: List(e)) -> List(e) {
  tail_recursive_reverse(items, [])
}

pub fn reverse_list(items: List(e)) -> List(e) {
  echo items
  tail_recursive_reverse(items, [])
}

fn tail_recursive_reverse(items: List(e), reversed: List(e)) -> List(e) {
  case items {
    [] -> reversed
    [first, ..rest] -> tail_recursive_reverse(rest, [first, ..reversed])
  }
}

pub fn main() {
  echo [1, 2, 3, 4, 5] |> reverse
  echo ["a", "b", "c", "d", "f"] |> reverse
  echo ["a", "b", "c", "d", "e"] |> reverse_list
}
