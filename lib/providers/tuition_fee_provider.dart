import 'package:flutter/widgets.dart';

class TuitionFeeProvider extends ChangeNotifier{
 Map<String, List<List>> bscsTuition = {
  "1Y1": [
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
  "2Y1": [
    ["Tuition Fees", "20000"],
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
  "3Y1": [
    ["Tuition Fees", "30000"],
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
  "4Y1": [
    ["Tuition Fees", "40000"],
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
 }; 

 String selectedYear = "1Y1";

 late Map<String, List<List>> _selectedCourse;

 late List<List> _tuitionSelectedYear;

  void changeSeletectedYear(String yearLevel) {
    selectedYear = yearLevel;
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

  List<List> get tuitionSelectedYear {
    return _selectedCourse[selectedYear] ?? [];
  }
}