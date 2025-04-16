import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/bullet_list.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CourseOfferInfoPage extends StatelessWidget {
  final String courseName;
  final String imgPath;
  final String courseDescription;
  final List<String> skillToLearn;
  final List<String> careerOppotunities;

  const CourseOfferInfoPage({
    super.key,
    required this.courseName,
    required this.imgPath,
    required this.courseDescription,
    required this.skillToLearn,
    required this.careerOppotunities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageAppBar(
                  title: "Course Offer", 
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),

                const SizedBox(height: 10,),

                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover
                    )
                  ),
                ),

                const SizedBox(height: 10,),

                Text(
                  courseName,
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10,),

                Text(
                  courseDescription,
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 14,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 20,),

                Text(
                  "Skills to Learn:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                BulletList(
                  strings: skillToLearn
                ),

                const SizedBox(height: 10,),

                Text(
                  "Career Oppotunities:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                BulletList(
                  strings: careerOppotunities
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}