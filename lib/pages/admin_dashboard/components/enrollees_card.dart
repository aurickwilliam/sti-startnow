import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/no_enrollees_tile.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleesCard extends StatelessWidget {
  EnrolleesCard({super.key});

  // Temporay data for Number of Enrolless
  final List<List> noEnrolless = [
    [999, "Unverified"],
    [999, "Pending"],
    [999, "Verified"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Number of Enrollees:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),

                // Direct to Announcement Page
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                noEnrolless.length, 
                (index) {
                  return NoEnrolleesTile(
                    number: noEnrolless[index][0], 
                    title: noEnrolless[index][1]
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}