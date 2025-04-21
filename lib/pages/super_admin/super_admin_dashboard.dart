import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/super_admin/components/option_button.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_announcements_page.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_enroll_schedule_page.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_instructors_page.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_programs_page.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_students_page.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_subjects_page.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_profile_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Super Admin.",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SuperAdminProfilePage()));
                    },
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: AppTheme.colors.gold,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  child: GridView.count(
                    mainAxisSpacing: 20,
                    crossAxisCount: 4,
                    children: [
                      OptionButton(
                        icon: Icons.person,
                        title: "Students",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListStudentsPage()));
                        },
                      ),
                      OptionButton(
                        icon: Icons.local_library_rounded,
                        title: "Instructors",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListInstructorsPage()));
                        },
                      ),
                      OptionButton(
                        icon: Icons.notifications_active_rounded,
                        title: "Announcement",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListAnnouncementsPage()));
                        },
                      ),
                      OptionButton(
                        icon: Icons.school_rounded,
                        title: "Programs",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListProgramsPage()));
                        },
                      ),
                      OptionButton(
                        icon: Icons.book_rounded,
                        title: "Subjects",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListSubjectsPage()));
                        },
                      ),
                      OptionButton(
                        icon: Icons.date_range_rounded,
                        title: "Enroll Schedule",
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ListEnrollSchedulePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
