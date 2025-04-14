import 'package:flutter/material.dart';

class SignInField extends StatelessWidget {
  final String header;
  final String hintText;
  final bool isPassword;

  const SignInField({
    super.key,
    required this.header,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text field header
        RichText(
          text: TextSpan(
            style: TextStyle(color: Color(0xFF393939)),
            children: [
              TextSpan(text: "$header: "),
              TextSpan(text: "*", style: TextStyle(color: Color(0xFFD6293E))),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Text field
        TextField(
          obscureText: isPassword ? true : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: isPassword ? Icon(Icons.visibility_outlined) : null,
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFDADADA)),
          ),
        ),
      ],
    );
  }
}
