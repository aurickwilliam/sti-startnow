import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/student.dart';

class DatabaseProvider extends ChangeNotifier {
  // For student information
  late Student _student;

  Student get student => _student;

  void initializeNewStudent() {
    _student = Student();
  }

  Future<void> initializeExistingStudent(String email) async {
    _student = Student();
    _student.email = email;

    // Email gamit ko pang search ng database since sa database lang naaaccess ang student number
    // Ano pa ba pede gawin?
    final res = await supabase
        .from("STUDENT")
        .select()
        .eq('personal_email', _student.email!);

    _student.studentNo = res[0]['student_id'].toString();
    _student.firstName = res[0]['stud_fname'];
    _student.middleName = res[0]['stud_mname'];
    _student.lastName = res[0]['stud_lname'];
  }

  // Create new student account
  Future<void> createNewStudent() async {
    // Generate student password/access code
    final surname = _student.lastName;
    final String year, month, day;
    [year, month, day] = student.dateOfBirth!.split('-');

    final res = await supabase.auth.signUp(
      email: student.email,
      password: "$surname$year$month$day",
    );

    final session = res.session;

    if (session != null) {
      final user = session.user;
      await supabase.from('user_roles').insert({
        'user_id': user.id,
        'role': 'student',
      });
      await _insertStudentInfo();
    }
  }

  // Find email from student number
  Future<String?> findEmail(String studentNumber) async {
    final res = await supabase
        .from("STUDENT")
        .select('personal_email')
        .eq('student_id', studentNumber);

    if (res.isEmpty) {
      return null;
    }

    final email = res[0]['personal_email'];
    return email;
  }

  // Insert info ng new student
  Future<void> _insertStudentInfo() async {
    await supabase.from('STUDENT').insert({
      'stud_lname': _student.lastName,
      'stud_fname': _student.firstName,
      'stud_mname': _student.middleName,
      'gender': _student.gender,
      'birth_date': _student.dateOfBirth,
      'personal_email': _student.email,
    });
  }

  // Update info ng existing student
  Future<void> updateStudentInfo() async {}
}
