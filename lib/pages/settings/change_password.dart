import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/change_password_new.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final TextEditingController oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header and text field
              Column(
                children: [
                  // Change password header
                  PageAppBar(
                    title: "Change Password", 
                  ),
        
                  const SizedBox(height: 20),
        
                  // Old password field
                  PasswordInput(
                    controller: oldPasswordController, 
                    label: "Enter Old Password:", 
                    hint: "Enter Old Password", 
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
                      builder: (context) => ChangePasswordNew(),
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
