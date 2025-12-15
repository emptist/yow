import gleam/int

const max = 4

pub fn main() {
  let x = int.random(max + 1)
  echo "x: " <> int.to_string(x)

  let result = case x {
    // Match specific values
    0 -> "Zero"
    1 -> "One"
    2 -> "Two"
    3 -> "Three"
    4 -> "Four"
    // Match any other value
    _ -> "Number: " <> int.to_string(x)
  }
  echo result
}
