import gleam/float
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

pub fn add(a: Int, b: Int) -> Int {
  a + b
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

  echo "// Function capturing"
  let add2: fn(Int) -> Int = fn(x) { add(x, 2) }
  let add2too = add(2, _)
  echo add2(3)
  echo add2too(3)

  echo "// Float operations"
  let f1 = 1.5
  let f2 = 2.5
  echo float.add(f1, f2)
  let _ = float.add(f1, f2)
  let _ = echo float.parse("3.14")

  echo float.parse("no")
}
