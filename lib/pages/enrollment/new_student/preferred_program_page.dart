import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/current_term_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PreferredProgramPage extends StatefulWidget {
  const PreferredProgramPage({super.key});

  @override
  State<PreferredProgramPage> createState() => _PreferredProgramPageState();
}

class _PreferredProgramPageState extends State<PreferredProgramPage> {
  late DatabaseProvider db;
  late Student student;

  late final List<String> courses;
  String selectedCourse = "";

  void getCourseChoices(List<PostgrestMap> courseData) {
    courses = [];
    for (final course in courseData) {
      courses.add("${course['program_name']} (${course['acronym']})");
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    getCourseChoices(db.programs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // PopScope pang detect ng back button press
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return CustomBottomSheet(
                submitFunc: () {
                  Navigator.of(context).pop(true);
                },
                subtitle: "All of your entered information\nwill be deleted",
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EnrollmentHeader(
                  step1: true,
                  step2: false,
                  step3: false,
                  step4: false,
                  title: "Preferred Program",
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLandscape ? 200 : 24,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kindly fill-out the online application form for a fast and efficient admissions procedure.",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppTheme.colors.gray,
                            width: 2.0,
                          ),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Courses:",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Column(
                        children: List.generate(courses.length, (index) {
                          return RadioListTile(
                            value: courses[index],
                            groupValue: selectedCourse,
                            activeColor: AppTheme.colors.gold,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),

                            onChanged: (value) {
                              setState(() {
                                selectedCourse = value.toString();
                                student.enrollment.section = null;
                                student.enrollment.subjectList = [];
                              });
                            },

                            title: Text(
                              courses[index],
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.black,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 50),

                      BottomButton(
                        onPressed: () {
                          if (selectedCourse.isEmpty) {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return CustomBottomSheet(
                                  isError: true,
                                  title: "Please choose",
                                  subtitle:
                                      "Please choose your preferred course",
                                );
                              },
                            );
                          } else {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  submitFunc: () {
                                    student.program = selectedCourse;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const CurrentTermPage(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                        text: "Next",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
