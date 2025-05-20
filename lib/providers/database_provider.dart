import 'package:flutter/material.dart';
import 'package:sti_startnow/models/student.dart';

class DatabaseProvider extends ChangeNotifier {
  late Student _student;

  Student get student => _student;

  void initializeNewStudent() {
    _student = Student();
  }

  void initializeExistingStudent() {
    // Kapag may database na
  }
}
