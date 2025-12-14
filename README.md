# yow

[![Package Version](https://img.shields.io/hexpm/v/yow)](https://hex.pm/packages/yow)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/yow/)

```sh
gleam add yow@1
```
```gleam
import yow

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/yow>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests

watchexec --wrap-process=session --restart --quiet "clear && gleam test"

watchexec --wrap-process=session --restart --quiet "clear && gleam run"
```

```sh
gleam remove gleeunit
gleam add glacier --dev
gleam clean

gleam test --target erlang -- --glacier
gleam test --target erl -- --glacier

gleam test --target javascript --runtime nodejs -- --glacier
gleam test --target js --runtime node -- --glacier
```