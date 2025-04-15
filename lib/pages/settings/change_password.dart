import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/change_password_new.dart';
import 'package:sti_startnow/pages/settings/components/settings_button.dart';
import 'package:sti_startnow/pages/settings/components/settings_field.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header and text field
            Column(
              children: [
                // Change password header
                SettingsHeader(header: "Change Password"),
                const SizedBox(height: 32),

                // Old password field
                SettingsField(
                  header: "Enter Old Password",
                  hintText: "Enter Old Password",
                  isPassword: true,
                ),
              ],
            ),

            // Submit button
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SettingsButton(
                buttonText: "Submit",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordNew(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
