import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/course_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/tuition_fee_course_page.dart';
import 'package:sti_startnow/providers/tuition_fee_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TuitionFeeAdvisingPage extends StatefulWidget {

  TuitionFeeAdvisingPage({super.key});

  @override
  State<TuitionFeeAdvisingPage> createState() => _TuitionFeeAdvisingPageState();
}

class _TuitionFeeAdvisingPageState extends State<TuitionFeeAdvisingPage> {
  late TuitionFeeProvider tuition;

  final List<List> courses = [
    [
      "Bachelor of Science in Computer Science",
      "BSCS",
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    ],

    [
      "Bachelor of Science in Information Technology",
      "BSIT",
      "assets/img/enrollment_dashboard/courses_img/it.jpg",
    ],

    [
      "Bachelor of Science in Computer Engineering",
      "BSCPE",
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
    ],

    [
      "Bachelor of Science in Business Administration",
      "BSBA",
      "assets/img/enrollment_dashboard/courses_img/literature.jpg",
    ],

    [
      "Bachelor of Science in Accounting Information System",
      "BSAIS",
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    ],

    [
      "Bachelor of Science in Accountancy",
      "BSA",
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
    ],

    [
      "Bachelor of Science in Hospitality Management",
      "BSHM",
      "assets/img/enrollment_dashboard/courses_img/cooking.jpg",
    ],

    [
      "Bachelor of Arts in Communication",
      "BACOMM",
      "assets/img/enrollment_dashboard/courses_img/communication.jpg",
    ],

    [
      "Bachelor of Multimedia Arts",
      "BMMA",
      "assets/img/enrollment_dashboard/courses_img/multimedia.jpg",
    ],
    [
      "Bachelor of Science in Tourism Management",
      "BSTM",
      "assets/img/enrollment_dashboard/courses_img/tourism.jpg",
    ],
  ];

  @override
  void initState() {
    tuition = context.read<TuitionFeeProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape mode
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageAppBar(
              title: "Tuition Fee",
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            courseName: courses[index][0],
                            imgPath: courses[index][2],
                            onTap: () {
                              debugPrint("SHIBALLL! ${courses[index][1]}");

                              tuition.changeSelectedCourse(courses[index][1]);

                              debugPrint(tuition.selectedCourse.toString());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          TuitionFeeCoursePage(index: index),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
