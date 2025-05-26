import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/admin_dashboard/enrollee_status_page.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/course_tile.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminCoursesPage extends StatefulWidget {
  const AdminCoursesPage({super.key});

  @override
  State<AdminCoursesPage> createState() => _AdminCoursesPageState();
}

class _AdminCoursesPageState extends State<AdminCoursesPage> {
  late EnrolleeListProvider enroll;
  final List<List> courses = [
    [
      "Bachelor of Science in Computer Science",
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    ],

    [
      "Bachelor of Science in Information Technology",
      "assets/img/enrollment_dashboard/courses_img/it.jpg",
    ],

    [
      "Bachelor of Science in Computer Engineering",
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
    ],

    [
      "Bachelor of Science in Business Administration",
      "assets/img/enrollment_dashboard/courses_img/literature.jpg",
    ],

    [
      "Bachelor of Science in Accounting Information System",
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
    ],

    [
      "Bachelor of Science in Accountancy",
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
    ],

    [
      "Bachelor of Science in Hospitality Management",
      "assets/img/enrollment_dashboard/courses_img/cooking.jpg",
    ],

    [
      "Bachelor of Arts in Communication",
      "assets/img/enrollment_dashboard/courses_img/communication.jpg",
    ],

    [
      "Bachelor of Multimedia Arts",
      "assets/img/enrollment_dashboard/courses_img/multimedia.jpg",
    ],
    [
      "Bachelor of Science in Tourism Management",
      "assets/img/enrollment_dashboard/courses_img/tourism.jpg",
    ],
  ];

  String selectedCourse = "";

  @override
  void initState() {
    enroll = context.read<EnrolleeListProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            PageAppBar(
              title: "Courses",
              onPressed: () {},
              hasBackButton: false,
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseTile(
                      courseName: courses[index][0],
                      imgPath: courses[index][1],
                      onTap: () {
                        setState(() {
                          selectedCourse = courses[index][0];
                        });
                        enroll.setCurrentEnrollees(selectedCourse);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnrolleeStatusPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
