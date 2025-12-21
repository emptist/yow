import gleam/int
import gleam/io

pub type Optio(inner) {
  Some(inner)
  None
}

const name: Optio(String) = Some("Gleam")

const age: Optio(Int) = Some(6)

pub fn main() {
  let _ = echo name
  let _ = echo age
  //   echo name
  //   echo age
  case name {
    Some(n) -> echo "name: " <> n
    None -> echo "No name"
  }
  let a_string = case age {
    Some(a) -> echo "age: " <> a |> int.to_string
    None -> echo "age not known"
    // "No age"
  }
  io.println(a_string)
}
