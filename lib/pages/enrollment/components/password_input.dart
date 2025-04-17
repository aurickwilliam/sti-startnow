import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PasswordInput extends StatefulWidget {
  final controller;
  final String label;
  final String hint;
  final bool isRequired;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.isRequired,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: AppTheme.colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: widget.label
              ),
              TextSpan(
                text: widget.isRequired ? "*" : "",
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.red
                )
              )
            ]
          )
        ),

        const SizedBox(height: 10,),

        TextField(
          obscureText: hidePassword,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.colors.primary, 
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.colors.gray,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)
            ),

            hintText: widget.hint,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
            )
          ),
          style: GoogleFonts.roboto(
            color: AppTheme.colors.black,
            fontSize: 16
          ),
        )
      ],
    );
  }
}