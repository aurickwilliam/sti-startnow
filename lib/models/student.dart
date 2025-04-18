class Student {
  final String firstName;
  final String lastName;
  final String course;
  final String studentNo;
  final String academicType;
  final String email;
  final String contactNo;
  final String profileImg;

  final String receiptImg;

  Student({
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.studentNo,
    required this.academicType,
    required this.email,
    required this.contactNo,
    this.receiptImg = "assets/img/sample_receipt.jpg",
    this.profileImg = "assets/img/def_profile.jpg",
  });
} 