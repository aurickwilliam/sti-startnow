import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class DownloadToast extends StatelessWidget {
  final String message;
  final bool isSuccess;

  const DownloadToast({
    super.key,
    required this.message,
    required this.isSuccess,
  });

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
              image: AssetImage(
                isSuccess ? "assets/img/enrollment/check-mark.png" : "assets/img/enrollment/error.png"
              ),
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