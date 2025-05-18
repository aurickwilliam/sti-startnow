import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final Function() onTap;

  const MenuItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}