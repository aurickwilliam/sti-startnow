import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/main_dashboard/main_profile_edit_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainProfileCard extends StatelessWidget {
  final String name;
  final String studentNo;
  final String profileImg;
  final String coverImg;

  const MainProfileCard({
    super.key,
    required this.name,
    required this.studentNo,
    required this.profileImg,
    required this.coverImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),

      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              widthFactor: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(coverImg),
                  //   fit: BoxFit.cover
                  // )
                  color: AppTheme.colors.gold
                ),
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 0,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.colors.primary,
                      width: 3.0
                    ),
                    image: DecorationImage(
                      image: AssetImage(profileImg),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
            
                const SizedBox(width: 20,),
            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            
                    const SizedBox(height: 10,),
            
                    Text(
                      studentNo,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            
                    Text(
                      "STI College Caloocan",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Align(
          //   alignment: Alignment.topRight,
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.push(context, 
          //       MaterialPageRoute(builder: (context) => 
          //       MainProfileEditPage(
          //         profileImg: profileImg,
          //         coverImg: coverImg,
          //       )));
          //     }, 
          //     icon: Icon(
          //       Icons.edit,
          //       color: AppTheme.colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}