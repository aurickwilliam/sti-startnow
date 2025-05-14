import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/super_admin/components/super_admin_profile_card.dart';
import 'package:sti_startnow/pages/super_admin/components/super_admin_profile_information_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SuperAdminProfilePage extends StatelessWidget {
  const SuperAdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageAppBar(
                title: "Profile"
              ),
          
              const SizedBox(height: 20,),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SuperAdminProfileCard(
                      name: "MIS", 
                      profileImg: "assets/img/def_profile.jpg", 
                      coverImg: "assets/img/sample_cover.png"
                    ),
                              
                    const SizedBox(height: 20,),
                              
                    SuperAdminProfileInformationCard(
                      children: [
                        InformationTile(
                          label: "Department:", 
                          data: "MIS",
                        ),
                              
                        InformationTile(
                          label: "Email Address:", 
                          data: "mis@caloocan.sti.edu.ph"
                        )
                      ]
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}