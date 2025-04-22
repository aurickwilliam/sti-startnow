import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/announcement_card.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/enrollees_card.dart';
import 'package:sti_startnow/pages/components/schedule_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primary,

      // Need ng layout builder para get ung size ng parent/screen
      body: LayoutBuilder(
        builder: (context, constraints){
          return SafeArea(
            child: SingleChildScrollView(
              
              // Specify na sakupin ung max height
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                // Para proportion ung child inside the ConstrainedBox
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                            
                      // App Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hi, Admin",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {}, 
                                  icon: Icon(
                                    Icons.notifications_none_outlined,
                                    color: AppTheme.colors.gold,
                                    size: 30,
                                  )
                                ),
                        
                                IconButton(
                                  onPressed: () {}, 
                                  icon: Icon(
                                    Icons.account_circle_outlined,
                                    color: AppTheme.colors.gold,
                                    size: 30,
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 10,),
                            
                      // Content
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppTheme.colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
                            child: Column(
                              children: [

                                // Announcemnet Card
                                AnnouncementCard(),

                                const SizedBox(height: 20,),

                                // Schedule Card
                                ScheduleCard(),

                                const SizedBox(height: 20,),

                                // Enrollees Card
                                EnrolleesCard(),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          );
        },
      ),
    );
  }
}