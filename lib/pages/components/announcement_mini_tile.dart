import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AnnouncementMiniTile extends StatelessWidget {
  final String title;
  final String date;

  const AnnouncementMiniTile({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          border: Border.all(
            color: AppTheme.colors.gray,
            width: 2.0
          ),
          borderRadius: BorderRadius.circular(10)
        ),
      
        // Content
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title text
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              ),

              // Date text
              Text(
                date,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}