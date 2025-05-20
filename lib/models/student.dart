import 'package:sti_startnow/models/address.dart';
import 'package:sti_startnow/models/enrollment.dart';
import 'package:sti_startnow/models/parent_guardian.dart';
import 'package:sti_startnow/models/school.dart';

class Student {
  String? course;
  String? firstName;
  String? middleName;
  String? lastName;
  String? suffixName;
  String? gender;
  String? civilStatus;
  String? citizenship;
  String? dateOfBirth; // Gawing DateTime ba? maybe
  String? birthPlace;
  String? religion;
  late Address currentAddress;
  late Address permanentAddress;
  String? telephone;
  String? contactNo;
  String? email;
  late School currentLastSchool;
  late ParentGuardian father;
  late ParentGuardian mother;
  late ParentGuardian guardian;
  late Enrollment enrollment;
  String? studentNo;
  String? academicType;
  String profileImg;
  final String receiptImg;

  Student({
    this.course,
    this.firstName,
    this.lastName,
    this.studentNo,
    this.academicType,
    this.email,
    this.contactNo,
    this.receiptImg = "assets/img/sample_receipt.jpg",
    this.profileImg = "assets/img/def_profile.jpg",
  }) {
    currentAddress = Address();
    permanentAddress = Address();

    currentLastSchool = School();

    father = ParentGuardian();
    father.relationship = "Father";
    mother = ParentGuardian();
    mother.relationship = "Mother";
    guardian = ParentGuardian();

    enrollment = Enrollment();
  }
}
