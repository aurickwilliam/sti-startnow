import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class DeleteButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isFullWidth;

  const DeleteButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.red,
        minimumSize: Size(isFullWidth ? double.infinity : 150, 46),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppTheme.colors.red,
            width: 2.0
          ),
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onPressed: onPressed,
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