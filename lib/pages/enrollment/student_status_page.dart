import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/multiple_choice_card.dart';
import 'package:sti_startnow/pages/enrollment/irregular/checklist_page.dart';
import 'package:sti_startnow/pages/enrollment/student_portal_page.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentStatusPage extends StatefulWidget {
  const StudentStatusPage({super.key});

  @override
  State<StudentStatusPage> createState() => _StudentStatusPageState();
}

class _StudentStatusPageState extends State<StudentStatusPage> {
  late EnrolleeListProvider enroll;
  List<String> statusStudent = ["Regular", "Irregular"];
  String selectedStatus = "";

  void handleSelectedStatus(String value) {
    setState(() {
      selectedStatus = value;
    });
  }

  void checkifHasInput() {
    if (selectedStatus == "") {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return CustomBottomSheet(
            isError: true,
            title: "Please choose",
            subtitle: "Please choose your student status",
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
              handleNavigation();
            },
          );
        },
      );
    }
  }

  void handleNavigation() {
    Widget destination = SizedBox.shrink();

    if (selectedStatus == "Regular") {
      destination = const StudentPortalPage();
    } else {
      destination = const ChecklistPage();
    }

    enroll.enrollingStatus = selectedStatus;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  void initState() {
    super.initState();
    enroll = context.read<EnrolleeListProvider>();
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
              title: "Student Status",
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Caloocan Campus",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "Welcome back existing student!\n",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Based on your records, you are currently endorsed as:",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      MultipleChoiceCard(
                        question: "What is your student status?",
                        choices: statusStudent,
                        selectedItem: selectedStatus,
                        onChanged: handleSelectedStatus,
                      ),
                    ],
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
              checkifHasInput();
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
      body: SafeArea(child: parentWidget),
    );
  }
}
