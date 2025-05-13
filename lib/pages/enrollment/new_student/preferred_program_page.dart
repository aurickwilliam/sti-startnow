import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/current_term_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PreferredProgramPage extends StatefulWidget {
  const PreferredProgramPage({super.key});

  @override
  State<PreferredProgramPage> createState() => _PreferredProgramPageState();
}

class _PreferredProgramPageState extends State<PreferredProgramPage> {
  final List<String> courses = [
    "Bachelor of Science in Computer Science (BSCS)",
    "Bachelor of Science in Information Technology (BSIT)",
    "Bachelor of Science in Computer Engineering (BSCpE)",
    "Bachelor of Science in Business Administration (BSBA)",
    "Bachelor of Science in Accounting Information System (BSAIS)",
    "Bachelor of Science in Accountancy (BSA)",
    "Bachelor of Science in Hospitality Management (BSHM)",
    "Bachelor of Arts in Communication (BACOMM)",
    "Bachelor of Multimedia Arts (BMMA)",
    "Bachelor of Science in Tourism Management (BSTM)"
  ];

  String selectedCourse = "";

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
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
                title: "Preferred Program"
              ),
          
              const SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24, 
                  vertical: 10
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

                    const SizedBox(height: 10,),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 2.0,
                        )
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Courses:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Column(
                      children: List.generate(courses.length, (index) {
                        return RadioListTile(
                          value: courses[index], 
                          groupValue: selectedCourse, 
                          activeColor: AppTheme.colors.gold,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          
                          onChanged: (value) {
                            setState(() {
                              selectedCourse = value.toString();
                            });
                          },
                          
                          title: Text(
                            courses[index],
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 50,),

                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => CurrentTermPage()));
                      }, 
                      text: "Next"
                    )

                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}