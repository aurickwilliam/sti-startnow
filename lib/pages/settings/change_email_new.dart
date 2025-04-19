import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/settings/change_email_verify.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmailNew extends StatelessWidget {
  ChangeEmailNew({super.key});

  final TextEditingController newEmailController = TextEditingController();

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
              // Header and text field
              Column(
                children: [
                  // Change email header
                  PageAppBar(
                    title: "Change Email"
                  ),

                  const SizedBox(height: 20),
        
                  // New email field
                  TextInput(
                    controller: newEmailController, 
                    label: "Enter New Email:", 
                    hint: "Enter New Email", 
                    isRequired: false, 
                    isEnable: true
                  )
                ],
              ),
        
              // Submit button
              BottomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeEmailVerify(),
                    ),
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
