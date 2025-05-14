import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/admin_profile_card.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/admin_profile_information_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
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
                AdminProfileCard(
                  name: "John Doe",
                  studentNo: "02000123456",
                  profileImg: "assets/img/def_profile.jpg",
                  coverImg: "assets/img/sample_cover.png",
                ),
          
                const SizedBox(height: 20,),
          
                AdminProfileInformationCard(
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
          ),
        )
      ),
    );
  }
}