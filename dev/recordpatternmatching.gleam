import gleam/io

type Fish {
  Starfish(name: String, favourite_colour: String)
  Jellyfish(name: String, jiggly: Bool)
}

// pub 
type IceCream {
  IceCream(flavour: String)
}

fn handle_fish(fish: Fish) {
  case fish {
    Starfish(_, favourite_colour) ->
      io.println("favourite_colour: " <> favourite_colour)
    Jellyfish(name, ..) -> io.println("name: " <> name)
  }
}

fn handle_ice_cream(ice_cream: IceCream) {
  // if the custom type has a single variant you can
  // destructure it using `let` instead of a case expression!
  let IceCream(flavour) = ice_cream
  io.println("flavour: " <> flavour)
}

pub fn main() {
  handle_fish(Starfish(name: "Lucy", favourite_colour: "Pink"))
  handle_fish(Jellyfish(name: "Bob", jiggly: True))
  handle_ice_cream(IceCream("strawberry"))
  //   let IceCream(flavour) = IceCream("chocolate")
  //   io.println(flavour)
  handle_ice_cream(IceCream("chocolate"))
}
