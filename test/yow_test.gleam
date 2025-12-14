// import glacier
// import glacier/should
import wisp.{type Request, type Response}

pub fn handler(req: Request) -> Response {
  let html = "<h1> Hello html </h1>"
  wisp.response.html(html, 200)
}

pub fn main() -> Nil {
  let resp = handler(Request.new("GET", "/"))
  resp.body
  |> should.equal("<h1> Hello html </h1>")
}
