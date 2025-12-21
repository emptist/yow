type SchoolPerson {
  Teacher(name: String, age: Int, subject: String)
}

fn update_teacher_subject(teacher, new_subject) {
  echo Teacher(..teacher, subject: new_subject)
}

pub fn main() {
  let teacher = Teacher("Alice", 30, "Math")
  let teacher2 = Teacher(..teacher, subject: "History")
  echo teacher2
  let _ = update_teacher_subject(teacher, "Science")
  Nil
}
