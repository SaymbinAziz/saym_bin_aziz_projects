import 'dart:io';

void main() {
  final manager = SchoolManager();

  while (true) {
    print('--- School Database Management System ---');
    print('1. Add Student');
    print('2. View Students');
    print('3. Remove Student');
    print('4. Add Course');
    print('5. View Courses');
    print('6. Remove Course');
    print('7. Enroll Student in Course');
    print('8. View Enrollments');
    print('9. Exit');
    stdout.write('Select an option: ');

    final option = stdin.readLineSync();

    switch (option) {
      case '1':
        manager.addStudent();
        break;
      case '2':
        manager.viewStudents();
        break;
      case '3':
        manager.removeStudent();
        break;
      case '4':
        manager.addCourse();
        break;
      case '5':
        manager.viewCourses();
        break;
      case '6':
        manager.removeCourse();
        break;
      case '7':
        manager.enrollStudent();
        break;
      case '8':
        manager.viewEnrollments();
        break;
      case '9':
        print('Exiting...');
        exit(0);
      default:
        print('Invalid option, please try again.');
    }
  }
}

SchoolManager() {
}


