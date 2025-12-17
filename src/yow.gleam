import gleam/io
import gleam/string as text

pub fn main() -> Nil {
  io.println("joy")
  io.println(text.reverse("jim"))
}
