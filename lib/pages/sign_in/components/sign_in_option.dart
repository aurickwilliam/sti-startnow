import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SignInOption extends StatelessWidget {
  final String header;
  final String linkText;
  final void Function()? onTap;

  const SignInOption({
    super.key,
    required this.header,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.roboto(
          color: AppTheme.colors.black,
        ),
        children: [
          TextSpan(
            text: "$header\n",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold, 
              fontSize: 16
            ),
          ),
          TextSpan(
            text: linkText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: GoogleFonts.roboto(
              color: AppTheme.colors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
