pub fn main() {
  let zero = new(0)
  let negative = new(-1)
  let positive = PositiveInt(-1)

  echo to_int(positive)
  echo to_int(zero)
  echo to_int(negative)
}

pub opaque type PositiveInt {
  PositiveInt(inner: Int)
}

pub fn new(i: Int) -> PositiveInt {
  case i >= 0 {
    True -> PositiveInt(i)
    False -> PositiveInt(0)
  }
}

pub fn to_int(i: PositiveInt) -> Int {
  i.inner
}
// pub fn factorial(x: PositiveInt) -> PositiveInt {
//   let p1 = new(1)
//   let p0 = new(0)
//   case x {
//     // Base case
//     p0 -> p1
//     p1 -> new(1)

//     // Recursive case
//     _ -> { to_int(x) * to_int(factorial({ to_int(x) - 1 } |> new)) } |> new
//   }
// }
