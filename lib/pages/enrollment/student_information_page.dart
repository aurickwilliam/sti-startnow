import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/irregular/select_year_level_page.dart';
import 'package:sti_startnow/pages/enrollment/regular/select_section_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentInformationPage extends StatefulWidget {
  final String studentStatus;

  const StudentInformationPage({
    super.key,
    required this.studentStatus,
  });

  @override
  State<StudentInformationPage> createState() => _StudentInformationPageState();
}

class _StudentInformationPageState extends State<StudentInformationPage> {

  // Fix Fields
  final TextEditingController studentNoController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController studentAcademicTypeController = TextEditingController();

  // Drop Downs
  final TextEditingController admissionTypeController = TextEditingController();
  final TextEditingController newYearLevelController = TextEditingController();
  final TextEditingController paymentLocationController = TextEditingController();
  final TextEditingController paymentTypeController = TextEditingController();

  // Text Input
  final TextEditingController referenceNoController = TextEditingController();

  // Number Input
  final TextEditingController amountPaidController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();


  // Temporary Data
  final String studentNo = "02000123456";
  final String studentName = "John Doe";
  final String program = "BSCS";

  // Choices for Admission Type
  final List<String> admissionTypeList = [
    "Old Student",
    "Transferee",
    "Returnee"
  ];

  // Temporary Choices for New Year Level
  // Same choices sa tuition fee adivising
  final List<String> newYearLevel = [
    "1Y2",
    "2Y2",
    "3Y2",
    "4Y2",
  ];

  // Choices for Paymnet location
  final List<String> paymentLocation = [
    "School",
    "GCash",
    "M Lhuillier",
    "Others"
  ];

  // Choices for payment type
  final List<String> paymentType = [
    "Cash",
    "Low Down",
    "Low Monthly"
  ];

  // Temporary
  // Remove Prop drilling
  void handleNavigation(){
    Widget destination = SizedBox.shrink();

    if (widget.studentStatus == ""){
      print("Select a Status");
    }

    if (widget.studentStatus == "Regular"){
      destination = SelectSectionPage();
    }
    else if (widget.studentStatus == "Irregular"){
      destination = SelectYearLevelPage();
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
  }

  @override
  Widget build(BuildContext context) {

    // Assinging of value to the textfield
    studentNoController.text = studentNo;
    studentNameController.text = studentName;
    programController.text = program;
    studentAcademicTypeController.text = widget.studentStatus;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            EnrollmentHeader(
              step1: true, 
              step2: true, 
              step3: true, 
              step4: false, 
              title: "Enrollment"
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: ListView(
                  children: [
                    Text(
                      "Student Details:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    // STUDENT NUMBER
                    TextInput(
                      controller: studentNoController, 
                      label: "Student No:", 
                      hint: "", 
                      isRequired: false, 
                      isEnable: false
                    ),

                    const SizedBox(height: 10,),

                    // STUDENT NAME
                    TextInput(
                      controller: studentNameController, 
                      label: "Student Name:", 
                      hint: "", 
                      isRequired: false, 
                      isEnable: false
                    ),

                    const SizedBox(height: 10,),
                    
                    // STUDENT PROGRAM
                    TextInput(
                      controller: programController, 
                      label: "Program:", 
                      hint: "", 
                      isRequired: false, 
                      isEnable: false
                    ),

                    const SizedBox(height: 10,),

                    // STUDENT ACADEMIC TYPE
                    TextInput(
                      controller: studentAcademicTypeController, 
                      label: "Student Academic Type:", 
                      hint: "", 
                      isRequired: false, 
                      isEnable: false
                    ),

                    const SizedBox(height: 10,),
                    
                    // STUDENT ADMISSION TYPE
                    CustomDropdownMenu(
                      listChoices: admissionTypeList, 
                      controller: admissionTypeController, 
                      label: "Admission Type:", 
                      hint: "Select Student Type",
                      initialValue: "",
                      isRequired: true, 
                      isEnable: true, 
                    ),

                    const SizedBox(height: 10,),

                    // STUDENT NEW LEVEL
                    CustomDropdownMenu(
                      listChoices: newYearLevel, 
                      controller: newYearLevelController, 
                      label: "Your New Level:", 
                      hint: "Select New Level",
                      initialValue: "",
                      isRequired: true, 
                      isEnable: true, 
                    ),

                    const SizedBox(height: 10,),

                    // PAYMENT LOCATION
                    CustomDropdownMenu(
                      listChoices: paymentLocation, 
                      controller: paymentLocationController, 
                      label: "Payment Location:", 
                      hint: "Select Payment Location",
                      initialValue: "",
                      isRequired: true, 
                      isEnable: true, 
                    ),

                    const SizedBox(height: 10,),

                    // PAYMENT TYPE
                    CustomDropdownMenu(
                      listChoices: paymentType, 
                      controller: paymentTypeController, 
                      label: "Payment Type:", 
                      hint: "Select Payment Type",
                      initialValue: "",
                      isRequired: true, 
                      isEnable: true, 
                    ),

                    const SizedBox(height: 10,),

                    // REFERENCE NO.
                    TextInput(
                      controller: referenceNoController, 
                      label: "Reference / OR. No.:", 
                      hint: "Enter Reference / OR. No.", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // AMOUNT PAID
                    NumberInput(
                      controller: amountPaidController, 
                      label: "Amount Paid:", 
                      hint: "Enter Amount Paid", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    NumberInput(
                      controller: contactNoController, 
                      label: "Contact Number:", 
                      hint: "Enter Contact Number", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 100,),

                    BottomButton(
                      onPressed: () {
                        handleNavigation();
                      }, 
                      text: "Submit"
                    )

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