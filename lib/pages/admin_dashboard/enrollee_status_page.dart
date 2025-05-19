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

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Courses", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                              
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
                          text: "Not Enrolled", 
                          icon: Icons.sentiment_dissatisfied_rounded, 
                          onTap: () {
                            enrolleeList.changeSelectedStatus(1);
                              
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                          }
                        ),
                              
                        OptionTile(
                          text: "Unverified", 
                          icon: Icons.schedule_rounded, 
                          onTap: () {
                            enrolleeList.changeSelectedStatus(2);
                              
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                          }
                        ),
                              
                        OptionTile(
                          text: "Verified", 
                          icon: Icons.check_rounded, 
                          onTap: () {
                            enrolleeList.changeSelectedStatus(3);
                              
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => EnrolleeListPage()));
                          },
                        ),

                        OptionTile(
                          text: "Rejected", 
                          icon: Icons.close_rounded, 
                          onTap: () {
                            enrolleeList.changeSelectedStatus(4);
                              
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
            ],
          ),
        ),
      ),
    );
  }
}