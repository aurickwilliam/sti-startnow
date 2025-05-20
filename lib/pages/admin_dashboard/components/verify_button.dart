import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class VerifyButton extends StatelessWidget {
  final String title;
  final String selectedValue;
  final Function onTap;
  final bool isEnable;

  const VerifyButton({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onTap,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto(
          color: AppTheme.colors.black,
          fontSize: 16,
        ),
      ),
      groupValue: selectedValue,
      value: title,
      activeColor: AppTheme.colors.gold,
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
    
      onChanged: isEnable ? (value) {
        onTap(value);
      } : null,
    );
  }
}