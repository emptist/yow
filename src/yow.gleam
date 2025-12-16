import positiveint.{new, to_int}

pub fn main() {
  let zero = new(0)
  let negative = new(-1)
  let positive = new(1)

  echo positive |> to_int
  echo zero |> to_int
  echo negative |> to_int
}
// pub opaque type PositiveInt {
//   PositiveInt(inner: Int)
// }

// pub fn new(i: Int) -> PositiveInt {
//   case i >= 0 {
//     True -> PositiveInt(i)
//     False -> PositiveInt(0)
//   }
// }

// pub fn to_int(i: PositiveInt) -> Int {
//   i.inner
// }
