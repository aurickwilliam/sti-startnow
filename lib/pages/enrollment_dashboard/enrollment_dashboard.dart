import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_image_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_schedule.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/enrollment_tile.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentDashboard extends StatefulWidget {
  const EnrollmentDashboard({super.key});

  @override
  State<EnrollmentDashboard> createState() => _EnrollmentDashboardState();
}

class _EnrollmentDashboardState extends State<EnrollmentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                      Icon(
                        Icons.menu,
                        color: AppTheme.colors.primary,
                        size: 35,
                      ),
                    ],
                  ),
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
                  onPressed: () {}, 
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
                  imgPath: "assets/img/enrollment_dashboard/requirement_img.png"
                ),

                const SizedBox(height: 15,),

                // Tuition Fee Advising Box
                EnrollmentTile(
                  title: "Tuition Fee \nAdvising", 
                  imgPath: "assets/img/enrollment_dashboard/tuition.png"
                ),

                const SizedBox(height: 15,),

                EnrollmentImageTile(
                  title: "Course Offering\nSY2025 - 2026",
                  imgPath: "assets/img/enrollment_dashboard/courses_cover_photo.jpg",
                ),

                const SizedBox(height: 15,),

                EnrollmentImageTile(
                  title: "Course\nRecommendation: \nA.I.",
                  imgPath: "assets/img/enrollment_dashboard/one_sti_crop.jpg",
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