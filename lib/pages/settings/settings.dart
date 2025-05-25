import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/option_box.dart';
import 'package:sti_startnow/pages/components/option_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Settings header
              PageAppBar(title: "Settings"),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                builder: (context) => const AccountSettings(),
                              ),
                            );
                          },
                        ),

                        OptionTile(
                          text: "Notifications",
                          icon: Icons.notifications_outlined,
                          onTap: () {},
                        ),

                        OptionTile(
                          text: "Sign Out",
                          icon: Icons.logout,
                          onTap: () async {
                            await supabase.auth.signOut();

                            if (context.mounted) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const EnrollmentDashboard(),
                                ),
                                (context) => false,
                              );
                            }
                          },
                          isLastItem: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
