import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/change_email_new.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmail extends StatelessWidget {
  ChangeEmail({super.key});

  final TextEditingController passwordController = TextEditingController();

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
        
                  // Enter password field
                  PasswordInput(
                    controller: passwordController, 
                    label: "Enter Password:", 
                    hint: "Enter Password", 
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
                    MaterialPageRoute(builder: (context) => ChangeEmailNew()),
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
