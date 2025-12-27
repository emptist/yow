// usinguse.gleam
// Here are more examples of `use` expressions in Gleam with detailed comments, taken from the codebase:

// ## Guard Patterns

// ### 1. Basic guard with early return
// ```gleam
import gleam/bool

pub fn divide(a, b) {
  // If b is 0, return 0 immediately. Otherwise continue with division.
  use <- bool.guard(when: b == 0, return: 0)
  a / b
}

// ``` [1](#1-0) 

// ### 2. Guard with panic on failure
// ```gleam
// import gleam/bool

pub fn divide_panic(a, b) {
  // If b is 0, execute the panic function. Otherwise continue.
  use <- bool.lazy_guard(b == 0, fn() { panic as "Cannot divide by 0" })
  a / b
}

// ``` [2](#1-1) 

// ### 3. Tail recursion with guard
// ```gleam
// import gleam/bool

pub fn count(from: Int, to: Int) -> Int {
  // Return from when the condition is met, otherwise continue recursing
  use <- bool.guard(when: from >= to, return: from)
  echo from
  count(from + 1, to)
}

// ``` [3](#1-2) 

// ## Result Handling Patterns

// ### 4. Simple result mapping
// ```gleam
import gleam/result

pub type Wibble(a, b) {
  Wibble(a: a, b: b)
}

// pub fn main() {
pub fn single_result_mapping() {
  let w = Wibble(1, 2)
  // Map over the Result, extracting the value 'b' if Ok
  use b <- result.map(Ok(3))
  Wibble(..w, b:)
}

// ``` [4](#1-3) 

// ## Multiple Assignment Patterns

// ### 5. Multiple values from one function
// ```gleam
// pub fn main() {

pub fn multiple_things() {
  // Extract multiple values from get_multiple_things()
  use #(one, two, three, four) <- get_multiple_things()
  todo
}

pub fn get_multiple_things(_b: b) -> #(Int, Int, Int, Int) {
  #(1, 2, 3, 4)
}

// ``` [5](#1-4) 

// ### 6. Single value extraction
// ```gleam
// pub fn main() {
pub fn single_value() {
  // Extract a single user value from login()
  use user <- login
  todo
  // login(fn(user) {
  //   todo
  // })

  // fn(user) {
  //   todo
  // } |> login
}

pub fn login(f: fn(String) -> b) -> b {
  f("user")
}

// ``` [6](#1-5) 

// ## Type Annotations

// ### 7. Complex type annotations
// ```gleam
// pub fn main() {
pub fn complex_type() {
  use
    Box(
      xxxxxxxxxxxxxxxxxxxxxxx,
      yyyyyyyyyyyyyyyyyyyyyyyyyyy,
      zzzzzzzzzzzzzzzzzzzzzzzzzzzz,
    ): Box(Int, Bool, String),
    Box(_)
  <- apply(Box(1))
  x
}

pub type Box(Int, Bool, String) {
  Box(a: Int, b: Bool, c: String)
}

pub fn apply(b: Box(a)) -> Box(Box(a)) {
  Box(b)
}

// ``` [7](#1-6) 

// ## Nested Use Patterns

// ### 8. Deeply nested field extraction
// ```gleam
import gleam/dynamic/decode

// pub fn main() {
pub fn nested_fields() {
  // Chain multiple use expressions to extract nested fields
  use _n1 <- decode.field("n1", decode.string)
  use _n2 <- decode.field("n2", decode.string)
  use _n3 <- decode.field("n3", decode.string)
  // ... continues for many more fields
  Nil
}

// ``` [8](#1-7) 

// ## Record Update with Use

// ### 9. Use inside record update
// ```gleam
pub fn example() {
  Record(..record, field: {
    // Use expression inside a record field assignment
    use _ <- list.map(record.field)
    io.print("Example")
  })
}
// ``` [9](#1-8) 

// ## Notes

// - The `use` expression is parsed as a special statement that extracts patterns from the left side and a function call from the right side [10](#1-9) 
// - When a `use` expression has no body and is the last statement in a block, the formatter automatically adds a `todo` [11](#1-10) 
// - The compiler transforms `use` expressions into function calls with anonymous callbacks during type inference [12](#1-11) 

