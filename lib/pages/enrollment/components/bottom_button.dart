import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class BottomButton extends StatelessWidget {
  final Function()? onPressed;
  const BottomButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colors.primary,
        foregroundColor: AppTheme.colors.white,
        minimumSize: Size(double.infinity, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)
        )
      ),
      onPressed: onPressed,
      child: Text(
        "Next",
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
    );
  }
}