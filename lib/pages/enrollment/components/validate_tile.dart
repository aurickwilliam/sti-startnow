import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ValidateTile extends StatelessWidget {
  final String label;
  final String data;

  const ValidateTile({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.roboto(
          color: AppTheme.colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Text(
        data,
        style: GoogleFonts.roboto(
          color: AppTheme.colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}