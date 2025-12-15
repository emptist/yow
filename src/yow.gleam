pub fn main() {
  echo get_first_non_empty([[], [1, 2, 3], [4, 5]])
  echo get_first_non_empty([[1, 2], [3, 4, 5], []])
  echo get_first_non_empty([[], [], []])
}

fn get_first_non_empty(lists: List(List(t))) -> List(t) {
  case lists {
    // Base case: if the list is empty, return an empty list
    [] -> []
    // Recursive case: if the first list is non-empty, return it
    [[_, ..] as first, ..] -> first
    // Recursive case: if the first list is empty, continue with the rest
    [_, ..rest] -> get_first_non_empty(rest)
  }
}
