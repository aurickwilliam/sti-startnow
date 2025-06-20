import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/class_schedule.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/schedule_tile.dart';
import 'package:sti_startnow/pages/enrollment/components/download_toast.dart';
import 'package:sti_startnow/pdf/save_and_open_pdf.dart';
import 'package:sti_startnow/pdf/time_table_api.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({super.key});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  late Student student;
  late final String day;
  late List<List> scheduleData;
  late FToast fToast;

  void getScheduleToday(List<ClassSchedule> studSched) {
    scheduleData = [];
    final currentDay = getDayInitial(day);
    for (final sched in studSched) {
      if (sched.day == currentDay) {
        scheduleData.add([sched.subject, sched.prof, sched.fullTime]);
      }
    }
  }

  String getDayInitial(String day) {
    switch (day) {
      case 'Monday':
        return 'M';
      case 'Tuesday':
        return 'T';
      case 'Wednesday':
        return 'W';
      case 'Thursday':
        return 'TH';
      case 'Friday':
        return 'F';
      case 'Saturday':
        return 'S';
      default:
        return '';
    }
  }

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;
    day = DateFormat('EEEE').format(DateTime.now());

    if (student.enrollmentID == null) {
      scheduleData = [];
    } else {
      getScheduleToday(student.enrollment.subjectList);
    }

    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String message, bool isSuccess) {
    Widget toast = DownloadToast(
      message: message,
      isSuccess: isSuccess,
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return student.enrollmentID != null
        ? Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 4.0,
                offset: Offset(0, 1),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title Text
                    Text(
                      "Schedule Today:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Button for download
                    IconButton(
                      onPressed: () async {
                        final timeTable =
                            await TimeTableApi.generateTimeTablePdf(student);
                          

                        //SaveAndOpenPdf.openPdf(timeTable);
                        if (timeTable != null) {
                          _showToast(
                            "Downloaded",
                            true
                          );
                        }
                        else {
                          _showToast(
                            "Error",
                            false
                          );
                        }
                        
                      },
                      icon: Icon(
                        Icons.file_download_outlined,
                        color: AppTheme.colors.primary,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(),

              // Day Text
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  scheduleData.isNotEmpty ? day : "No Schedule Today",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: scheduleData.isNotEmpty ? 32 : 24,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(scheduleData.length, (index) {
                    return ScheduleTile(
                      subName: scheduleData[index][0],
                      instructorName: scheduleData[index][1],
                      time: scheduleData[index][2],
                    );
                  }),
                ),
              ),
            ],
          ),
        )
        : Container();
  }
}
