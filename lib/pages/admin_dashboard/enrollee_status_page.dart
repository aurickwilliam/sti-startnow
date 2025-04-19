import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/option_box.dart';
import 'package:sti_startnow/pages/components/option_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/enrollee_list_page.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleeStatusPage extends StatelessWidget {
  const EnrolleeStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enrolleeList = Provider.of<EnrolleeListProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Courses", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),

              const SizedBox(height: 20,),

              Text(
                "Student Enrollment Status:",
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10,),

              OptionBox(
                children: [
                  OptionTile(
                    text: "Unverified", 
                    icon: Icons.sentiment_dissatisfied_rounded, 
                    onTap: () {
                      enrolleeList.changeSelectedStatus(1);
                      print(enrolleeList.getSelectedStatus);

                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                    }
                  ),

                  OptionTile(
                    text: "Pending", 
                    icon: Icons.schedule_rounded, 
                    onTap: () {
                      enrolleeList.changeSelectedStatus(2);
                      print(enrolleeList.getSelectedStatus);

                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                    }
                  ),

                  OptionTile(
                    text: "Verified", 
                    icon: Icons.sentiment_satisfied_rounded, 
                    onTap: () {
                      enrolleeList.changeSelectedStatus(3);
                      print(enrolleeList.getSelectedStatus);

                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                    },
                    isLastItem: true,
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}