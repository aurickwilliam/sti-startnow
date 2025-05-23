class Admin {
  String? firstName;
  String? lastName;
  String? role; // Role/Department of admin
  String? email;

  String get fullName {
    return "$firstName $lastName";
  }
}
