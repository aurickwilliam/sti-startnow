import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ScheduleTile extends StatelessWidget {
  final String subName;
  final String instructorName;
  final String time;

  const ScheduleTile({
    super.key,
    required this.subName,
    required this.instructorName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.colors.gray,
            width: 2.0
          )
        ),
      
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              // Subject text
              Text(
                subName,
                softWrap: true,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
          
              // instructor text
              Text(
                instructorName,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 14,
                ),
              ),
          
              Divider(
                height: 20,
              ),
          
              // Time text
              Text(
                time,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}