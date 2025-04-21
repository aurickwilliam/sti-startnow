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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.colors.gray,
                width: 2.0
              )
            ),

            child: Icon(
              icon,
              size: 30,
              color: AppTheme.colors.gold,
            ),
          ),

          const SizedBox(height: 10,),

          Text(
            title,
            style: GoogleFonts.roboto(
              color: AppTheme.colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}