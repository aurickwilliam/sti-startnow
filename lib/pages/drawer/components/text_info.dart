import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TextInfo extends StatelessWidget {
  final String topic;
  final String info;
  const TextInfo({
    super.key,
    required this.topic,
    required this.info
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topic,
            style: GoogleFonts.roboto(
              color: AppTheme.colors.gold,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
      
          const SizedBox(height: 5,),
      
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "- $info",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}