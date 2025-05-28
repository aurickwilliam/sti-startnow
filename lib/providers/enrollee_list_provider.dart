import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/student.dart';

class EnrolleeListProvider extends ChangeNotifier {
  int _selectedStatus = 1;

  int get getSelectedStatus => _selectedStatus;

  void changeSelectedStatus(int index) {
    _selectedStatus = index;
    notifyListeners();
  }

  void changeStudentStatus(Student student, String status) {
    student.enrollment.enrollmentStatus = status;
    notifyListeners();
  }

  void setComment(Student student, String message) {
    student.enrollment.adminMessage = message;
    notifyListeners();
  }

  void setReviewer(Student student, String admin, String time) {
    student.enrollment.reviewedBy = admin;
    student.enrollment.timeOfReview = time;
    notifyListeners();
  }

  // Enrollee information (for admin)
  late List<Student> _enrolleeList;

  // Will change depending on the page
  late List<Student> _currentEnrolleeList;

  List<Student> get currentEnrollees => _currentEnrolleeList;

  void setCurrentEnrollees([String programName = ""]) {
    _currentEnrolleeList = [];
    if (programName.isEmpty) {
      _currentEnrolleeList = _enrolleeList;
    } else {
      _currentEnrolleeList =
          _enrolleeList
              .where((student) => student.program!.contains(programName))
              .toList();
    }
    notifyListeners();
  }

  List<Student> get notEnrolledList {
    final enrollees =
        _currentEnrolleeList
            .where(
              (student) =>
                  student.enrollment.enrollmentStatus == "Not Enrolled",
            )
            .toList();

    return enrollees;
  }

  List<Student> get unverifiedList {
    final enrollees =
        _currentEnrolleeList
            .where(
              (student) => student.enrollment.enrollmentStatus == "Unverified",
            )
            .toList();

    return enrollees;
  }

  List<Student> get verifiedList {
    final enrollees =
        _currentEnrolleeList
            .where(
              (student) => student.enrollment.enrollmentStatus == "Verified",
            )
            .toList();

    return enrollees;
  }

  List<Student> get rejectedList {
    final enrollees =
        _currentEnrolleeList
            .where(
              (student) => student.enrollment.enrollmentStatus == "Rejected",
            )
            .toList();

    return enrollees;
  }

  Future<void> initializeEnrollees() async {
    final res = await supabase.from("STUDENT").select('''
          student_id, 
          stud_fname, 
          stud_mname,
          stud_lname,
          stud_suffix,
          personal_email,
          mobile,
          PROGRAM(program_name, acronym),
          ENROLLMENT!STUDENT_current_enrollment_fkey(enrollment_id, enrollment_status, receipt_url,VERIFICATION_LOG(log_time, admin_name, comment))
          ''');

    _enrolleeList = [];
    if (res.isNotEmpty) {
      for (final enrollee in res) {
        final student = Student(
          studentNo: "0${enrollee['student_id']}",
          firstName: enrollee['stud_fname'],
          middleName: enrollee['stud_mname'],
          lastName: enrollee['stud_lname'],
          suffixName: enrollee['stud_suffix'],
          email: enrollee['personal_email'],
          contactNo: enrollee['mobile'],
          program:
              "${enrollee['PROGRAM']['program_name']} (${enrollee['PROGRAM']['acronym']})",
        );

        if (enrollee['ENROLLMENT'] != null) {
          student.enrollmentID = enrollee['ENROLLMENT']['enrollment_id'];
          student.enrollment.enrollmentStatus =
              enrollee['ENROLLMENT']['enrollment_status'];
          student.enrollment.receiptUrl = enrollee['ENROLLMENT']['receipt_url'];
          if (enrollee['ENROLLMENT']['VERIFICATION_LOG'].isNotEmpty &&
              student.enrollment.enrollmentStatus != "Unverified") {
            // Get only the latest verification log data
            final logs = enrollee['ENROLLMENT']['VERIFICATION_LOG'] as List;
            logs.sort((a, b) => b['log_time'].compareTo(a['log_time']));
            final latestLog = logs.first;

            student.enrollment.reviewedBy = latestLog['admin_name'];
            student.enrollment.adminMessage = latestLog['comment'];
            student.enrollment.timeOfReview = latestLog['log_time'];
          }
        } else {
          student.enrollment.enrollmentStatus = "Not Enrolled";
        }
        _enrolleeList.add(student);
      }
    }
  }

  // Para maremove prop drilling istore nalang dito ang enrolling status ni student
  String? enrollingStatus;
}
