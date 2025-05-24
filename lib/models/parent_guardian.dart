class ParentGuardian {
  String? firstName;
  String? lastName;
  String? middleInitial;
  String? suffix;
  String? mobileNumber;
  String? email;
  String? occupation;
  String? relationship;

  String get fullName {
    return "$firstName $lastName";
  }
}