// Wiki pages you might want to explore:
// - [Optimization Passes (gleam-lang/gleam)](gleam-lang/gleam#3.4)

// // ### Citations

// // **File:** compiler-core/src/erlang/tests/inlining.rs (L130-133)
// // ```rust
// pub fn divide(a, b) {
//   use <- bool.guard(when: b == 0, return: 0)
//   a / b
// }
// // ```

// // **File:** compiler-core/src/erlang/tests/inlining.rs (L145-148)
// // ```rust
// pub fn divide(a, b) {
//   use <- bool.lazy_guard(b == 0, fn() { panic as "Cannot divide by 0" })
//   a / b
// }
// // ```

// // **File:** compiler-core/src/erlang/tests/inlining.rs (L160-164)
// // ```rust
// pub fn count(from: Int, to: Int) -> Int {
//   use <- bool.guard(when: from >= to, return: from)
//   echo from
//   count(from + 1, to)
// }
// // ```

// // **File:** compiler-core/src/erlang/tests/inlining.rs (L329-332)
// // ```rust
//   let w = Wibble(1, 2)
//   use b <- result.map(Ok(3))
//   Wibble(..w, b:)
// }
// // ```

// // **File:** compiler-core/src/format/tests/use_.rs (L18-20)
// // ```rust
//   use user <- login()
//   todo
// }
// // ```

// // **File:** compiler-core/src/format/tests/use_.rs (L29-31)
// // ```rust
//   use one, two, three, four <- get_multiple_things()
//   todo
// }
// // ```

// // **File:** compiler-core/src/format/tests/use_.rs (L299-308)
// // ```rust
//   use
//     Box(
//       xxxxxxxxxxxxxxxxxxxxxxx,
//       yyyyyyyyyyyyyyyyyyyyyyyyyyy,
//       zzzzzzzzzzzzzzzzzzzzzzzzzzzz,
//     ): Box(Int, Bool, String),
//     Box(_)
//   <- apply(Box(1))
//   x
// }
// // ```

// // **File:** compiler-core/src/type_/tests.rs (L3190-3245)
// // ```rust
//   use _n1 <- decode.field("n1", decode.string)
//   use _n2 <- decode.field("n2", decode.string)
//   use _n3 <- decode.field("n3", decode.string)
//   use _n4 <- decode.field("n4", decode.string)
//   use _n5 <- decode.field("n5", decode.string)
//   use _n6 <- decode.field("n6", decode.string)
//   use _n7 <- decode.field("n7", decode.string)
//   use _n8 <- decode.field("n8", decode.string)
//   use _n9 <- decode.field("n9", decode.string)
//   use _n10 <- decode.field("n10", decode.string)
//   use _n11 <- decode.field("n11", decode.string)
//   use _n12 <- decode.field("n12", decode.string)
//   use _n13 <- decode.field("n13", decode.string)
//   use _n14 <- decode.field("n14", decode.string)
//   use _n15 <- decode.field("n15", decode.string)
//   use _n16 <- decode.field("n16", decode.string)
//   use _n17 <- decode.field("n17", decode.string)
//   use _n18 <- decode.field("n18", decode.string)
//   use _n19 <- decode.field("n19", decode.string)
//   use _n20 <- decode.field("n20", decode.string)
//   use _n21 <- decode.field("n21", decode.string)
//   use _n22 <- decode.field("n22", decode.string)
//   use _n23 <- decode.field("n23", decode.string)
//   use _n24 <- decode.field("n24", decode.string)
//   use _n25 <- decode.field("n25", decode.string)
//   use _n26 <- decode.field("n26", decode.string)
//   use _n27 <- decode.field("n27", decode.string)
//   use _n28 <- decode.field("n28", decode.string)
//   use _n29 <- decode.field("n29", decode.string)
//   use _n30 <- decode.field("n30", decode.string)
//   use _n31 <- decode.field("n31", decode.string)
//   use _n32 <- decode.field("n32", decode.string)
//   use _n33 <- decode.field("n33", decode.string)
//   use _n34 <- decode.field("n34", decode.string)
//   use _n35 <- decode.field("n35", decode.string)
//   use _n36 <- decode.field("n36", decode.string)
//   use _n37 <- decode.field("n37", decode.string)
//   use _n38 <- decode.field("n38", decode.string)
//   use _n39 <- decode.field("n39", decode.string)
//   use _n40 <- decode.field("n40", decode.string)
//   use _n41 <- decode.field("n41", decode.string)
//   use _n42 <- decode.field("n42", decode.string)
//   use _n43 <- decode.field("n43", decode.string)
//   use _n44 <- decode.field("n44", decode.string)
//   use _n45 <- decode.field("n45", decode.string)
//   use _n46 <- decode.field("n46", decode.string)
//   use _n47 <- decode.field("n47", decode.string)
//   use _n48 <- decode.field("n48", decode.string)
//   use _n49 <- decode.field("n49", decode.string)
//   use _n50 <- decode.field("n50", decode.string)
//   use _n51 <- decode.field("n51", decode.string)
//   use _n52 <- decode.field("n52", decode.string)
//   use _n53 <- decode.field("n53", decode.string)
//   use _n54 <- decode.field("n54", decode.string)
//   use _n55 <- decode.field("n55", decode.string)
//   Nil
// // ```

