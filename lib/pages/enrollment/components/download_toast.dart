import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class DownloadToast extends StatelessWidget {
  const DownloadToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppTheme.colors.gray,
          width: 2.0,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/img/enrollment/check-mark.png"),
              fit: BoxFit.contain,
              width: 50,
            ),
        
            const SizedBox(height: 20,),
        
            Text(
              "Downloaded",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}