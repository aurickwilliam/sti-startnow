import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainCoursesPage extends StatelessWidget {
  const MainCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Center(
          child: Text("COURSES"),
        )
      ),
    );
  }
}