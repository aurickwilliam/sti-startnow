import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/main_dashboard/components/main_profile_card.dart';
import 'package:sti_startnow/pages/main_dashboard/components/main_profile_information_card.dart';
import 'package:sti_startnow/pages/main_dashboard/list_tor_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Change nalang pag may DB na
    // if balance > 0 = false
    // final bool isTORVerified = true;


    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;

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
                MainProfileCard(
                  name: "John Doe",
                  studentNo: "02000123456",
                  profileImg: "assets/img/def_profile.jpg",
                  coverImg: "assets/img/sample_cover.png",
                ),
          
                const SizedBox(height: 20,),
          
                MainProfileInformationCard(
                  children: [
                    InformationTile(
                      label: "Academic Level:",
                      data: "Sophomore",
                    ),
          
                    const SizedBox(height: 10,),
          
                    InformationTile(
                      label: "Program:",
                      data: "BS in Computer Science",
                    ),
          
                    const SizedBox(height: 10,),
          
                    InformationTile(
                      label: "Section:",
                      data: "CS401",
                    ),
          
                    const SizedBox(height: 10,),
          
                    InformationTile(
                      label: "Email Address:",
                      data: "johndoe.123456@caloocan.sti.edu.ph",
                    )
                  ],
                ),
          
                const SizedBox(height: 20,),
          
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Verified TOR:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
          
                        const SizedBox(width: 10,),
          
                        Icon(
                          // isTORVerified ? Icons.check_circle_rounded : Icons.cancel,
                          Icons.check_circle_rounded,
                          // color: isTORVerified ? AppTheme.colors.green : AppTheme.colors.red,
                          color: AppTheme.colors.green,
                        )
                      ],
                    ),

                    const SizedBox(height: 10,),
          
                    CustomOutlineButton(
                      text: "View Transcript of Records", 
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => 
                        ListTorPage()));
                      }
                    )
                  ],
                )
          
              ],
            ),
          ),
        )
      ),
    );
  }
}