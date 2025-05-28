import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/main_dashboard/main_subjects_page.dart';
import 'package:sti_startnow/pages/main_dashboard/main_home_page.dart';
import 'package:sti_startnow/pages/main_dashboard/main_profile_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainDashboard extends StatefulWidget {
  final int selectedIndex;

  const MainDashboard({super.key, this.selectedIndex = 0});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int currentPageIndex = 0;

  final List<Widget> listOfDestination = [
    MainHomePage(),
    MainSubjectsPage(),
    MainProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppTheme.colors.gray, width: 1.0),
          ),
        ),
        child: NavigationBar(
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
              label: "Home",
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
              label: "Courses",
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
              label: "Profile",
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
          height: 50,
        ),
      ),

      body: listOfDestination[currentPageIndex],
    );
  }
}