// // **File:** compiler-core/src/format/tests/record_update.rs (L98-102)
// // ```rust
//   Record(..record, field: {
//     use _ <- list.map(record.field)
//     io.print("Example")
//   })
// }
// // ```

// // **File:** compiler-core/src/parse.rs (L1012-1038)
// // ```rust
//     fn parse_use(&mut self, start: u32, end: u32) -> Result<UntypedStatement, ParseError> {
//         let assignments = match self.tok0 {
//             Some((_, Token::LArrow, _)) => {
//                 vec![]
//             }
//             _ => Parser::series_of(self, &Parser::parse_use_assignment, Some(&Token::Comma))?,
//         };

//         _ = self.expect_one_following_series(&Token::LArrow, "a use variable assignment")?;
//         let call = self.expect_expression()?;

//         let assignments_location = match (assignments.first(), assignments.last()) {
//             (Some(first), Some(last)) => SrcSpan {
//                 start: first.location.start,
//                 end: last.location.end,
//             },
//             (_, _) => SrcSpan { start, end },
//         };

//         Ok(Statement::Use(Use {
//             location: SrcSpan::new(start, call.location().end),
//             assignments_location,
//             right_hand_side_location: call.location(),
//             assignments,
//             call: Box::new(call),
//         }))
//     }
// // ```

// // **File:** changelog/v1.5.md (L340-358)
// // ```markdown
// // - The formatter now adds a `todo` after a `use` expression if it is the last
// //   expression in a block. For example, the following code:

// //   ```gleam
// //   pub fn main() {
// //     use user <- result.try(fetch_user())
// //   }
// //   ```

// //   Is rewritten as:

// //   ```gleam
// //   pub fn main() {
// //     use user <- result.try(fetch_user())
// //     todo
// //   }
// //   ```

// //   ([Giacomo Cavalieri](https://github.com/giacomocavalieri))
// // ```

// // **File:** compiler-core/src/type_/expression.rs (L823-844)
// // ```rust
//         // Collect the following expressions into a function to be passed as a
//         // callback to the use's call function.
//         let callback = UntypedExpr::Fn {
//             arguments: assignments.function_arguments,
//             location: SrcSpan::new(first.start, sequence_location.end),
//             end_of_head_byte_index: sequence_location.end,
//             return_annotation: None,
//             kind: FunctionLiteralKind::Use {
//                 location: use_.location,
//             },
//             body: statements,
//         };

//         // Add this new callback function to the arguments to function call
//         call.arguments.push(CallArg {
//             label: None,
//             location: SrcSpan::new(first.start, sequence_location.end),
//             value: callback,
//             // This argument is implicitly given by Gleam's use syntax so we
//             // mark it as such.
//             implicit: Some(ImplicitCallArgOrigin::Use),
//         });
// // ```
