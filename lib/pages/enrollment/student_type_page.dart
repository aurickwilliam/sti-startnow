import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/multiple_choice_card.dart';
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            EnrollmentHeader(
              step1: true,
              step2: false,
              step3: false,
              step4: false,
              title: "Student Type",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                  children: [
                    Column(
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
              
                        const SizedBox(height: 20,)
                      ],
                    ),
                      
                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => StudentStatusPage()));
                      },
                      text: "Next",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
