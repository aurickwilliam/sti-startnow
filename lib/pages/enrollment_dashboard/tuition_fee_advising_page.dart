import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/course_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/tuition_fee_course_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TuitionFeeAdvisingPage extends StatelessWidget {

  final List<String> courses = [
    "Bachelor of Science in Computer Science",
    "Bachelor of Science in Information Technology",
    "Bachelor of Science in Computer Engineering",
    "Bachelor of Science in Business Administration",
    "Bachelor of Science in Accounting Information System",
    "Bachelor of Science in Accountancy",
    "Bachelor of Science in Hospitality Management",
    "Bachelor of Arts in Communication",
    "Bachelor of Multimedia Arts",
    "Bachelor of Science Tourism Management"
  ];

  final List<String> courseImgPath = [
    "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    "assets/img/enrollment_dashboard/courses_img/it.jpg",
    "assets/img/enrollment_dashboard/courses_img/math.jpg",
    "assets/img/enrollment_dashboard/courses_img/literature.jpg",
    "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    "assets/img/enrollment_dashboard/courses_img/math.jpg",
    "assets/img/enrollment_dashboard/courses_img/cooking.jpg",
    "assets/img/enrollment_dashboard/courses_img/communication.jpg",
    "assets/img/enrollment_dashboard/courses_img/multimedia.jpg",
    "assets/img/enrollment_dashboard/courses_img/tourism.jpg",
  ];  


  TuitionFeeAdvisingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              PageAppBar(
                title: "Tuition Fee", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),

              const SizedBox(height: 10,),

              Text(
                "Select a Course:",
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseTile(
                      courseName: courses[index],
                      imgPath: courseImgPath[index],
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => TuitionFeeCoursePage(index: index,)
                          )
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          )
        )
      )
    );
  }
}