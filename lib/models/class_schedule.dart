import 'package:intl/intl.dart';

class ClassSchedule {
  final int schedID;
  final String subjectCode;
  final String subject;
  final double units;
  final String startTime;
  final String endTime;
  final String day;
  final String room;
  final String section;
  final String prof;

  ClassSchedule({
    required this.schedID,
    required this.subjectCode,
    required this.subject,
    required this.units,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.room,
    required this.section,
    required this.prof,
  });

  String get fullTime {
    final startDateTime = DateFormat("HH:mm").parse(startTime);
    final endDateTime = DateFormat("HH:mm").parse(endTime);

    final fullSchedTime =
        "${DateFormat("h:mm a").format(startDateTime)} - ${DateFormat("h:mm a").format(endDateTime)}";
    return fullSchedTime;
  }
}
