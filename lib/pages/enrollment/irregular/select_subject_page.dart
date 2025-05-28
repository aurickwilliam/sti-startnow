import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/class_schedule.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/enrollment/components/add_button_table.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/irregular/verify_subjects_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SelectSubjectPage extends StatefulWidget {
  const SelectSubjectPage({super.key});

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  late DatabaseProvider db;
  late Student student;
  late int count;
  // Column Header
  List<String> headerList = [
    "#",
    "Subject Name",
    "Instructor",
    "Time",
    "Day",
    "Section",
    "Room",
    "Add",
  ];

  late List<List> subjectList;

  void getClassSchedules(List<ClassSchedule> schedules) {
    subjectList = [];
    int counter = 0;
    for (final schedule in schedules) {
      counter += 1;
      subjectList.add([
        counter,
        schedule.subject,
        schedule.prof,
        schedule.fullTime,
        schedule.day,
        schedule.section,
        schedule.room,
        AddButtonTable(
          isClicked: student.enrollment.subjectList.contains(schedule),
          onPressed: (isClicked) {
            setState(() {
              if (isClicked) {
                count += 1;
              } else {
                count -= 1;
              }
            });
            db.modifyIrregSchedule(schedule, isClicked);
          },
        ),
      ]);
    }
  }

  bool validate() {
    if (count == 0) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return CustomBottomSheet(
            isError: true,
            title: "Your Subjects",
            subtitle: "Please select your subjects",
          );
        },
      );
      return false;
    }

    if (checkConflictSubject()) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return CustomBottomSheet(
            isError: true,
            title: "Conflicting Subjects",
            subtitle:
                "There are duplicates in your chosen\nsubjects, please reselect",
          );
        },
      );
      return false;
    }

    if (checkConflictSched()) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return CustomBottomSheet(
            isError: true,
            title: "Conflicting Schedules",
            subtitle:
                "There are conflicts in your chosen\nschedules, please reselect",
          );
        },
      );
      return false;
    }
    return true;
  }

  bool checkConflictSched() {
    List<String> timeDayList = [];

    for (final subject in student.enrollment.subjectList) {
      timeDayList.add("${subject.day} ${subject.fullTime}");
    }

    if (timeDayList.toSet().length != count) {
      return true;
    }
    return false;
  }

  bool checkConflictSubject() {
    List<String> timeDayList = [];

    for (final subject in student.enrollment.subjectList) {
      timeDayList.add(subject.subject);
    }

    if (timeDayList.toSet().length != count) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    count = student.enrollment.subjectList.length;
    getClassSchedules(db.getIrregSchedules());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // If is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    EnrollmentHeader(
                      step1: true,
                      step2: true,
                      step3: true,
                      step4: false,
                      title: "Enrollment",
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "Select Subject/s:",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.colors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Count:",
                                        style: GoogleFonts.roboto(
                                          color: AppTheme.colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          color: AppTheme.colors.white,
                                        ),
                                        child: Text(
                                          count.toString(),
                                          style: GoogleFonts.roboto(
                                            color: AppTheme.colors.black,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Table
                          CustomDataTable(
                            columnNames: headerList,
                            dataTableValues: subjectList,
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: BottomButton(
                onPressed: () {
                  if (validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifySubjectsPage(),
                      ),
                    );
                  }
                },
                text: "Submit",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
