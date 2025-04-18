import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/information_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/profile_card.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/profile_information_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(
                name: "John Doe",
                studentNo: "02000123456",
                profileImg: "assets/img/def_profile.jpg",
                coverImg: "assets/img/sample_cover.png",
              ),

              const SizedBox(height: 20,),

              ProfileInformationCard(
                children: [
                  InformationTile(
                    label: "Department:",
                    data: "Information Technology",
                  ),

                  const SizedBox(height: 10,),

                  InformationTile(
                    label: "Email Address:",
                    data: "johndoe.123456@caloocan.sti.edu.ph",
                  )
                ],
              ),

            ],
          ),
        )
      ),
    );
  }
}