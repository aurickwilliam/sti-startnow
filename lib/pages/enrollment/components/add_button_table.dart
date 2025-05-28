import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

// ignore: must_be_immutable
class AddButtonTable extends StatefulWidget {
  bool isClicked;
  final Function(bool) onPressed;

  AddButtonTable({super.key, required this.onPressed, this.isClicked = false});

  @override
  State<AddButtonTable> createState() => _AddButtonTableState();
}

class _AddButtonTableState extends State<AddButtonTable> {
  @override
  Widget build(BuildContext context) {
    String text = widget.isClicked ? "Selected" : "Select";
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.isClicked = !widget.isClicked;
          text = widget.isClicked ? "Selected" : "Select";
        });
        widget.onPressed(widget.isClicked);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: AppTheme.colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
