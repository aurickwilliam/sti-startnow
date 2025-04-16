import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/enrollment/components/progress.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentHeader extends StatelessWidget {
  final bool step1;
  final bool step2;
  final bool step3;
  final bool step4;

  const EnrollmentHeader({
    super.key,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppTheme.colors.gold, width: 5)
        ),
        image: DecorationImage(
          image: AssetImage("assets/img/enrollment/admission_edited.png"),
          fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Progress(
              step1: step1,
              step2: step2,
              step3: step3,
              step4: step4,
            ),

            Text(
              "Student Type",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}