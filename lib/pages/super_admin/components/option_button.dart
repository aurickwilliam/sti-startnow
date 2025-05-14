import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const OptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: GoogleFonts.roboto(
              color: AppTheme.colors.black,
              fontSize: 16,
            ),
          ),
          tileColor: AppTheme.colors.white,
      
          leading: Icon(
            icon,
            color: AppTheme.colors.gold,
          ),
      
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: AppTheme.colors.gray,
              width: 2.0
            )
          ),
        ),
      ),
    );
  }
}