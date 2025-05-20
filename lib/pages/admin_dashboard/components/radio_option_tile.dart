import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class RadioOptionTile extends StatelessWidget {
  final String text;
  final String selectedValue;
  final bool isLastItem;
  final Function onTap;

  const RadioOptionTile({
    super.key,
    required this.text,
    required this.selectedValue,
    this.isLastItem = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            child: RadioListTile(
              value: text, 
              groupValue: selectedValue, 
              onChanged: (value) {
                onTap(value);
              },

              title: Text(
                text,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),

              tileColor: AppTheme.colors.white,
              activeColor: AppTheme.colors.gold,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),

            ),
          ),
        ),

        isLastItem ? SizedBox.shrink() : Divider(
          height: 0,
          thickness: 1,
          color: AppTheme.colors.gray,
        )
      ],
    );
  }
}