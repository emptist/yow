pub type Option(inner) {
  Some(inner)
  None
}

// An option of string
pub const name: Option(String) = Some("Annah")

// An option of int
pub const level: Option(Int) = Some(10)

pub fn main() {
  case name {
    Some(string) -> echo string
    _ -> echo "No name"
  }
  echo name
  echo level
}
