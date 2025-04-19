import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/option_box.dart';
import 'package:sti_startnow/pages/components/option_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            children: [
              // Settings header
              PageAppBar(title: "Settings"),
              
              const SizedBox(height: 20),

              OptionBox(
                children: [
                  OptionTile(
                    text: "Account Settings", 
                    icon: Icons.account_circle_outlined, 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountSettings(),
                        ),
                      );
                    }
                  ),

                  OptionTile(
                    text: "Notifications", 
                    icon: Icons.notifications_outlined, 
                    onTap: () {}
                  ),

                  OptionTile(
                    text: "Sign Out", 
                    icon: Icons.logout, 
                    onTap: () {},
                    isLastItem: true,
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
