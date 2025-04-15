import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/change_email_new.dart';
import 'package:sti_startnow/pages/settings/components/settings_button.dart';
import 'package:sti_startnow/pages/settings/components/settings_field.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

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
                // Change email header
                SettingsHeader(header: "Change Email"),
                const SizedBox(height: 32),

                // Enter password field
                SettingsField(
                  header: "Enter Password",
                  hintText: "Enter Password",
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
                    MaterialPageRoute(builder: (context) => ChangeEmailNew()),
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
