import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/class_schedule.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/main_dashboard/components/category_button.dart';
import 'package:sti_startnow/pages/main_dashboard/components/subject_tile.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainSubjectsPage extends StatefulWidget {
  const MainSubjectsPage({super.key});

  @override
  State<MainSubjectsPage> createState() => _MainSubjectsPageState();
}

class _MainSubjectsPageState extends State<MainSubjectsPage> {
  late Student student;

  bool isCurrentSelected = true;
  bool isCompletedSelected = false;

  // Call when Current button click
  void handleCurrentChange() {
    setState(() {
      isCurrentSelected = true;
      isCompletedSelected = false;

      selectedList = currentList;
    });
  }

  // Call when completed button click
  void handleCompletedChange() {
    setState(() {
      isCurrentSelected = false;
      isCompletedSelected = true;

      selectedList = completedList;
    });
  }

  late List<List> currentList;

  final List<List> completedList = [];

  late List<List> selectedList;

  void getCurrentSubjects(List<ClassSchedule> subjects) {
    currentList = [];
    for (final subject in subjects) {
      currentList.add([
        subject.subject,
        subject.subjectCode,
        subject.prof,
        subject.units.toStringAsFixed(2),
      ]);
    }
  }

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    if (student.enrollmentID == null) {
      currentList = [];
    } else {
      getCurrentSubjects(student.enrollment.subjectList!);
    }

    super.initState();
    selectedList = currentList;
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_rounded,
                        color: AppTheme.colors.gold,
                        size: 35,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "Subjects",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(height: 10, thickness: 3),
              ],
            ),

            const SizedBox(height: 10),

            // Categories button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isLandscape ? 200 : 24),
              child: Row(
                children: [
                  CategoryButton(
                    text: "Current",
                    onPressed: handleCurrentChange,
                    isSelected: isCurrentSelected,
                  ),

                  CategoryButton(
                    text: "Completed",
                    onPressed: handleCompletedChange,
                    isSelected: isCompletedSelected,
                  ),
                ],
              ),
            ),

            selectedList.isNotEmpty
                ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isLandscape ? 200 : 24,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: selectedList.length,
                      itemBuilder: (context, index) {
                        return SubjectTile(
                          subjectName: selectedList[index][0],
                          subjectCode: selectedList[index][1],
                          subjectTeacher: selectedList[index][2],
                          noUnits: selectedList[index][3],
                        );
                      },
                    ),
                  ),
                )
                : Center(
                  child:
                      isCurrentSelected
                          ? Text('Not Yet Enrolled')
                          : Text('No Completed Subjects'),
                ),
          ],
        ),
      ),
    );
  }
}
