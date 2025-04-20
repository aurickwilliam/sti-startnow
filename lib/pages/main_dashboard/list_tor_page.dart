import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListTorPage extends StatelessWidget {
  const ListTorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              PageAppBar(
                title: "Documents",
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => 
                  MainDashboard(selectedIndex: 2,)));
                },
              )
            ],
          ),
        )
      ),
    );
  }
}