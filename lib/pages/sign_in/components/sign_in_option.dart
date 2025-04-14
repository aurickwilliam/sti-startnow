import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
        style: TextStyle(color: Color(0xFF393939)),
        children: [
          TextSpan(
            text: "$header\n",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text: linkText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: TextStyle(
              color: Color(0xFF0B5793),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
