import 'package:flutter/material.dart';

class SettingsField extends StatelessWidget {
  final String header;
  final String hintText;
  final bool isPassword;

  const SettingsField({
    super.key,
    required this.header,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text field header
          Text(
            "$header:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),

          // Text field
          TextField(
            obscureText: isPassword ? true : false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: isPassword ? Icon(Icons.visibility_outlined) : null,
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFFDADADA)),
            ),
          ),
        ],
      ),
    );
  }
}
