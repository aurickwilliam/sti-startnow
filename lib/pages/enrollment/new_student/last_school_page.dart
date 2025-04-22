import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/father_info_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class LastSchoolPage extends StatefulWidget {
  const LastSchoolPage({super.key});

  @override
  State<LastSchoolPage> createState() => _LastSchoolPageState();
}

class _LastSchoolPageState extends State<LastSchoolPage> {

  final TextEditingController schoolTypeController = TextEditingController();
  final TextEditingController nameSchoolController = TextEditingController();
  final TextEditingController strandController = TextEditingController();
  final TextEditingController dateGraduationController = TextEditingController();
  final TextEditingController schoolYearController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController termController = TextEditingController();

  final List<String> schoolTypeChoices = [
    "Primary",
    "Elementary",
    "High School",
    "Junior High School",
    "Alternative Learning System (ALS)",
    "Collge",
    "Masteral",
    "Doctoral"
  ];

  final List<String> schoolYearChoices = [
    "2024 - 2025",
    "2023 - 2024",
    "2022 - 2023",
    "2021 - 2022",
  ];

  final List<String> termChoices = [
    "1st Term",
    "2nd Term",
    "Summer"
  ];

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
    "Fourth Year High School"
    "First Year College",
    "Second Year College",
    "Third Year College",
    "Fourth Year College",
    "Masteral",
    "Doctoral",
    "Alternative Learning System (ALS)"
  ];

  @override
  Widget build(BuildContext context) {
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
                title: "Personal Information"
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
          
                    const SizedBox(height: 10,),
          
                    Text(
                      "Fill up the necessary information:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
          
                    const SizedBox(height: 10,),

                    // School Type
                    CustomDropdownMenu(
                      listChoices: schoolTypeChoices, 
                      controller: schoolTypeController, 
                      label: "School Type:", 
                      hint: "Please Select a Type", 
                      initialValue: "", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Name of School
                    TextInput(
                      controller: nameSchoolController, 
                      label: "Name of School:",
                      hint: "Name of School", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Program / Strand
                    TextInput(
                      controller: strandController, 
                      label: "Program / Track & Strand / Specialization:",
                      hint: "Program or Track", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Date of Graduation
                    TextInput(
                      controller: dateGraduationController, 
                      label: "Date of Graduation:",
                      hint: "mm/dd/yy", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // School Year
                    CustomDropdownMenu(
                      listChoices: schoolYearChoices, 
                      controller: schoolYearController, 
                      label: "School Year:", 
                      hint: "Please Select a School Year", 
                      initialValue: "", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Year Level / Grade
                    CustomDropdownMenu(
                      listChoices: yearLevelChoices, 
                      controller: gradeController, 
                      label: "Year Level / Grade:", 
                      hint: "Please Select Year / Grade", 
                      initialValue: "", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Last Term
                    CustomDropdownMenu(
                      listChoices: termChoices, 
                      controller: termController, 
                      label: "Term:", 
                      hint: "Please Select a School Term", 
                      initialValue: "", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 50,),

                    BackNextButton(
                      nextPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => FatherInfoPage()));
                      }
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}