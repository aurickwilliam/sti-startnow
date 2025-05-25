import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddButtonTable extends StatefulWidget {
  final Function() onPressed;

  const AddButtonTable({
    super.key,
    required this.onPressed,
  });

  @override
  State<AddButtonTable> createState() => _AddButtonTableState();
}

class _AddButtonTableState extends State<AddButtonTable> {
  String text = "Select";
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
        setState(() {
          text =  isClicked ? "Selected" : "Select";
          isClicked = !isClicked;
        });
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: AppTheme.colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
      )
    );
  }
}