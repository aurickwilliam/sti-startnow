import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/back_next_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class FatherInfoPage extends StatefulWidget {
  const FatherInfoPage({super.key});

  @override
  State<FatherInfoPage> createState() => _FatherInfoPageState();
}

class _FatherInfoPageState extends State<FatherInfoPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleInitialController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  

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
                      "Parent / Guardian Information",
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
          
                    const SizedBox(height: 20,),

                    Text(
                      "Father's Information:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // First Name
                    TextInput(
                      controller: firstNameController, 
                      label: "First Name:", 
                      hint: "First Name", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Last Name
                    TextInput(
                      controller: lastNameController, 
                      label: "Last Name:", 
                      hint: "Last Name", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Middle Initial
                    TextInput(
                      controller: middleInitialController, 
                      label: "Middle Initial:", 
                      hint: "Middle Initial", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Suffix
                    TextInput(
                      controller: suffixController, 
                      label: "Suffix:", 
                      hint: "eg. Jr.", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Mobile Number
                    NumberInput(
                      controller: mobileNoController, 
                      label: "Mobile Number:", 
                      hint: "09XXXXXXXXX", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Email
                    TextInput(
                      controller: emailController, 
                      label: "Email Address:", 
                      hint: "example@domain.com", 
                      isRequired: true, 
                      isEnable: true
                    ),

                    const SizedBox(height: 10,),

                    // Occupation
                    TextInput(
                      controller: occupationController, 
                      label: "Occupation:", 
                      hint: "Occupation", 
                      isRequired: false, 
                      isEnable: true
                    ),

                    const SizedBox(height: 50,),

                    BackNextButton(nextPressed: () {}),
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