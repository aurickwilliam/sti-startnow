import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentStatusCard extends StatelessWidget {
  const EnrollmentStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enrollment Status:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                IconButton(
                  onPressed: () {}, 
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.colors.primary,
                    size: 25,
                  )
                )
              ],
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Name of the Student
                Text(
                  "John D. Doe",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),

                // Student Number of the Student
                Text(
                  "02000123456",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                  ),
                ),

                Divider(
                  height: 10,
                ),

                // Term and Year
                Text(
                  "3rd Year 1st Term SY. 2025 - 2026",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 10,),

                RichText(
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Status: ",
                      ),

                      // Status Text
                      TextSpan(
                        // Temporary
                        text: "PENDING",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.gold,
                        )
                      )
                    ]
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}