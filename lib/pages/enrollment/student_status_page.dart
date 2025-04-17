import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/enrollment/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/multiple_choice_card.dart';
import 'package:sti_startnow/pages/enrollment/student_portal_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentStatusPage extends StatefulWidget {
  const StudentStatusPage({super.key});

  @override
  State<StudentStatusPage> createState() => _StudentStatusPageState();
}

class _StudentStatusPageState extends State<StudentStatusPage> {

  List<String> statusStudent = ["Regular", "Irregular"];
  String selectedStatus = "";

  void handleSelectedStatus(String value){
    setState(() {
      selectedStatus = value;
    });
  }

  // Refactor kapag nandyan na ung DB
  // Remove the prop drilling
  void handleNavigation(){
    if (selectedStatus != ""){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => 
      StudentPortalPage(studentStatus: selectedStatus)));
    }
    else {
      // Error message if haven't selected any status
      print("Select a Status!");
    }
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
              title: "Student Status",
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    
                        const SizedBox(height: 10,),
                    
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
                                )
                              ),
                              TextSpan(
                                text: "Based on your records, you are currently endorsed as:"
                              )
                            ]
                          )
                        ),
                    
                        const SizedBox(height: 20,),
                    
                        MultipleChoiceCard(
                          question: "What is your student status?", 
                          choices: statusStudent, 
                          selectedItem: selectedStatus, 
                          onChanged: handleSelectedStatus
                        )
                      ],
                    ),

                    BottomButton(
                      onPressed: () {
                        handleNavigation();
                      },
                      text: "Next",
                    )
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}