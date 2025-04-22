import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ButtonFilled extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const ButtonFilled({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,

      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.colors.black,
        backgroundColor: AppTheme.colors.secondary,

        side: BorderSide(
          color: AppTheme.colors.primary,
          width: 2.0
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),

        minimumSize: Size(double.infinity, 46)
      ),

      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}