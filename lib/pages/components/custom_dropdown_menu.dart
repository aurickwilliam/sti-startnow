import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> listChoices;
  final TextEditingController controller;
  final String hint;
  final String label;
  final String initialValue;
  final bool isRequired;
  final bool isEnable;

  const CustomDropdownMenu({
    super.key,
    required this.listChoices,
    required this.controller,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.isRequired,
    required this.isEnable,
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

        const SizedBox(height: 5,),

        DropdownMenu(
          width: double.infinity,
          controller: controller,
          enableSearch: false,
          hintText: hint,
          trailingIcon: Icon(Icons.unfold_more),
          textStyle: GoogleFonts.roboto(
            color: AppTheme.colors.black,
            fontSize: 16,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: AppTheme.colors.black,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: AppTheme.colors.black),
              borderRadius: BorderRadius.circular(6)
            ),

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

          ),
        
          initialSelection: initialValue,
          dropdownMenuEntries: listChoices.map((item) => DropdownMenuEntry(
            value: item, 
            label: item,
            
          )).toList(),
        ),
      ],
    );
  }
}