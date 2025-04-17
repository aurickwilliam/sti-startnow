import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isFullWidth;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.colors.gold,
        backgroundColor: AppTheme.colors.white,
        minimumSize: Size(isFullWidth ? double.infinity : 150, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: BorderSide(
          color: AppTheme.colors.gold,
          width: 2.0
        )
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
    );
  }
}