import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/chatbot/chatbot.dart';
import 'package:sti_startnow/pages/drawer/about_page.dart';
import 'package:sti_startnow/pages/drawer/mission_vision_page.dart';
import 'package:sti_startnow/pages/enrollment/student_type_page.dart';
import 'package:sti_startnow/pages/components/drawer_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_image_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_schedule.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/course_offer_list_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/requirement_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/tuition_fee_advising_page.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_student_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentDashboard extends StatelessWidget {
  const EnrollmentDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    // Boolean if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      endDrawer: Drawer(
        backgroundColor: AppTheme.colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: ListView(
            children: [
              DrawerTile(
                title: "Misson & Vision",
                icon: Icons.key,
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => MissionVisionPage()));
                },
              ),

              const SizedBox(height: 20,),

              DrawerTile(
                title: "About",
                icon: Icons.emoji_objects_outlined,
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),

              const SizedBox(height: 20,),

              DrawerTile(
                title: "Sign In",
                icon: Icons.login_rounded,
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SignInStudentPage()));
                },
              ),

              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => Chatbot()));
        },
        backgroundColor: AppTheme.colors.gold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999)
        ),
        child: Icon(
          Icons.lightbulb,
          color: AppTheme.colors.white,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24, 
              vertical: 15
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                    
                          // Greetings at the Top
                          Text(
                            "Welcome Future STIer's",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    
                          // Hamburger Menu for the Drawer
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            }, 
                            icon: Icon(Icons.menu),
                            iconSize: 35,
                            color: AppTheme.colors.primary,
                          ),
                        ],
                      ),
                    );
                  }
                ),
            
                // Enrollment Schedule Title
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Enrollment Schedule SY2025 - 2026:",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.colors.black,
                    ),
                  ),
                ),

                // Enrollment Schedule Box
                EnrollmentSchedule(),

                const SizedBox( height: 15,),

                // Enrollment Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => StudentTypePage()));
                  }, 
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                      minimumSize: Size(double.infinity, 46),
                      backgroundColor: AppTheme.colors.primary,
                      foregroundColor: AppTheme.colors.white
                  ),
                  child: Text(
                    "Enroll Now!",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Divider(
                  height: 40,
                  thickness: 4,
                ),

                // Requirement Box
                EnrollmentTile(
                  title: "Requirement for \nEnrollee", 
                  imgPath: "assets/img/enrollment_dashboard/requirement_img.png",
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => RequirementPage()
                      )
                    );
                  },
                ),

                const SizedBox(height: 15,),

                // Tuition Fee Advising Box
                EnrollmentTile(
                  title: "Tuition Fee \nAdvising", 
                  imgPath: "assets/img/enrollment_dashboard/tuition.png",
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => TuitionFeeAdvisingPage()
                      )
                    );
                  },
                ),

                const SizedBox(height: 15,),

                EnrollmentImageTile(
                  title: "Course Offering\nSY2025 - 2026",
                  imgPath: "assets/img/enrollment_dashboard/courses_cover_photo.jpg",
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => CourseOfferListPage()));
                  },
                ),

                const SizedBox(height: 15,),

                EnrollmentImageTile(
                  title: "Course\nRecommendation: \nA.I.",
                  imgPath: "assets/img/enrollment_dashboard/one_sti_crop.jpg",
                  onTap: () {
                    // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => ));
                  },
                ),

                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}