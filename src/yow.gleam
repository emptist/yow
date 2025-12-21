import gleam/int
import gleam/io
import gleam/string as text

// import result_hard.{showresults}

//import playground/echo as playground_echo

pub fn string2int(string: String) -> Int {
  case int.parse(string) {
    Ok(i) -> i
    Error(Nil) -> 0
  }
}

pub fn main() {
  echo string2int("12345")

  io.println("joy")
  io.println(text.reverse("jim"))

  // let _ = showresults()
  echo "// 8 bit int. In binary: 00000011"
  echo <<3>>
  echo <<3>> == <<3:size(8)>>

  echo "// 16 bit int. In binary: 0001100000000011"
  echo <<6147:size(16)>>

  echo "// A bit array of UTF8 data"
  echo <<"Hello, Joe!":utf8>>

  echo "// Concatenation"
  let first = <<4>>
  let second = <<2>>
  echo <<first:bits, second:bits>>
}
