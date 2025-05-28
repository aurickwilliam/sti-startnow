import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/class_schedule.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/completed_page.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class VerifySubjectsPage extends StatefulWidget {
  const VerifySubjectsPage({super.key});

  @override
  State<VerifySubjectsPage> createState() => _VerifySubjectsPageState();
}

class _VerifySubjectsPageState extends State<VerifySubjectsPage> {
  late DatabaseProvider db;
  late Student student;

  // Values for the Column
  final List<String> columnNames = [
    "Subject Code",
    "Subject Name",
    "Units",
    "Time",
    "Day",
    "Room",
  ];

  late double totalUnits;
  late List<List> dataTableValues;

  void getIrregSchedule(List<ClassSchedule> schedules) {
    dataTableValues = [];
    totalUnits = 0;
    for (final schedule in schedules) {
      totalUnits += schedule.units;
      dataTableValues.add([
        schedule.subjectCode,
        schedule.subject,
        schedule.units,
        schedule.fullTime,
        schedule.day,
        schedule.room,
      ]);
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    getIrregSchedule(student.enrollment.subjectList);

    super.initState();
  }

  Future<void> registerNewEnrollment() async {
    // Show circular progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(child: const CircularProgressIndicator()),
        );
      },
    );

    // Insert new enrollment to database
    await db.createNewEnrollment();

    if (mounted) {
      Navigator.pop(context);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CompletedPage()),
        (context) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EnrollmentHeader(
                step1: true,
                step2: true,
                step3: true,
                step4: false,
                title: "Enrollment",
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Schedule:",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Units: $totalUnits",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Divider(height: 10),

                        CustomDataTable(
                          columnNames: columnNames,
                          dataTableValues: dataTableValues,
                        ),

                        const SizedBox(height: 50),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isLandscape ? 200 : 24,
                      vertical: 10,
                    ),
                    child: BackNextButton(
                      nextPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return CustomBottomSheet(
                              submitFunc: () async {
                                await registerNewEnrollment();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
