pub fn main() {
  let a = unsafely_get_first_element([123])
  echo a

  let b = unsafely_get_first_element([])
  echo b
}

pub fn unsafely_get_first_element(items: List(a)) -> a {
  //   echo case items {
  //     [s, ..] -> s
  //     _ -> panic as "List should not be empty here"
  //   }
  // This will panic if the list is empty.
  // A regular `let` would not permit this partial pattern
  let assert [first, ..] = items as "List should not be empty"
  first
}
