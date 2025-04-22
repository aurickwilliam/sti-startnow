import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/back_next_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {

  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
                        Text(
                          "Contact Details",
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
                                  
                        // Telephone No
                        NumberInput(
                          controller: telephoneController, 
                          label: "Telephone No.:", 
                          hint: "", 
                          isRequired: false, 
                          isEnable: true
                        ),
                                  
                        const SizedBox(height: 10,),
                                  
                        // Mobile Phone No
                        NumberInput(
                          controller: mobileController, 
                          label: "Mobile No.:", 
                          hint: "09XXXXXXXXX", 
                          isRequired: true, 
                          isEnable: true
                        ),
                                  
                        const SizedBox(height: 10,),
                                  
                        TextInput(
                          controller: emailController, 
                          label: "Email Address:", 
                          hint: "example@domain.com", 
                          isRequired: true, 
                          isEnable: true
                        )
                      ],
                    ),

                    BackNextButton(nextPressed: () {})
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