import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class NumberInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isRequired;
  final bool isEnable;

  const NumberInput({
    super.key,
    required this.controller,
    required this.label,
    this.hint = "",
    this.isRequired = false,
    this.isEnable = true,
  });

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    // Change the isFocused variable when the user focus on the textfield
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

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
          // For filtering and inputting numbers and digits only
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],

          focusNode: focusNode,
          enabled: widget.isEnable,
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
            suffixIcon: isFocused ? IconButton(
              onPressed: () {
                widget.controller.clear();
              },
              icon: Icon(Icons.clear),
            ) : null,
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