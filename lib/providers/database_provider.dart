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
    _student.studentNo = "0$studentNumber";

    // Read student info
    final studentRes = await supabase
        .from("STUDENT")
        .select('''
          stud_fname, 
          stud_mname, 
          stud_lname, 
          stud_suffix, 
          personal_email, 
          school_email, 
          current_enrollment, 
          PROGRAM(program_name, acronym)
          ''')
        .eq('student_id', studentNumber);

    if (studentRes.isNotEmpty) {
      final studentInfo = studentRes[0];
      _student.firstName = studentInfo['stud_fname'];
      _student.middleName = studentInfo['stud_mname'];
      _student.lastName = studentInfo['stud_lname'];
      _student.suffixName = studentInfo['stud_suffix'];
      _student.email = studentInfo['personal_email'];
      _student.schoolEmail = studentInfo['school_email'];
      _student.enrollmentID = studentInfo['current_enrollment'];
      _student.program =
          "${studentInfo['PROGRAM']['program_name']} (${studentInfo['PROGRAM']['acronym']})";
      return true; // success
    }
    return false; // fail
  }

  Future<void> initializeCurrentEnroll() async {
    // Kapag ganto, not enrolled si student
    if (_student.enrollmentID == null) {
      return;
    }

    // Read student's current enrollment info
    final enrollRes = await supabase
        .from("ENROLLMENT")
        .select('''
          enrollment_status, 
          academic_year, 
          year_level,
          term, 
          SECTION(section_name)
          ''')
        .eq('enrollment_id', _student.enrollmentID!);

    // I am sorry for this, I am tired
    if (enrollRes.isNotEmpty) {
      final enrollInfo = enrollRes[0];
      _student.enrollment.enrollmentStatus = enrollInfo['enrollment_status'];
      _student.enrollment.academicYear = enrollInfo['academic_year'];
      _student.enrollment.yearLevel = enrollInfo['year_level'];
      _student.enrollment.semester = enrollInfo['term'];

      if (enrollInfo['SECTION'] == null) {
        _student.enrollment.section = "Irregular";
      } else {
        _student.enrollment.section = enrollInfo['SECTION']['section_name'];
      }
    }
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

  // Get program_id of new student program
  int get _getProgramID {
    // Get only the program name, remove acronym
    final index = _student.program!.lastIndexOf(' ');
    final programName = _student.program!.substring(0, index);

    // Find program_id based on program name
    final programID =
        _programList.where((program) {
          return program['program_name'] == programName;
        }).toList()[0]['id'];

    return programID;
  }

  // Section information during enrollment
  List<PostgrestMap> _enrollmentSectionList = [];

  List<String> get enrollSections {
    List<String> sectionNames = [];

    for (final section in _enrollmentSectionList) {
      sectionNames.add(section['section_name']);
    }

    return sectionNames;
  }

  // Get current sections based on student program and year level
  void getCurrentSections() {
    final program = _getProgramID;
    final yearLevel = _formattedYearLevel;

    _enrollmentSectionList =
        _sectionList.where((section) {
          return section['program_id'] == program &&
              section['year_level'] == yearLevel;
        }).toList();
  }

  // Get section_id of section ni student para sa enrollment
  int get _getSectionID {
    final id =
        _enrollmentSectionList.where((section) {
          return section['section_name'] == student.enrollment.section;
        }).toList()[0]['section_id'];

    return id;
  }

  // Para mamatch yung format na nakalagay sa database
  String get _formattedYearLevel {
    switch (student.enrollment.yearLevel) {
      case "1st Year":
        return "1YR";
      case "2nd Year":
        return "2YR";
      case "3rd Year":
        return "3YR";
      case "4th Year":
        return "4YR";
    }
    return "";
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
    final studRes = await supabase
        .from("STUDENT")
        .insert({
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
          'program_id': _getProgramID,
        })
        .select('student_id');

    if (studRes.isEmpty) {
      return; // This should not happen
    }

    final studentNumber = studRes[0]['student_id'];
    _student.studentNo = "0$studentNumber";

    // Generate school email for new student
    await _generateSchoolEmail();

    // Enrollment
    final enrollRes = await supabase
        .from("ENROLLMENT")
        .insert({
          'student_id': studentNumber,
          'enrollment_date': DateTime.now().toIso8601String(),
          'admit_type': _student.enrollment.admissionType,
          'academic_status': 'Regular',
          'enrollment_status': 'Unverified',
          'academic_year': _student.enrollment.academicYear,
          'year_level': _student.enrollment.yearLevel,
          'term': _student.enrollment.semester,
          'section_id': _getSectionID,
        })
        .select('enrollment_id');

    if (enrollRes.isEmpty) {
      return; // This should not happen
    }

    // Set the current enrollment of student
    _student.enrollmentID = enrollRes[0]['enrollment_id'];
    _student.enrollment.enrollmentStatus = "Unverified";

    await supabase
        .from("STUDENT")
        .update({'current_enrollment': _student.enrollmentID})
        .eq('student_id', studentNumber);

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

    if (res.isNotEmpty) {
      _programList = res;
      _initializationStatus = true;
    } else {
      _programList = [];
    }
  }

  // Para sa superadmin page
  String getProgramAcronym(int programID) {
    final String acronym =
        _programList
            .where((program) => program['id'] == programID)
            .toList()[0]['acronym'];
    return acronym;
  }

  List<String> getProgramAcronyms() {
    List<String> listOfAcronyms = [];

    for (var record in _programList) {
      listOfAcronyms.add(record['acronym']);
    }

    return listOfAcronyms;
  }

  // Para sa superadmin page, I am sorry for this
  int getAcronymID(String acronym) {
    final int id =
        _programList
            .where((program) => program['acronym'] == acronym)
            .toList()[0]['id'];

    return id;
  }

  // For section information
  late List<PostgrestMap> _sectionList;

  List<PostgrestMap> get sections => _sectionList;

  Future<void> initializeSections() async {
    final res = await supabase
        .from("SECTION")
        .select()
        .order('section_id', ascending: true);

    if (res.isNotEmpty) {
      _sectionList = res;
    } else {
      _sectionList = [];
    }
  }

  // For schedule information
  Future<void> initializeSchedules() async {
    final res = await supabase.from("SCHEDULE").select();
  }

  // For instructor information
  late List<PostgrestMap> _instructorList;

  List<PostgrestMap> get instructors => _instructorList;

  // For superadmin page lang siguro to
  set setInstructors(List<PostgrestMap> newInstructors) {
    _instructorList = newInstructors;
  }

  Future<void> initializeInstructors() async {
    final res = await supabase
        .from("PROFESSOR")
        .select()
        .order('prof_id', ascending: true);

    if (res.isNotEmpty) {
      _instructorList = res;
    } else {
      _instructorList = [];
    }
  }

  // For subject information
  late List<PostgrestMap> _courseList;

  List<PostgrestMap> get courses => _courseList;

  // For superadmin page lang siguro to
  set setCourses(List<PostgrestMap> newCourses) {
    _courseList = newCourses;
  }

  Future<void> initializeCourses() async {
    final res = await supabase
        .from("SUBJECT")
        .select()
        .order('course_code', ascending: true);

    if (res.isNotEmpty) {
      _courseList = res;
    } else {
      _courseList = [];
    }
  }

  // For student information for superadmin
  late List<PostgrestMap> _studentList;

  List<PostgrestMap> get students => _studentList;

  // For superadmin page lang siguro to
  set setStudents(List<PostgrestMap> newStudents) {
    _studentList = newStudents;
  }

  Future<void> initializeStudents() async {
    final res = await supabase
        .from("STUDENT")
        .select('student_id, stud_fname, stud_lname, program_id, mobile')
        .order('student_id', ascending: true);

    if (res.isNotEmpty) {
      _studentList = res;
    } else {
      _studentList = [];
    }
  }

  // For admin logs page
  late List<PostgrestMap> _logList;

  List<PostgrestMap> get logs => _logList;

  // For superadmin page lang siguro to
  set setLogs(List<PostgrestMap> newLogs) {
    _logList = newLogs;
  }

  Future<void> initializeLogs() async {
    final res = await supabase
        .from("VERIFICATION_LOG")
        .select(
          'status, admin_name, log_time, enrollment_id, comment, student_name, student_number',
        )
        .order('log_time', ascending: true);

    if (res.isNotEmpty) {
      _logList = res;
    } else {
      _logList = [];
    }
  }
}
