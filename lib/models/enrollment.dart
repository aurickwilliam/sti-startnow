import 'package:sti_startnow/models/class_schedule.dart';

class Enrollment {
  //DateTime? enrollmentDate;
  String? admissionType;
  String? academicStatus;
  String? academicYear;
  String? semester;
  String? yearLevel;
  String? section;
  String? enrollmentStatus;
  List<ClassSchedule> subjectList = [];
  String? receiptImg; // File name palang

  // Gawa ba model para sa financial statement?
  String? paymentLocation;
  String? paymentType;
  String? referenceNo;
  String? amountPaid;

  // Para sa admin
  String? reviewedBy;
  String? adminMessage;
  String? timeOfReview;
}
