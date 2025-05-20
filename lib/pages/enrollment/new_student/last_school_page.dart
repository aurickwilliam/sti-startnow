import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_date_picker.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/father_info_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class LastSchoolPage extends StatefulWidget {
  const LastSchoolPage({super.key});

  @override
  State<LastSchoolPage> createState() => _LastSchoolPageState();
}

class _LastSchoolPageState extends State<LastSchoolPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController nameSchoolController = TextEditingController();
  final TextEditingController strandController = TextEditingController();
  final TextEditingController dateGraduationController =
      TextEditingController();
  final TextEditingController gradeController = TextEditingController();

  final List<String> schoolTypeChoices = [
    "Primary",
    "Elementary",
    "High School",
    "Junior High School",
    "Alternative Learning System (ALS)",
    "Collge",
    "Masteral",
    "Doctoral",
  ];

  final List<String> schoolYearChoices = [
    "2024 - 2025",
    "2023 - 2024",
    "2022 - 2023",
    "2021 - 2022",
  ];

  final List<String> termChoices = ["1st Term", "2nd Term", "Summer"];

  final List<String> yearLevelChoices = [
    "Nusery",
    "Kinder 1",
    "Kinder 2",
    "Grade 1",
    "Grade 2",
    "Grade 3",
    "Grade 4",
    "Grade 5",
    "Grade 6",
    "Grade 7",
    "Grade 8",
    "Grade 9",
    "Grade 10",
    "Grade 11",
    "Grade 12",
    "Fourth Year High School",
    "First Year College",
    "Second Year College",
    "Third Year College",
    "Fourth Year College",
    "Masteral",
    "Doctoral",
    "Alternative Learning System (ALS)",
  ];

  String schoolTypeValue = "";
  String schoolYearValue = "";
  String termValue = "";
  String yearLevelValue = "";

  bool schoolTypeEmpty = false;
  bool schoolYearEmpty = false;
  bool yearLevelEmpty = false;

  bool validate() {
    bool valid = _formKey.currentState!.validate();
    setState(() {
      if (schoolTypeValue.isEmpty) {
        schoolTypeEmpty = true;
      }

      if (schoolYearValue.isEmpty) {
        schoolYearEmpty = true;
      }

      if (yearLevelValue.isEmpty) {
        yearLevelEmpty = true;
      }
    });

    if (schoolYearEmpty || schoolYearEmpty || yearLevelEmpty) {
      return false;
    }
    return valid;
  }

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    nameSchoolController.text = student.currentLastSchool.schoolName ?? "";
    strandController.text = student.currentLastSchool.program ?? "";
    dateGraduationController.text =
        student.currentLastSchool.graduationDate ?? "";
    schoolTypeValue = student.currentLastSchool.schoolType ?? "";
    schoolYearValue = student.currentLastSchool.schoolYear ?? "";
    termValue = student.currentLastSchool.term ?? "";
    yearLevelValue = student.currentLastSchool.yearLevel ?? "";

    super.initState();
  }

  void saveInput() {
    student.currentLastSchool.schoolName = nameSchoolController.text;
    student.currentLastSchool.program = strandController.text;
    student.currentLastSchool.graduationDate = dateGraduationController.text;
    student.currentLastSchool.schoolType = schoolTypeValue;
    student.currentLastSchool.schoolYear = schoolYearValue;
    student.currentLastSchool.term = termValue;
    student.currentLastSchool.yearLevel = yearLevelValue;
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current or Last School Attended",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Fill up the necessary information:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // School Type
                      CustomDropdownMenu(
                        listChoices: schoolTypeChoices,
                        label: "School Type:",
                        hint: "Please Select a Type",
                        isRequired: true,
                        selectedValue: schoolTypeValue,
                        onTap: (index) {
                          setState(() {
                            schoolTypeValue = schoolTypeChoices[index];
                            schoolTypeEmpty = false;
                          });
                        },
                        isError: schoolTypeEmpty,
                      ),

                      const SizedBox(height: 10),

                      // Name of School
                      TextInput(
                        controller: nameSchoolController,
                        label: "Name of School:",
                        hint: "Name of School",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Program / Strand
                      TextInput(
                        controller: strandController,
                        label: "Program / Track & Strand / Specialization:",
                        hint: "Program or Track",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Date of Graduation
                      CustomDatePicker(
                        controller: dateGraduationController,
                        label: "Date of Graduation:",
                        hint: "yyyy-mm-dd",
                      ),

                      const SizedBox(height: 10),

                      // School Year
                      CustomDropdownMenu(
                        listChoices: schoolYearChoices,
                        label: "School Year:",
                        hint: "Please Select a School Year",
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

                      // Year Level / Grade
                      CustomDropdownMenu(
                        listChoices: yearLevelChoices,
                        label: "Year Level / Grade:",
                        hint: "Please Select Year / Grade",
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

                      // Last Term
                      CustomDropdownMenu(
                        listChoices: termChoices,
                        label: "Term:",
                        hint: "Please Select a School Term",
                        selectedValue: termValue,
                        onTap: (index) {
                          setState(() {
                            termValue = termChoices[index];
                          });
                        },
                      ),

                      const SizedBox(height: 50),

                      BackNextButton(
                        nextPressed: () {
                          if (validate()) {
                            saveInput();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FatherInfoPage(),
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
                                  subtitle:
                                      "Please input all the\nnecessary information",
                                );
                              },
                            );
                          }
                        },
                        backPressed: () {
                          saveInput();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
