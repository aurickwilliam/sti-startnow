import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_courses_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_home_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_profile_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminDashboard extends StatefulWidget {

  final int selectedIndex;

  const AdminDashboard({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final List<Widget> listOfPages = [
    AdminHomePage(),
    AdminCoursesPage(),
    AdminProfilePage()
  ];

  int currentPageIndex = 0;

  @override
  void initState(){
    super.initState();
    currentPageIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/img/navigation_icon/home_filled.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            icon: Image.asset(
              "assets/img/navigation_icon/home_outlined.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            label: "Home"
          ),

          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/img/navigation_icon/school_filled.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            icon: Image.asset(
              "assets/img/navigation_icon/school_outlined.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            label: "Courses"
          ),

          NavigationDestination(
            selectedIcon: Image.asset(
              "assets/img/navigation_icon/user_filled.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            icon: Image.asset(
              "assets/img/navigation_icon/user_outlined.png",
              scale: 18,
              color: AppTheme.colors.primary,
            ),
            label: "Profile"
          ),
        ],

        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: AppTheme.colors.white,
        indicatorColor: Colors.transparent,
      ),

      body: listOfPages[currentPageIndex],
    );
  }
}