import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/change_email.dart';
import 'package:sti_startnow/pages/settings/change_password.dart';
import 'package:sti_startnow/pages/settings/components/settings_box.dart';
import 'package:sti_startnow/pages/settings/components/settings_box_item.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';
import 'package:sti_startnow/pages/settings/settings.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings header
            SettingsHeader(
              header: "Settings",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            const SizedBox(height: 8),

            // Sub header
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Account Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 6),

            // Settings box
            SettingsBox(
              children: [
                SettingsBoxItem(
                  icon: Icons.lock_outline,
                  title: "Change Password",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  },
                ),
                SettingsBoxItem(
                  icon: Icons.email_outlined,
                  title: "Change Email",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangeEmail()),
                    );
                  },
                  isLastItem: true, // Refer to settings_box_item.dart
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
