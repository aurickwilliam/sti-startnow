import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/multiple_choice_card.dart';
import 'package:sti_startnow/pages/enrollment/new_student/preferred_program_page.dart';
import 'package:sti_startnow/pages/enrollment/student_status_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentTypePage extends StatefulWidget {
  const StudentTypePage({super.key});

  @override
  State<StudentTypePage> createState() => _StudentTypePageState();
}

class _StudentTypePageState extends State<StudentTypePage> {
  List<String> typeStudent = ["New Student", "Existing Student"];
  String selectedItem = "";

  void handleSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  void checkIfHasInput() {
    if (selectedItem == "") {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return CustomBottomSheet(
            isError: true,
            title: "Please choose",
            subtitle: "Please choose your student type",
          );
        },
      );
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return CustomBottomSheet(
            submitFunc: () {
              handleNavigation();
            },
          );
        },
      );
    }
  }

  // Handle navigation
  void handleNavigation() {
    Widget destination = SizedBox.shrink();
    debugPrint("SHIBAL");
    if (selectedItem == typeStudent[0]) {
      destination = PreferredProgramPage();
    } else if (selectedItem == typeStudent[1]) {
      destination = StudentStatusPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
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
              step2: false,
              step3: false,
              step4: false,
              title: "Student Type",
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    "Kindly fill-out the online application form for a fast and efficient admissions procedure.",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MultipleChoiceCard(
                    question: "What type of student are you?",
                    choices: typeStudent,
                    selectedItem: selectedItem,
                    onChanged: handleSelectedItem,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: isLandscape ? 10 : 0,
          ),
          child: BottomButton(
            onPressed: () {
              checkIfHasInput();
            },
            text: "Next",
          ),
        ),
      ],
    );

    // Choosing the parent widget based on orientation
    Widget parentWidget =
        isLandscape
            ? SingleChildScrollView(child: content)
            : Container(child: content);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(child: parentWidget),
    );
  }
}
