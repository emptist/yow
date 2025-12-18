import gleam/int
import gleam/io
import gleam/string as text

pub fn string2int(string: String) -> Int {
  case int.parse(string) {
    Ok(i) -> i
    Error(Nil) -> 0
  }
}

pub fn main() -> Nil {
  echo string2int("12345")

  io.println("joy")
  io.println(text.reverse("jim"))
}
