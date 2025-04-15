import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentTile extends StatelessWidget {

  final String title;
  final String imgPath;

  const EnrollmentTile({
    super.key,
    required this.title,
    required this.imgPath,
  });

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            // Title of the Tile
            Text(
              title,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Image of the Tile
            Container(
              height: 100,
              width: 100,
              child: Image.asset(imgPath),
            )
          ],
        ),
      ),
    );
  }
}