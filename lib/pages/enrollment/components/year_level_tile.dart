import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class YearLevelTile extends StatelessWidget {
  final String year;
  final Function()? onTap;

  const YearLevelTile({
    super.key,
    required this.year,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Material(
          color: AppTheme.colors.white,
          child: ListTile(
            title: Text(
              year,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
              ),
            ),
        
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppTheme.colors.gray,
                width: 2.0,
              )
            ),
          ),
        ),
      ),
    );
  }
}