import 'package:flutter/material.dart';
import 'package:sti_startnow/models/student.dart';

class EnrolleeListProvider extends ChangeNotifier {
  // Per Course List Student Status
  // Refactor kapag may DB na

  /* Computer Science
  Map<int, List<Student>> studentList = {
    1: [
      Student(
        firstName: "John",
        lastName: "UNVERIFIED",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Charlie",
        lastName: "Fulgencio",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Speed",
        lastName: "Watkins Jr.",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
    ],

    2: [
      Student(
        firstName: "Sheldon",
        lastName: "PENDING",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Leonard",
        lastName: "Hofdstather",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Penny",
        lastName: "Coin",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
    ],

    3: [
      Student(
        firstName: "Kai",
        lastName: "VERIFIED",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Ray",
        lastName: "Quan",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Duke",
        lastName: "Dennis",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
    ],

    4: [
      Student(
        firstName: "Kai",
        lastName: "Rejected",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Ray",
        lastName: "Quan",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
      Student(
        firstName: "Duke",
        lastName: "Dennis",
        course: "BSCS",
        studentNo: "02000123456",
        academicType: "Regular",
        email: "johndoe@gmail.com",
        contactNo: "09123456789",
      ),
    ],
  };
  */

  List<Student> fullListofStudents = [
    Student(
      firstName: "John",
      lastName: "UNVERIFIED",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
    ),
    Student(
      firstName: "Charlie",
      lastName: "Fulgencio",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
    ),
    Student(
      firstName: "Speed",
      lastName: "Watkins Jr.",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
    ),
    Student(
      firstName: "Sheldon",
      lastName: "PENDING",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Not Enrolled",
    ),
    Student(
      firstName: "Leonard",
      lastName: "Hofdstather",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Not Enrolled",
    ),
    Student(
      firstName: "Penny",
      lastName: "Coin",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Not Enrolled",
    ),
    Student(
      firstName: "Kai",
      lastName: "VERIFIED",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Verified",
    ),
    Student(
      firstName: "Ray",
      lastName: "Quan",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Verified",
    ),
    Student(
      firstName: "Duke",
      lastName: "Dennis",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Verified",
    ),
    Student(
      firstName: "Mario",
      lastName: "VERIFIED",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Rejected",
    ),
    Student(
      firstName: "Luigi",
      lastName: "Quan",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Rejected",
    ),
    Student(
      firstName: "Bowser",
      lastName: "Dennis",
      course: "BSCS",
      studentNo: "02000123456",
      academicType: "Regular",
      email: "johndoe@gmail.com",
      contactNo: "09123456789",
      status: "Rejected",
    ),
  ];
  int selectedStatus = 1;

  int get getSelectedStatus {
    return selectedStatus;
  }

  void changeSelectedStatus(int index) {
    selectedStatus = index;
    notifyListeners();
  }

  List<Student> get getSelectedStudents {
    switch (getSelectedStatus) {
      case 1:
        return fullListofStudents
            .where((student) => student.status == "Not Enrolled")
            .toList();
      case 2:
        return fullListofStudents
            .where((student) => student.status == "Unverified")
            .toList();
      case 3:
        return fullListofStudents
            .where((student) => student.status == "Verified")
            .toList();
      case 4:
        return fullListofStudents
            .where((student) => student.status == "Rejected")
            .toList();
      default:
        return [];
    }
  }

  void changeStudentStatus(Student student, String status) {
    if (student.status == "Rejected") {
      student.denyMessage =
          null; // Clear deny message kapag binago status ng rejected student
    }
    student.status = status;
    notifyListeners();
  }

  void setDenyMessage(Student student, String message) {
    student.denyMessage = message;
    notifyListeners();
  }
}
