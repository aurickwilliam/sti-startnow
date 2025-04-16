import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class Progress extends StatelessWidget {  

  final bool step1;
  final bool step2;
  final bool step3;
  final bool step4;

  const Progress({
    super.key,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: step1 ? AppTheme.colors.primary : AppTheme.colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.colors.primary,
                width: 2
              )
            ),
            child: Center(
              child: Text(
                "1",
                style: GoogleFonts.roboto(
                  color: step1 ? AppTheme.colors.white : AppTheme.colors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(
            width: 50,
            height: 5,
            color: step1 ? AppTheme.colors.gold : AppTheme.colors.gray,
          ),

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: step2 ? AppTheme.colors.primary : AppTheme.colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.colors.primary,
                width: 2
              )
            ),
            child: Center(
              child: Text(
                "2",
                style: GoogleFonts.roboto(
                  color: step2 ? AppTheme.colors.white : AppTheme.colors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(
            width: 50,
            height: 5,
            color: step2 ? AppTheme.colors.gold : AppTheme.colors.gray,
          ),

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: step3 ? AppTheme.colors.primary : AppTheme.colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.colors.primary,
                width: 2
              )
            ),
            child: Center(
              child: Text(
                "3",
                style: GoogleFonts.roboto(
                  color: step3 ? AppTheme.colors.white : AppTheme.colors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(
            width: 50,
            height: 5,
            color: step3 ? AppTheme.colors.gold : AppTheme.colors.gray,
          ),

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: step4 ? AppTheme.colors.primary : AppTheme.colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.colors.primary,
                width: 2
              )
            ),
            child: Center(
              child: Text(
                "4",
                style: GoogleFonts.roboto(
                  color: step4 ? AppTheme.colors.white : AppTheme.colors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
                
        ],
      ),
    );
  }
}