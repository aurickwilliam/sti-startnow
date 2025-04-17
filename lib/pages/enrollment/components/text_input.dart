import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';


class TextInput extends StatelessWidget {
  final controller;
  final String label;
  final String hint;
  final bool isRequired;

  const TextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.isRequired,
  });

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
                text: label
              ),
              TextSpan(
                text: isRequired ? "*" : "",
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.red
                )
              )
            ]
          )
        ),

        const SizedBox(height: 10,),

        TextField(
          controller: controller,
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

            hintText: hint,
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: Icon(Icons.clear),
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