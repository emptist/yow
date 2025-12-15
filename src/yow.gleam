pub fn main() {
  let add = fn(a, b) { a + b }
  // These two statements are equivalent
  let add_one_v1 = fn(x) { add(1, x) }
  let add_one_v2 = add(1, _)

  echo add_one_v1(10)
  echo add(1, _)(10)
}
