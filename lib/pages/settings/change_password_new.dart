import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/pages/settings/components/settings_button.dart';
import 'package:sti_startnow/pages/settings/components/settings_field.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';

class ChangePasswordNew extends StatelessWidget {
  const ChangePasswordNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header and text fields
            Column(
              children: [
                // Change password header
                SettingsHeader(header: "Change Password"),
                const SizedBox(height: 32),

                // New password field
                SettingsField(
                  header: "Enter New Password",
                  hintText: "Enter New Password",
                  isPassword: true,
                ),
                const SizedBox(height: 12),

                // Re-type new password
                SettingsField(
                  header: "Re-Type New Password",
                  hintText: "Re-Type New Password",
                  isPassword: true,
                ),
              ],
            ),

            // Change pass button
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SettingsButton(
                buttonText: "Change Password",
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
