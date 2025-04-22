import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/student_info_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CurrentTermPage extends StatefulWidget {
  const CurrentTermPage({super.key});

  @override
  State<CurrentTermPage> createState() => _CurrentTermPageState();
}

class _CurrentTermPageState extends State<CurrentTermPage> {

  final List<String> admitTypeChoices = [
    "New Student",
    "Transferee",
  ];

  final List<String> yearLevelChoices = [
    "First Year",
    "Second Year",
    "Third Year",
    "Fourth Year",
  ];

  final List<String> schoolYearChoices = [
    "2025 - 2026",
  ];

  final List<String> termChoices = [
    "1st Term",
  ];

  final TextEditingController admitTypeController = TextEditingController();
  final TextEditingController yearLevelController = TextEditingController();
  final TextEditingController schoolYearController = TextEditingController();
  final TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnrollmentHeader(
              step1: true, 
              step2: true, 
              step3: false, 
              step4: false, 
              title: "Personal Information"
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
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                            ),
                            
                            children: [
                              TextSpan(
                                text: "You have chosen ",
                              ),
                            
                              TextSpan(
                                text: "BSCS",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  textStyle: TextStyle(decoration: TextDecoration.underline),
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            
                              TextSpan(
                                text: " at ",
                              ),
                            
                              TextSpan(
                                text: "Caloocan",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  textStyle: TextStyle(decoration: TextDecoration.underline),
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ]
                          )
                        ),
                            
                        const SizedBox(height: 20,),
                            
                        Text(
                          "Fill up the necessary information:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                            
                        const SizedBox(height: 20,),
                        
                        CustomDropdownMenu(
                          listChoices: admitTypeChoices, 
                          controller: admitTypeController, 
                          label: "Admit Type:", 
                          hint: "Please Select Admit Type", 
                          initialValue: "", 
                          isRequired: true, 
                          isEnable: true
                        ),
                                    
                        const SizedBox(height: 10,),
                                    
                        CustomDropdownMenu(
                          listChoices: yearLevelChoices, 
                          controller: yearLevelController, 
                          label: "Year Level:", 
                          hint: "Please Select Year Level", 
                          initialValue: "", 
                          isRequired: true, 
                          isEnable: true
                        ),
                                    
                        const SizedBox(height: 10,),
                                    
                        CustomDropdownMenu(
                          listChoices: schoolYearChoices, 
                          controller: schoolYearController, 
                          label: "School Year:", 
                          hint: "Please Select School Year", 
                          initialValue: "", 
                          isRequired: true, 
                          isEnable: true
                        ),
                                    
                        const SizedBox(height: 10,),
                                    
                        CustomDropdownMenu(
                          listChoices: termChoices, 
                          controller: termController, 
                          label: "Term:", 
                          hint: "Please Select Term", 
                          initialValue: "", 
                          isRequired: true, 
                          isEnable: true
                        )
                                    
                      ],
                    ),
        
                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => StudentInfoPage()));
                      }, 
                      text: "Next"
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}