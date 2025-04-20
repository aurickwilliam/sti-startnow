import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class InformationTile extends StatelessWidget {
  final String label;
  final String data;

  const InformationTile({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            color: AppTheme.colors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 5,),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppTheme.colors.gold,
              width: 2.0
            )
          ),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              data,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}