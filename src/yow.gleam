import gleam/float
import gleam/int
import gleam/io
import gleam/string as text

// import result_hard.{showresults}

//import playground/echo as playground_echo

pub type Number =
  Int

const myage: Int = 30

pub fn string2int(string: String) -> Int {
  case int.parse(string) {
    Ok(i) -> i
    Error(Nil) -> 0
  }
}

@deprecated("Use addtwo instead")
pub fn add(a: Number, b: Number) -> Number {
  a + b
}

pub fn twice(x: Number, func: fn(Number) -> Number) -> Number {
  func(func(x))
}

pub fn addtwo(a: Number, b: Number) -> Number {
  a + b
}

pub fn main() -> Number {
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
  let add2: fn(Number) -> Number = fn(x) { addtwo(x, 2) }
  let add2too = addtwo(2, _)
  echo add2(3)
  echo add2too(addtwo(5, 6))

  echo "// Float operations"
  let f1 = 1.5
  let f2 = 2.5
  echo float.add(f1, f2)
  let _ = float.add(f1, f2)
  let _ = echo float.parse("3.14")

  io.println("float.parse(\"no\") => " <> text.inspect(float.parse("no")))
  echo "int.clamp(5, 10, 120) " <> text.inspect(int.clamp(5, 10, 120))
  echo 10.0e7
  echo text.inspect(7.0e-10)
  let _v = 7.0e-10

  let a: Number = 2
  let b: Int = 2
  echo { a == b } == True

  echo [{ myage - 2 } * 3, 1 + myage, ..[1, 2, 3]]
  echo addtwo(3, 4)
  echo twice(2, add2)
  echo twice(3, addtwo(_, 4))
  echo twice(3, addtwo(4, _))
  echo twice(5, fn(x) { x * x })
  // Tuples
}
