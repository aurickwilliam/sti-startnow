import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/class_schedule.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/validate_details_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class NewSelectSectionPage extends StatefulWidget {
  const NewSelectSectionPage({super.key});

  @override
  State<NewSelectSectionPage> createState() => _NewSelectSectionPageState();
}

class _NewSelectSectionPageState extends State<NewSelectSectionPage> {
  late DatabaseProvider db;
  late Student student;
  late final List<String> listSection;

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

  String sectionValue = "";

  void getSectionSched(List<ClassSchedule>? sectionSched) {
    dataTableValues = [];
    totalUnits = 0;
    if (sectionSched != null) {
      setState(() {
        for (final sched in sectionSched) {
          totalUnits += sched.units;
          dataTableValues.add([
            sched.subjectCode,
            sched.subject,
            sched.units.toStringAsFixed(2),
            sched.fullTime,
            sched.day,
            sched.room,
          ]);
        }
      });
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    listSection = db.enrollSections;
    sectionValue = student.enrollment.section ?? "";
    getSectionSched(student.enrollment.subjectList);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          student.enrollment.section = sectionValue;
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EnrollmentHeader(
                  step1: true,
                  step2: true,
                  step3: true,
                  step4: false,
                  title: "Section",
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select a Section",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          CustomDropdownMenu(
                            listChoices: listSection,
                            label: "Available Sections:",
                            hint: "Select a section",
                            selectedValue: sectionValue,
                            onTap: (index) {
                              setState(() {
                                sectionValue = listSection[index];
                                db.setSectionSched(sectionValue);
                                getSectionSched(student.enrollment.subjectList);
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    dataTableValues.isNotEmpty
                        ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                        )
                        : Container(),

                    const SizedBox(height: 50),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: BottomButton(
                        onPressed: () {
                          if (sectionValue.isEmpty) {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  isError: true,
                                  title: "Your Section",
                                  subtitle: "Please select your section",
                                );
                              },
                            );
                          } else {
                            student.enrollment.section = sectionValue;
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  submitFunc: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const ValidateDetailsPage(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                        text: "Submit",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
