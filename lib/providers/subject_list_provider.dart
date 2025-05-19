import 'package:flutter/material.dart';
import 'package:sti_startnow/models/subject.dart';

class SubjectListProvider extends ChangeNotifier {
  // Temporary Data for Subject List
  Map<int, List<Subject>> subjectPerYear = {
    1: [
      Subject(
        name: "Euthenics",
        code: "COSC1001",
        units: 3.00,
        schedule: "7:00AM - 9:00AM",
        day: "S",
        room: "306",
      ),
      Subject(
        name: "Calculus",
        code: "COSC1002",
        units: 3.00,
        schedule: "9:00AM - 11:00AM",
        day: "S",
        room: "306",
      ),
      Subject(
        name: "Purposive Communication",
        code: "COSC1003",
        units: 3.00,
        schedule: "11:30AM - 1:00PM",
        day: "S",
        room: "306",
      ),
    ],

    2: [
      Subject(
        name: "Understanding the Self",
        code: "COSC1004",
        units: 3.00,
        schedule: "7:00AM - 9:00AM",
        day: "M",
        room: "406",
      ),
      Subject(
        name: "Philippine Popular Culture",
        code: "COSC1005",
        units: 3.00,
        schedule: "9:00AM - 11:00AM",
        day: "M",
        room: "406",
      ),
      Subject(
        name: "Rizal's Life & Works",
        code: "COSC1006",
        units: 3.00,
        schedule: "11:30AM - 1:00PM",
        day: "M",
        room: "406",
      ),
    ],

    3: [
      Subject(
        name: "Information Management",
        code: "COSC1007",
        units: 3.00,
        schedule: "7:00AM - 9:00AM",
        day: "T",
        room: "506",
      ),
      Subject(
        name: "Ethics",
        code: "COSC1008",
        units: 3.00,
        schedule: "9:00AM - 11:00AM",
        day: "T",
        room: "506",
      ),
      Subject(
        name: "Great Books",
        code: "COSC1009",
        units: 3.00,
        schedule: "11:30AM - 1:00PM",
        day: "T",
        room: "506",
      ),
    ],

    4: [
      Subject(
        name: "Fundamentals of Mobile Programming",
        code: "COSC1010",
        units: 3.00,
        schedule: "7:00AM - 9:00AM",
        day: "F",
        room: "906",
      ),
      Subject(
        name: "Human-Computer Interaction",
        code: "COSC1011",
        units: 3.00,
        schedule: "9:00AM - 11:00AM",
        day: "F",
        room: "906",
      ),
      Subject(
        name: "Artificial Intelligence",
        code: "COSC1012",
        units: 3.00,
        schedule: "11:30AM - 1:00PM",
        day: "F",
        room: "906",
      ),
    ],
  };

  // Variable for the selected Year
  int selectedYear = 1;

  // Getter function para sa selectedYear
  int get getSelectedYear {
    return selectedYear;
  }

  // Change the selected year level
  void changeSeletectedYear(int year) {
    selectedYear = year;
    notifyListeners();
  }

  // Getter for all the subjects for the selected Year
  List<Subject> get subjectsForSelectedYear {
    // Might be null return empty list
    return subjectPerYear[selectedYear] ?? [];
  }

  // Filter and put all the selected subject in a single list
  // Brute force coding go brrrr, refactor nalang pag may db na
  List<List> get allSelectedSubjects {
    return subjectPerYear.values
        .expand((list) => list)
        .where((subject) => subject.isSelected)
        .map((subject) {
          return [
            subject.code,
            subject.name,
            subject.units,
            subject.schedule,
            subject.day,
            subject.room,
          ];
        })
        .toList();
  }

  // Method to call to change the isSelected of the Subject
  void toggleSubject(Subject subject) {
    subject.isSelected = !subject.isSelected;
    notifyListeners();
  }

  // Get total units
  double getTotalUnitsSelectedSubjects() {
    double total = 0;

    for (final subject in allSelectedSubjects) {
      total += subject[2];
    }

    return total;
  }
}
