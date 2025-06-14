import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/main_dashboard/components/main_profile_card.dart';
import 'package:sti_startnow/pages/main_dashboard/components/main_profile_information_card.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<DatabaseProvider>(context).student;

    // Change nalang pag may DB na
    // if balance > 0 = false
    // final bool isTORVerified = true;

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainProfileCard(
                  name: student.fullName,
                  studentNo: student.studentNo!,
                  profileImg: "assets/img/def_profile.jpg",
                  coverImg: "assets/img/sample_cover.png",
                ),

                const SizedBox(height: 20),

                MainProfileInformationCard(
                  children: [
                    InformationTile(
                      label: "Academic Level:",
                      data: student.enrollment.yearLevel ?? "Not Yet Enrolled",
                    ),

                    const SizedBox(height: 10),

                    InformationTile(label: "Program:", data: student.program!),

                    const SizedBox(height: 10),

                    InformationTile(
                      label: "Section:",
                      data: student.enrollment.section ?? "Not Yet Enrolled",
                    ),

                    const SizedBox(height: 10),

                    InformationTile(
                      label: "Email Address:",
                      data: student.schoolEmail!,
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
