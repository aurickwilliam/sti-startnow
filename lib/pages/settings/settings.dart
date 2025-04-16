import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/pages/settings/components/settings_box.dart';
import 'package:sti_startnow/pages/settings/components/settings_box_item.dart';
import 'package:sti_startnow/pages/settings/components/settings_header.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            // Settings header
            SettingsHeader(header: "Settings"),
            const SizedBox(height: 32),

            // Settings box
            SettingsBox(
              children: [
                SettingsBoxItem(
                  icon: Icons.account_circle_outlined,
                  title: "Account Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettings(),
                      ),
                    );
                  },
                ),
                SettingsBoxItem(
                  icon: Icons.notifications_outlined,
                  title: "Notifications",
                  onTap: () {},
                ),
                SettingsBoxItem(
                  icon: Icons.logout,
                  title: "Sign Out",
                  onTap: () {},
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
