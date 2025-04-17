import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/enrollment/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/enrollment/payment_receipt_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentPortalPage extends StatefulWidget {
  final String studentStatus;

  const StudentPortalPage({
    super.key,
    required this.studentStatus,
  });

  @override
  State<StudentPortalPage> createState() => _StudentPortalPageState();
}

class _StudentPortalPageState extends State<StudentPortalPage> {

  final studentNumberController = TextEditingController();
  final accessCodeController = TextEditingController();

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
              title: "Student Portal"
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        NumberInput(
                          controller: studentNumberController, 
                          label: "Student Number:", 
                          hint: "02000XXXXXX", 
                          isRequired: true,
                          isEnable: true,
                        ),
                    
                        const SizedBox(height: 10,),
                    
                        PasswordInput(
                          controller: accessCodeController, 
                          label: "Access Code:", 
                          hint: "Enter Access Code", 
                          isRequired: true,
                          isEnable: true,
                        ),
                      ],
                    ),

                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => 
                        PaymentReceiptPage(studentStatus: widget.studentStatus,)));
                      },
                      text: "Submit",
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