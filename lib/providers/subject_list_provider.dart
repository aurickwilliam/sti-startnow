import 'package:flutter/material.dart';
import 'package:sti_startnow/models/subject.dart';

class SubjectListProvider extends ChangeNotifier {
  // Temporary Data for Subject List
  Map<int, List<Subject>> subjectPerYear = {
    1: [
      Subject(name: "1 Information Management", code: "COSC1001", units: 3.00),
      Subject(name: "1 Ethics", code: "COSC1001", units: 3.00),
      Subject(name: "1 Great Books", code: "COSC1001", units: 3.00),
    ],

    2: [
      Subject(name: "2 Information Management", code: "COSC1001", units: 3.00),
      Subject(name: "2 Ethics", code: "COSC1001", units: 3.00),
      Subject(name: "2 Great Books", code: "COSC1001", units: 3.00),
    ],

    3: [
      Subject(name: "3 Information Management", code: "COSC1001", units: 3.00),
      Subject(name: "3 Ethics", code: "COSC1001", units: 3.00),
      Subject(name: "3 Great Books", code: "COSC1001", units: 3.00),
    ],

    4: [
      Subject(name: "4 Information Management", code: "COSC1001", units: 3.00),
      Subject(name: "4 Ethics", code: "COSC1001", units: 3.00),
      Subject(name: "4 Great Books", code: "COSC1001", units: 3.00),
    ],
  };

  // Variable for the selected Year
  int selectedYear = 1;

  // Getter function para sa selectedYear
  int get getSelectedYear {
    return selectedYear;
  }

  // Change the selected year level
  void changeSeletectedYear(int year){
    selectedYear = year;
    notifyListeners();
  }

  // Getter for all the subjects for the selected Year
  List<Subject> get subjectsForSelectedYear {
    // Might be null return empty list
    return subjectPerYear[selectedYear] ?? [];
  }

  // Filter and put all the selected subject in a single list
  List<Subject> get allSelectedSubjects {
    return subjectPerYear.values
      .expand((list) => list)
      .where((subject) => subject.isSelected)
      .toList();
  }

  // Method to call to change the isSelected of the Subject
  void toggleSubject(Subject subject){
    subject.isSelected = !subject.isSelected;
    notifyListeners();
  }

  // Get total units
  double getTotalUnitsSelectedSubjects(){
    double total = 0;

    allSelectedSubjects.forEach((subject) {
      total += subject.units;  
    });

    return total;
  }
}