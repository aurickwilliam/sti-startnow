import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/enrollee_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/enrollee_information_page.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleeListPage extends StatelessWidget {
  EnrolleeListPage({super.key});

  final List<String> listOfStatus = ["Not Enrolled", "Unverified", "Verified"];

  @override
  Widget build(BuildContext context) {
    final enrolleeListProvider = Provider.of<EnrolleeListProvider>(context);

    // Which page is it,
    String status = listOfStatus[enrolleeListProvider.getSelectedStatus - 1];

    // List of Enrollees
    List<Student> listOfEnrolless = enrolleeListProvider.getSelectedStudents;

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

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

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfEnrolless.length,
                      itemBuilder: (context, index) {
                        return EnrolleeTile(
                          firstName: listOfEnrolless[index].firstName!,
                          lastName: listOfEnrolless[index].lastName!,
                          course: listOfEnrolless[index].course!,
                          profileImg: listOfEnrolless[index].profileImg,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => EnrolleeInformationPage(
                                      student: listOfEnrolless[index],
                                    ),
                              ),
                            );
                          },
                        );
                      },
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
