import gleam/result.{map, try}

pub fn main() {
  // These two functions do exactly the same thing, but one is written with
  // `use`, and one without.
  let _ = echo with_use()
  let _ = echo without_use()
}

pub fn with_use() -> Result(String, Nil) {
  use username <- try(get_username())
  use password <- try(get_password())
  use greeting <- map(log_in(username, password))
  greeting <> ", " <> username
}

pub fn without_use() -> Result(String, Nil) {
  try(get_username(), fn(username) {
    try(get_password(), fn(password) {
      map(log_in(username, password), fn(greeting) {
        greeting <> ", " <> username
      })
    })
  })
}

// Here are some pretend functions for this example:

fn get_username() -> Result(String, Nil) {
  Ok("alice")
}

fn get_password() -> Result(String, Nil) {
  Ok("hunter2")
}

fn log_in(username: String, password: String) -> Result(String, Nil) {
  case username == "alicea" && password == "hunter2" {
    True -> Ok("Welcome")
    False -> Ok("Wrong username or password")
  }
}
