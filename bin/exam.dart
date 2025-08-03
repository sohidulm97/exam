
void main() {
  Student student = Student(
    "Alice",
    20,
    "123 Main Street",
    "S001",
    "A",
    [85.0, 90.0, 78.5],
  );

  Teacher teacher = Teacher(
    "Mr. John",
    40,
    "456 Elm Street",
    "T001",
    ["Math", "Science", "Physics"],
  );

  print("Student Info:");
  print("Name: ${student.getName}");
  print("Age: ${student.getAge}");
  print("Address: ${student.getAddress}");
  student.displayRole();
  print("Average Score: ${student.calculateAverageScore()}\n");

  print("Teacher Info:");
  print("Name: ${teacher.getName}");
  print("Age: ${teacher.getAge}");
  print("Address: ${teacher.getAddress}");
  teacher.displayRole();
  teacher.displayCoursesTaught();
}

abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Role: Undefined");
  }
}


class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(
      String name,
      int age,
      String address,
      this.studentID,
      this.grade,
      this.courseScores,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}


class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name,
      int age,
      String address,
      this.teacherID,
      this.coursesTaught,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught: ${coursesTaught.join(', ')}");
  }
}



