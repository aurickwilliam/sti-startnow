import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/enrollee_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/edit_pages/reviewed_enrollee_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/edit_pages/unverified_enrollee_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/edit_pages/not_enrolled_page.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleeListPage extends StatelessWidget {
  EnrolleeListPage({super.key});

  final List<String> listOfStatus = [
    "Not Enrolled",
    "Unverified",
    "Verified",
    "Rejected",
  ];

  @override
  Widget build(BuildContext context) {
    final enrolleeListProvider = Provider.of<EnrolleeListProvider>(context);
    // Which page is it,
    String status = listOfStatus[enrolleeListProvider.getSelectedStatus - 1];

    List<Student> getEnrolleeList() {
      switch (status) {
        case "Not Enrolled":
          return enrolleeListProvider.notEnrolledList;
        case "Unverified":
          return enrolleeListProvider.unverifiedList;
        case "Verified":
          return enrolleeListProvider.verifiedList;
        case "Rejected":
          return enrolleeListProvider.rejectedList;
      }
      return [];
    }

    // List of Enrollees
    List<Student> listOfEnrollees = getEnrolleeList();

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Handle navigation to which enrollee edit page
    void handleNavigation(Student student) {
      Widget destination = SizedBox.shrink();

      if (status == "Not Enrolled") {
        destination = NotEnrolledPage(student: student);
      } else if (status == "Unverified") {
        destination = UnverifiedEnrolleePage(student: student);
      } else if (status == "Verified" || status == "Rejected") {
        destination = ReviewedEnrolleePage(student: student, status: status);
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "List of Enrollees",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    Text(
                      "$status Enrollees:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    listOfEnrollees.isNotEmpty
                        ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listOfEnrollees.length,
                          itemBuilder: (context, index) {
                            return EnrolleeTile(
                              firstName: listOfEnrollees[index].firstName!,
                              lastName: listOfEnrollees[index].lastName!,
                              course: listOfEnrollees[index].programAcronym,
                              profileImg: listOfEnrollees[index].profileImg,
                              onTap: () {
                                handleNavigation(listOfEnrollees[index]);
                              },
                            );
                          },
                        )
                        : Center(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 200,
                                child: Image(
                                  image: AssetImage(
                                    "assets/img/not_found_img.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),

                              Text(
                                "No Enrollees Data",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                    const SizedBox(height: 20),
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
