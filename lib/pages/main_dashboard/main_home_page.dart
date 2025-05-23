import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/schedule_card.dart';
import 'package:sti_startnow/pages/drawer/about_page.dart';
import 'package:sti_startnow/pages/drawer/mission_vision_page.dart';
import 'package:sti_startnow/pages/enrollment/student_type_page.dart';
import 'package:sti_startnow/pages/components/drawer_tile.dart';
import 'package:sti_startnow/pages/main_dashboard/components/enrollment_status_card.dart';
import 'package:sti_startnow/pages/settings/settings.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<DatabaseProvider>(context).student;

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.primary,

      // Drawer
      endDrawer: Drawer(
        backgroundColor: AppTheme.colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 20),
          child: ListView(
            children: [
              DrawerTile(
                title: "Misson & Vision",
                icon: Icons.key,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MissionVisionPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              DrawerTile(
                title: "About",
                icon: Icons.emoji_objects_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),

              const SizedBox(height: 20),

              DrawerTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Header & Greetings
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning!",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  student.fullName,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.gold,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: AppTheme.colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Content / Box
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35),
                            ),
                          ),

                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isLandscape ? 200 : 24,
                              vertical: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Semester for SY 2025 - 2026",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                BottomButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentTypePage(),
                                      ),
                                    );
                                  },
                                  text: "Enroll Now!",
                                ),

                                const SizedBox(height: 20),

                                EnrollmentStatusCard(student: student),

                                const SizedBox(height: 20),

                                ScheduleCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
