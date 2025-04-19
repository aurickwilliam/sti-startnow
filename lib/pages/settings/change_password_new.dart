import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangePasswordNew extends StatelessWidget {
  ChangePasswordNew({super.key});

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reTypePasswordController = TextEditingController();

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
              // Header and text fields
              Column(
                children: [
                  // Change password header
                  PageAppBar(
                    title: "Change Password"
                  ),

                  const SizedBox(height: 20),
        
                  // New password field
                  PasswordInput(
                    controller: newPasswordController, 
                    label: "Enter New Password:", 
                    hint: "Enter New Password", 
                    isRequired: false, 
                    isEnable: true
                  ),

                  const SizedBox(height: 15),
        
                  // Re-type new password
                  PasswordInput(
                    controller: reTypePasswordController, 
                    label: "Re-Type New Password", 
                    hint: "Re-Type New Password", 
                    isRequired: false, 
                    isEnable: true
                  )
                ],
              ),
        
              // Change pass button
              BottomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSettings()),
                  );
                }, 
                text: "Change Password"
              )
            ],
          ),
        ),
      ),
    );
  }
}
