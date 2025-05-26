import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class NoEnrolleesTile extends StatelessWidget {
  final int number;
  final String title;

  const NoEnrolleesTile({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.gray,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10)
          ),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                number.toString(),
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10,),

        Text(
          title,
          style: GoogleFonts.roboto(
            color: AppTheme.colors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}