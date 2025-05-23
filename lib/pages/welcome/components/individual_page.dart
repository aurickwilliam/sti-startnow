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

    // if it is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

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
              height: isLandscape ? 200 : 500,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
        
            SizedBox(
              height: isLandscape ? 20 : 50,
            ),
        
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: isLandscape ? 20 : 32,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}