import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SignInBox extends StatelessWidget {
  final List<Widget> children;

  const SignInBox({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign in header
            Text(
              "Sign In Now!",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
        
            const SizedBox(height: 20),
              
            Column(
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
