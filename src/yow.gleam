import gleam/dict.{delete, from_list, insert, keys}

pub fn main() {
  let scores = from_list([#("Lucy", 13), #("Drew", 15)])
  echo scores

  let scores =
    dict.from_list([#("Lucy", 13), #("Drew", 15)])
    |> insert("Bushra", 16)
    |> insert("Darius", 14)
    |> delete("Drew")
    |> keys()
  echo scores
}
