import gleam/int
import gleam/io
import gleam/string as text
import result_hard.{showresults}

//import playground/echo as playground_echo

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

  let _ = showresults()
  Nil
}
