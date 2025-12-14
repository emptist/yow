import glacier
import glacier/should

pub fn main() -> Nil {
  glacier.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  // let name = "Joe"
  // let greeting = "Hello, " <> name <> "!"

  //assert greeting == "Hello, Joe!"
  2
  |> should.equal(2)
}
