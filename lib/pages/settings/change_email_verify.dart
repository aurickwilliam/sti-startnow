import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmailVerify extends StatelessWidget {
  ChangeEmailVerify({super.key});

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header, instructions, and verify email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Change email header
                  PageAppBar(
                    title: "Change Email"
                  ),

                  const SizedBox(height: 20),
        
                  // Instructions header
                  Text(
                    "Verify New Email",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 4),
        
                  // Instructions
                  Text(
                    "Enter the 6-Digit Code that will be sent to your new email for verification.",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 30),
        
                  // Verification code field
                  NumberInput(
                    controller: codeController, 
                    label: "Verification Code:", 
                    hint: "XXXXXX", 
                    isRequired: false, 
                    isEnable: true
                  ),

                  const SizedBox(height: 10),
        
                  // Resend code
                  Text(
                    "Resend Code",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
        
              // Submit button
              BottomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSettings()),
                  );
                }, 
                text: "Submit"
              )
            ],
          ),
        ),
      ),
    );
  }
}
