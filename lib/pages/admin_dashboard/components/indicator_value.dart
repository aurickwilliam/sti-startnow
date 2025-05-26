import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class IndicatorValue extends StatelessWidget {
  final Color color;
  final String label;

  const IndicatorValue({
    super.key,
    required this.color,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
        ),

        const SizedBox(width: 5,),

        Text(
          label,
          style: GoogleFonts.roboto(
            color: AppTheme.colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}