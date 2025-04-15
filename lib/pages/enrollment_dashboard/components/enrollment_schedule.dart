import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentSchedule extends StatelessWidget {
  const EnrollmentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        children: [
          
          // Buttons for switching from regular to irregular
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
            
                // Regular
                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    "Regular",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ),
            
                // Irregular
                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    "Irregular",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            
                // Start of Enrollment
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From To",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "mm/dd/yy",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "mm/dd/yy",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            
              ],
            ),
          )
        ],
      ),
    );
  }
}