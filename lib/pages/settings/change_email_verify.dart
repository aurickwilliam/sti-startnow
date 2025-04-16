import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/pages/settings/components/settings_button.dart';
import 'package:sti_startnow/pages/settings/components/settings_field.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';

class ChangeEmailVerify extends StatelessWidget {
  const ChangeEmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header, instructions, and verify email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Change email header
                SettingsHeader(header: "Change Email"),
                const SizedBox(height: 32),

                // Instructions header
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Verify New Email",
                    style: TextStyle(
                      color: Color(0xFF0B5793),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Instructions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Enter the 6-Digit Code that will be sent to your new email for verification.",
                  ),
                ),
                const SizedBox(height: 32),

                // Verification code field
                SettingsField(header: "Verification Code", hintText: "XXXXXX"),
                const SizedBox(height: 4),

                // Resend code
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: Color(0xFF0B5793),
                      decoration: TextDecoration.underline,
                    ),
                  ),
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
                    MaterialPageRoute(builder: (context) => AccountSettings()),
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
