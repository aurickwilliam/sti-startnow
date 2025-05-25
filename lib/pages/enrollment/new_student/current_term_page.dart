import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/student_info_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CurrentTermPage extends StatefulWidget {
  const CurrentTermPage({super.key});

  @override
  State<CurrentTermPage> createState() => _CurrentTermPageState();
}

class _CurrentTermPageState extends State<CurrentTermPage> {
  late DatabaseProvider db;
  late Student student;

  final List<String> admitTypeChoices = ["New Student", "Transferee"];

  final List<String> yearLevelChoices = [
    "1st Year",
    "2nd Year",
    "3rd Year",
    "4th Year",
  ];

  final List<String> schoolYearChoices = ["2025 - 2026"];

  final List<String> termChoices = ["1st Term"];

  String admitTypeValue = "";
  String yearLevelValue = "";
  String schoolYearValue = "";
  String termValue = "";

  bool admitTypeEmpty = false;
  bool yearLevelEmpty = false;
  bool schoolYearEmpty = false;
  bool termEmpty = false;

  bool validate() {
    setState(() {
      if (admitTypeValue.isEmpty) {
        admitTypeEmpty = true;
      }
      if (yearLevelValue.isEmpty) {
        yearLevelEmpty = true;
      }

      if (schoolYearValue.isEmpty) {
        schoolYearEmpty = true;
      }

      if (termValue.isEmpty) {
        termEmpty = true;
      }
    });

    if (admitTypeEmpty || yearLevelEmpty || schoolYearEmpty || termEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;

    admitTypeValue = student.enrollment.admissionType ?? "";
    yearLevelValue = student.enrollment.yearLevel ?? "";
    schoolYearValue = student.enrollment.academicYear ?? "";
    termValue = student.enrollment.semester ?? "";

    super.initState();
  }

  void saveInput() {
    student.enrollment.admissionType = admitTypeValue;
    student.enrollment.yearLevel = yearLevelValue;
    student.enrollment.academicYear = schoolYearValue;
    student.enrollment.semester = termValue;
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnrollmentHeader(
              step1: true,
              step2: true,
              step3: false,
              step4: false,
              title: "Personal Information",
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),

                      children: [
                        TextSpan(text: "You have chosen "),

                        TextSpan(
                          text: "BSCS",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        TextSpan(text: " at "),

                        TextSpan(
                          text: "Caloocan",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Fill up the necessary information:",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomDropdownMenu(
                    listChoices: admitTypeChoices,
                    label: "Admit Type:",
                    hint: "Please Select Admit Type",
                    isRequired: true,
                    selectedValue: admitTypeValue,
                    onTap: (index) {
                      setState(() {
                        admitTypeValue = admitTypeChoices[index];
                        admitTypeEmpty = false;
                      });
                    },
                    isError: admitTypeEmpty,
                  ),

                  const SizedBox(height: 10),

                  CustomDropdownMenu(
                    listChoices: yearLevelChoices,
                    label: "Year Level:",
                    hint: "Please Select Year Level",
                    isRequired: true,
                    selectedValue: yearLevelValue,
                    onTap: (index) {
                      setState(() {
                        yearLevelValue = yearLevelChoices[index];
                        yearLevelEmpty = false;
                      });
                    },
                    isError: yearLevelEmpty,
                  ),

                  const SizedBox(height: 10),

                  CustomDropdownMenu(
                    listChoices: schoolYearChoices,
                    label: "School Year:",
                    hint: "Please Select School Year",
                    isRequired: true,
                    selectedValue: schoolYearValue,
                    onTap: (index) {
                      setState(() {
                        schoolYearValue = schoolYearChoices[index];
                        schoolYearEmpty = false;
                      });
                    },
                    isError: schoolYearEmpty,
                  ),

                  const SizedBox(height: 10),

                  CustomDropdownMenu(
                    listChoices: termChoices,
                    label: "Term:",
                    hint: "Please Select Term",
                    isRequired: true,
                    selectedValue: termValue,
                    onTap: (index) {
                      setState(() {
                        termValue = termChoices[index];
                        termEmpty = false;
                      });
                    },
                    isError: termEmpty,
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10,
          ),
          child: BottomButton(
            onPressed: () {
              if (validate()) {
                saveInput();
                db.getCurrentSections();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentInfoPage(),
                  ),
                );
              } else {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return CustomBottomSheet(
                      isError: true,
                      title: "Missing Information",
                      subtitle: "Please input all the\nnecessary information",
                    );
                  },
                );
              }
            },
            text: "Next",
          ),
        ),
      ],
    );

    // Choosing the parent widget
    Widget parentWidget =
        isLandscape
            ? SingleChildScrollView(child: content)
            : Container(child: content);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            saveInput();
          }
        },
        child: SafeArea(child: parentWidget),
      ),
    );
  }
}
