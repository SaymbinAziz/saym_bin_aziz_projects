git import 'dart:io';

class SchoolManager {
  final Map<String, Student> _students = {};
  final Map<String, Course> _courses = {};
  final Map<String, List<String>> _enrollments = {}; 

  void addStudent() {
    stdout.write('Enter student ID: ');
    final id = stdin.readLineSync()?.trim() ?? '';
    stdout.write('Enter student name: ');
    final name = stdin.readLineSync()?.trim() ?? '';

    if (id.isEmpty || name.isEmpty) {
      print('Invalid input.');
      return;
    }

    if (_students.containsKey(id)) {
      print('Student with this ID already exists.');
      return;
    }

    _students[id] = Student(id, name);
    print('Student added successfully.');
  }

  void viewStudents() {
    if (_students.isEmpty) {
      print('No students available.');
      return;
    }

    print('Students:');
    _students.forEach((id, student) {
      print('${student.id}: ${student.name}');
    });
  }

  void removeStudent() {
    stdout.write('Enter student ID to remove: ');
    final id = stdin.readLineSync()?.trim() ?? '';

    if (id.isEmpty || !_students.containsKey(id)) {
      print('Invalid student ID.');
      return;
    }

    _students.remove(id);
    _enrollments.remove(id);
    print('Student removed successfully.');
  }

  void addCourse() {
    stdout.write('Enter course ID: ');
    final id = stdin.readLineSync()?.trim() ?? '';
    stdout.write('Enter course name: ');
    final name = stdin.readLineSync()?.trim() ?? '';

    if (id.isEmpty || name.isEmpty) {
      print('Invalid input.');
      return;
    }

    if (_courses.containsKey(id)) {
      print('Course with this ID already exists.');
      return;
    }

    _courses[id] = Course(id, name);
    print('Course added successfully.');
  }

  void viewCourses() {
    if (_courses.isEmpty) {
      print('No courses available.');
      return;
    }

    print('Courses:');
    _courses.forEach((id, course) {
      print('${course.id}: ${course.name}');
    });
  }

  void removeCourse() {
    stdout.write('Enter course ID to remove: ');
    final id = stdin.readLineSync()?.trim() ?? '';

    if (id.isEmpty || !_courses.containsKey(id)) {
      print('Invalid course ID.');
      return;
    }

    _courses.remove(id);
    _enrollments.forEach((studentId, courseIds) {
      courseIds.remove(id);
    });
    print('Course removed successfully.');
  }

  void enrollStudent() {
    stdout.write('Enter student ID: ');
    final studentId = stdin.readLineSync()?.trim() ?? '';
    stdout.write('Enter course ID: ');
    final courseId = stdin.readLineSync()?.trim() ?? '';

    if (!_students.containsKey(studentId) || !_courses.containsKey(courseId)) {
      print('Invalid student or course ID.');
      return;
    }

    _enrollments.putIfAbsent(studentId, () => []);
    if (_enrollments[studentId]!.contains(courseId)) {
      print('Student is already enrolled in this course.');
      return;
    }

    _enrollments[studentId]!.add(courseId);
    print('Student enrolled in course successfully.');
  }

  void viewEnrollments() {
    if (_enrollments.isEmpty) {
      print('No enrollments available.');
      return;
    }

    print('Enrollments:');
    _enrollments.forEach((studentId, courseIds) {
      final studentName = _students[studentId]?.name ?? 'Unknown';
      print('$studentName ($studentId) is enrolled in:');
      courseIds.forEach((courseId) {
        final courseName = _courses[courseId]?.name ?? 'Unknown';
        print('- $courseName ($courseId)');
      });
    });
  }
}

class Student {
  final String id;
  final String name;

  Student(this.id, this.name);
}

class Course {
  final String id;
  final String name;

  Course(this.id, this.name);
}
