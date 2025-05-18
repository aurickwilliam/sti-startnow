import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class IndividualPage extends StatelessWidget {
  final String image;
  final String text;

  const IndividualPage({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image container
            Container(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
        
            const SizedBox(height: 50,),
        
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}