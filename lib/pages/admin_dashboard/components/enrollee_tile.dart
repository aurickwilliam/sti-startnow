import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleeTile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String course;
  final String profileImg;
  final Function() onTap;

  const EnrolleeTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.profileImg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: double.infinity,
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
        
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(profileImg),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
      
                const SizedBox(width: 10,),
            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            
                    Text(
                      course,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}