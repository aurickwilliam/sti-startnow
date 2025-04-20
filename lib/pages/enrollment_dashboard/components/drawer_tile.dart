import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class DrawerTile extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function() onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppTheme.colors.primary,
        size: 30,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          color: AppTheme.colors.primary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15), 
          bottomRight: Radius.circular(15)
        ),
        side: BorderSide(
          color: AppTheme.colors.gold,
          width: 2,
        )
      ),
      tileColor: AppTheme.colors.white,
    );
  }
}