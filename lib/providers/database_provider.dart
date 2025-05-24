import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/admin.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseProvider extends ChangeNotifier {
  // For student information
  late Student _student;

  Student get student => _student;

  void initializeNewStudent() {
    _student = Student();
  }

  Future<bool> initializeExistingStudent(int studentNumber) async {
    _student = Student();

    // Read student info
    final studentRes = await supabase
        .from("STUDENT")
        .select()
        .eq('student_id', studentNumber);

    if (studentRes.isNotEmpty) {
      final studentInfo = studentRes[0];
      _student.studentNo = "0${studentInfo['student_id']}";
      _student.firstName = studentInfo['stud_fname'];
      _student.middleName = studentInfo['stud_mname'];
      _student.lastName = studentInfo['stud_lname'];
      _student.suffixName = studentInfo['stud_suffix'];
      _student.email = studentInfo['personal_email'];
      _student.schoolEmail = studentInfo['school_email'];

      return true; // successful
    }
    return false; // fail
  }

  // Create new student account
  Future<void> createNewStudent() async {
    final email = _student.email;
    final password = _generateAccessCode();

    final res = await supabase.auth.signUp(email: email, password: password);

    final session = res.session;

    if (session != null) {
      final user = session.user;
      await supabase.from('USER_ROLES').insert({
        'user_id': user.id,
        'role': 'student',
      });
      // I am sorry for this abomination -Patio
      await _insertStudentInfo();
      await _generateSchoolEmail();
    } else {
      debugPrint(
        "This shoud not happen (hopefully)",
      ); // Kasi may try catch naman sa tatawag ng function nato
    }
  }

  // Generate student password/access code for new student
  String _generateAccessCode() {
    final surname = _student.lastName;
    final String year, month, day;
    [year, month, day] = _student.dateOfBirth!.split('-');

    return "$surname$year$month$day";
  }

  // Generate school email for new student
  Future<void> _generateSchoolEmail() async {
    final surname = _student.lastName!.toLowerCase();
    final studentNumber = _student.studentNo!.substring(5);

    _student.schoolEmail = "$surname.$studentNumber@caloocan.sti.edu.ph";

    // Update school email field sa row ni student
    await supabase
        .from("STUDENT")
        .update({'school_email': _student.schoolEmail})
        .eq('student_id', int.parse(_student.studentNo!));
  }

  // Get the studet number for new student (since sa db na generate)
  Future<String> _getNewStudentNumber() async {
    final res = await supabase
        .from("STUDENT")
        .select('student_id')
        .eq('personal_email', _student.email!);

    if (res.isNotEmpty) {
      final studentNumber = res[0]['student_id'];
      return "0$studentNumber";
    }
    return "This should not happen (hopefully)";
  }

  // Find email from student number
  Future<PostgrestMap?> findStudent(
    String credential, {
    bool usedStudentNumber = false,
    bool usedSchoolEmail = false,
  }) async {
    final PostgrestList res; // response mula sa database
    if (usedStudentNumber) {
      res = await supabase
          .from("STUDENT")
          .select('student_id, personal_email')
          .eq('student_id', int.parse(credential));
    } else if (usedSchoolEmail) {
      res = await supabase
          .from("STUDENT")
          .select('student_id, personal_email')
          .eq('school_email', credential);
    } else {
      res = await supabase
          .from("STUDENT")
          .select('student_id, personal_email')
          .eq(
            'personal_email',
            credential,
          ); // Ginagawa ko pa din to para icheck na student talaga (di admin or ano)
    }

    if (res.isEmpty) {
      return null;
    }

    final data = res[0]; // student email and student number
    return data;
  }

  // Insert info ng new student
  Future<void> _insertStudentInfo() async {
    // Personal info
    await supabase.from("STUDENT").insert({
      'stud_lname': _student.lastName,
      'stud_fname': _student.firstName,
      'stud_mname': _student.middleName,
      'gender': _student.gender,
      'birth_date': _student.dateOfBirth,
      'personal_email': _student.email,
      'stud_suffix': _student.suffixName,
      'civil_status': _student.civilStatus,
      'citizenship': _student.citizenship,
      'birth_place': _student.birthPlace,
      'religion': _student.religion,
      'current_address': _student.currentAddress.fullAddress,
      'permanent_address': _student.permanentAddress.fullAddress,
      'telephone': _student.telephone,
      'mobile': _student.contactNo,
    });

    // Get student number para sa susunod na inserts
    _student.studentNo = await _getNewStudentNumber();
    final studentNumber = int.parse(_student.studentNo!);

    // Academic background info
    final school = _student.currentLastSchool;

    await supabase.from("ACADEMIC_BG").insert({
      'student_id': studentNumber,
      'school_type': school.schoolType,
      'school_name': school.schoolName,
      'program': school.program,
      'grad_date':
          school.graduationDate!.isEmpty ? null : school.graduationDate,
      'school_year': school.schoolYear,
      'year_level': school.yearLevel,
      'term': school.term,
    });

    // Parent/Guardian info
    final father = _student.father;
    final mother = _student.mother;
    final guardian = _student.guardian;
    bool guardianInserted = false;
    // Kapag si father/mother ang guardian, wag na insert guardian sa database

    // Check kung may father
    if (father.firstName!.isNotEmpty) {
      father.relationship = 'Father';
      // Check if father is also guardian
      if (guardian.firstName == father.firstName &&
          guardian.lastName == father.lastName) {
        father.relationship = 'Father/Guardian';
        guardianInserted = true;
      }

      await supabase.from('PARENT_GUARDIAN').insert({
        'student_id': studentNumber,
        'fname': father.firstName,
        'lname': father.lastName,
        'minitial': father.middleInitial,
        'suffix': father.suffix,
        'mobile': father.mobileNumber,
        'email': father.email,
        'occupation': father.occupation,
        'relationship': father.relationship,
      });
    }
    // Check kung may mother
    if (mother.firstName!.isNotEmpty) {
      mother.relationship = 'Mother';
      // Check if mother is also guardian
      if (guardian.firstName == mother.firstName &&
          guardian.lastName == mother.lastName) {
        mother.relationship = 'Mother/Guardian';
        guardianInserted = true;
      }

      await supabase.from('PARENT_GUARDIAN').insert({
        'student_id': studentNumber,
        'fname': mother.firstName,
        'lname': mother.lastName,
        'minitial': mother.middleInitial,
        'suffix': mother.suffix,
        'mobile': mother.mobileNumber,
        'email': mother.email,
        'occupation': mother.occupation,
        'relationship': mother.relationship,
      });
    }

    // Insert guardian
    if (!guardianInserted) {
      await supabase.from('PARENT_GUARDIAN').insert({
        'student_id': studentNumber,
        'fname': guardian.firstName,
        'lname': guardian.lastName,
        'minitial': guardian.middleInitial,
        'suffix': guardian.suffix,
        'mobile': guardian.mobileNumber,
        'email': guardian.email,
        'occupation': guardian.occupation,
        'relationship': guardian.relationship,
      });
    }
  }

  // Update info ng existing student
  Future<void> updateStudentInfo() async {}

  // For admin information
  late Admin _admin;

  Admin get admin => _admin;

  Future<void> initializeAdmin(String email, String adminType) async {
    _admin = Admin();
    final List<Map<String, dynamic>> adminRes;

    if (adminType == 'super_admin') {
      adminRes = await supabase.from("SUPER_ADMIN").select().eq('email', email);
    } else {
      adminRes = await supabase.from("ADMIN").select().eq('email', email);
    }

    if (adminRes.isNotEmpty) {
      final adminInfo = adminRes[0];
      _admin.firstName = adminInfo['admin_fname'];
      _admin.lastName = adminInfo['admin_lname'];
      _admin.email = adminInfo['email'];

      if (adminType == 'super_admin') {
        _admin.role = 'MIS';
      } else {
        _admin.role = adminInfo['role'];
      }
    }
  }

  // For program information
  late List<PostgrestMap> _programList;

  List<PostgrestMap> get programs => _programList;

  // Para isang beses lang ma-initialize ang program information sa umpisa ng app
  bool _initializationStatus = false;

  bool get programsInitialized => _initializationStatus;

  // For superadmin page lang siguro to
  set setPrograms(List<PostgrestMap> newPrograms) {
    _programList = newPrograms;
  }

  Future<void> initializePrograms() async {
    final res = await supabase
        .from("PROGRAM")
        .select()
        .order('id', ascending: true);
    _programList = [];
    if (res.isNotEmpty) {
      for (int i = 0; i < res.length; i++) {
        _programList.add(res[i]);
      }
      _initializationStatus = true;
    }
  }
}
