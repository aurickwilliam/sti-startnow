import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CardInformation extends StatelessWidget {

  final Widget child;
  final String title;

  const CardInformation({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Title of the Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: child,
          )
        ],
      ),
    );
  }
}