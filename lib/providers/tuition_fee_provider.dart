import 'package:flutter/widgets.dart';

class TuitionFeeProvider extends ChangeNotifier{
 Map<String, Map<String, List<List>>> bscsTuition = {
  "1Y1": {
    "Cash": [
      ["Tuition Fees", "10000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["Total:", "36000"],
    ],

    "Low Down": [
      ["Tuition Fees", "10000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["2nd: Prelims", "7877"],
      ["3rd: Midterms", "7877"],
      ["4th: Prefinals", "7877"],
      ["5th: Finals", "7877"],
      ["Total:", "36000"],
    ],

    "Units": [["10"]],
  },
  "2Y1": {
    "Cash": [
      ["Tuition Fees", "20000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["Total:", "36000"],
    ],

    "Low Down": [
      ["Tuition Fees", "10000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["2nd: Prelims", "7877"],
      ["3rd: Midterms", "7877"],
      ["4th: Prefinals", "7877"],
      ["5th: Finals", "7877"],
      ["Total:", "36000"],
    ],
    "Units": [["20"]],
  },
  "3Y1": {
    "Cash": [
      ["Tuition Fees", "30000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["Total:", "36000"],
    ],

    "Low Down": [
      ["Tuition Fees", "10000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["2nd: Prelims", "7877"],
      ["3rd: Midterms", "7877"],
      ["4th: Prefinals", "7877"],
      ["5th: Finals", "7877"],
      ["Total:", "36000"],
    ],
    "Units": [["30"]],
  },
  "4Y1": {
    "Cash": [
      ["Tuition Fees", "40000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["Total:", "36000"],
    ],

    "Low Down": [
      ["Tuition Fees", "10000"],
      ["Miscellaneous Fees", "5000"],
      ["Other School Fees", "5000"],
      ["Total:", "35000"],
      ["1st: Upon Enrollment", "7877"],
      ["2nd: Prelims", "7877"],
      ["3rd: Midterms", "7877"],
      ["4th: Prefinals", "7877"],
      ["5th: Finals", "7877"],
      ["Total:", "36000"],
    ],
    "Units": [["40"]],
  }
 }; 
 

 String _selectedYear = "";
 String _selectedType = "Cash";
 List<List> _tuition = [];

 String _units = "0";
 List<List> breakDown = [];
 List<List> paymentSched = [];

 String get selectedYear {
  return _selectedYear;
 }

  String get selectedType {
  return _selectedType;
 }

 late Map<String, Map<String, List<List>>> _selectedCourse;

  void changeSeletectedYear(String yearLevel) {
    _selectedYear = yearLevel;
    _tuition = _selectedCourse[_selectedYear]?[selectedType] ?? [];
    _units = _selectedCourse[_selectedYear]?["Units"]?[0][0];

    separateData();

    notifyListeners();
  }

  void changeSeletectedType(String type) {
    _selectedType = type;
    _tuition = _selectedCourse[_selectedYear]?[selectedType] ?? [];

    separateData();

    notifyListeners();
  }

  void changeSelectedCourse(String acronym) {
    switch(acronym){
      case "BSCS":
        _selectedCourse = bscsTuition;
      default:
        _selectedCourse = bscsTuition;
    }
    notifyListeners();
  }

  Map<String, Map<String, List<List>>> get selectedCourse {
    return _selectedCourse;
  }

  Object get tuitionSelectedYear {
    return _selectedCourse[_selectedYear] ?? [];
  }

  String get units {
    return _units;
  }

  List<List> get tuitionType {
    return _tuition;
  }

  void separateData(){
    breakDown = [];
    paymentSched = [];

    for (var i = 0; i < 4; i++) {
      breakDown.add(_tuition[i]);
    }

    for (var i = 4; i < _tuition.length ; i++) {
      paymentSched.add(_tuition[i]);
    }

    notifyListeners();
  }
}