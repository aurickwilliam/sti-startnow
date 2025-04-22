import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isSelected;

  const CategoryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        widget.onPressed();
      },

      style: FilledButton.styleFrom(
        foregroundColor: widget.isSelected ? AppTheme.colors.white : AppTheme.colors.primary,
        backgroundColor: widget.isSelected ? AppTheme.colors.primary : Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),

      child: Text(
        widget.text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}