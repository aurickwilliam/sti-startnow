import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pdf/save_and_open_pdf.dart';

class TimeTableApi {
  static Future<File> generateTimeTablePdf(Student student) async {
    final pdf = Document();

    // List of Days
    final List<String> daysLabel = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    final List<String> days = ["M", "T", "W", "TH", "F", "S"];

    // List of Time Slots
    final List<String> timeSlots = [
      "07:00 - 7:30",
      "07:30 - 8:00",
      "08:00 - 8:30",
      "08:30 - 9:00",
      "09:00 - 9:30",
      "09:30 - 10:00",
      "10:00 - 10:30",
      "10:30 - 11:00",
      "11:00 - 11:30",
      "11:30 - 12:00",
      "12:00 - 12:30",
      "12:30 - 13:00",
      "13:00 - 13:30",
      "13:30 - 14:00",
      "14:00 - 14:30",
      "14:30 - 15:00",
      "15:00 - 15:30",
      "15:30 - 16:00",
      "16:00 - 16:30",
      "16:30 - 17:00",
      "17:00 - 17:30",
      "17:30 - 18:00",
      "18:00 - 18:30",
      "18:30 - 19:00",
      "19:00 - 19:30",
      "19:30 - 20:00",
    ];

    // Dimensions
    const double cellWidth = 75;
    const double cellHeight = 25;

    double getX(String day) {
      return cellWidth + days.indexOf(day) * cellWidth;
    }

    double getY(String time) {
      final parts = time.split(':');

      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      int slotIndex = (hour - 7) * 2 + (minute >= 30 ? 1 : 0); 

      return (slotIndex * cellHeight) + (cellHeight * 2);
    }

    double getHeight(String start, String end) {
      final startHour = int.parse(start.split(':')[0]);
      final startMin = int.parse(start.split(':')[1]);
      final endHour = int.parse(end.split(':')[0]);
      final endMin = int.parse(end.split(':')[1]);

      int startInMin = startHour * 60 + startMin;
      int endInMin = endHour * 60 + endMin;

      int duration = endInMin - startInMin;

      return (duration / 30) * cellHeight;
    }

    pdf.addPage(
      Page(
        margin: EdgeInsets.all(40),
        pageFormat: PdfPageFormat.letter.portrait,
        build: (Context context) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name: ${student.fullName}"
                    ),

                    SizedBox(width: 50),

                    Text(
                      "Section: ${student.enrollment.section}"
                    )
                  ]
                )
              ),

              // Position the timeslots
              ...List.generate(timeSlots.length, (index) {
                return Positioned(
                  left: 0,
                  top: (cellHeight * 2) + (index * cellHeight),
                  child: Container(
                    width: cellWidth,
                    height: cellHeight,
                    decoration: BoxDecoration(
                      border: Border.all(color: PdfColors.grey),
                      color: PdfColors.grey200,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      timeSlots[index],
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                );
              }),


              // Position ung mga grid box sa tabi ng timeslot
              ...daysLabel.asMap().entries.expand((entry) {
                return List.generate(timeSlots.length, (j) {
                  return Positioned(
                    left: cellWidth + (cellWidth * entry.key),
                    top: (cellHeight * 2) + (j * cellHeight),
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: PdfColors.grey),
                      ),
                    ),
                  );
                });
              }),

              // Position the day headers
              ...daysLabel.asMap().entries.map((entry) {
                return Positioned(
                  left: cellWidth + entry.key * cellWidth,
                  top: cellHeight,
                  child: Container(
                    width: cellWidth,
                    height: cellHeight,
                    decoration: BoxDecoration(
                      color: PdfColors.amber,
                      border: Border.all(
                        color: PdfColors.grey
                      )
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      entry.value, 
                      style: TextStyle(
                        fontSize: 12, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  )
                );
              }),

              // Position the schedule blocks
              ...student.enrollment.subjectList!.map((schedule) {
                final x = getX(schedule.day);
                final y = getY(schedule.startTime);
                final height = getHeight(schedule.startTime, schedule.endTime);

                
                print("SHIBALL: ${schedule.subject}");
                print("SHIBALL: ${schedule.startTime}");
                print("SHIBALL: ${schedule.endTime}");
                print("SHIBALL: ${schedule.day}");
                print("");


                return Positioned(
                  left: x,
                  top: y,
                  child: Container(
                    width: cellWidth,
                    height: height,
                    decoration: BoxDecoration(
                      color: PdfColors.lightBlue,
                      border: Border.all(color: PdfColors.blueGrey),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '${schedule.subject}\nRoom: ${schedule.room}',
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      )
    );

    return SaveAndOpenPdf.savePdf(name: "time-table-${student.lastName?.toLowerCase()}.pdf", pdf: pdf);
  }
}