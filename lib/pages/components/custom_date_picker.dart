import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isRequired;
  final bool isEnable;
  final void Function(bool)? handleError;
  bool isError;

  CustomDatePicker({
    super.key,
    required this.controller,
    required this.label,
    this.hint = "",
    this.isRequired = false,
    this.isEnable = true,
    this.isError = false,
    this.handleError,
  }) {
    if (isRequired) {
      assert(handleError != null);
    }
  }

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    // Change the isFocused variable when the user focus on the textfield
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;

        if (widget.isRequired) {
          widget.isError = widget.controller.text.isEmpty;
          widget.handleError!(widget.isError);
        }
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
              TextSpan(text: widget.label),
              TextSpan(
                text: widget.isRequired ? "*" : "",
                style: GoogleFonts.roboto(color: AppTheme.colors.red),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          focusNode: focusNode,
          enabled: widget.isEnable,
          controller: widget.controller,
          readOnly: true,

          onTap: () {
            selectDate();
          },

          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder:
                widget.isError
                    ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                    : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.colors.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

            enabledBorder:
                widget.isError
                    ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.colors.red,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                    : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.colors.gray,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.gray, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            hintText: widget.hint,

            suffixIcon:
                isFocused
                    ? IconButton(
                      onPressed: () {
                        widget.controller.clear();
                      },
                      icon: Icon(Icons.clear),
                    )
                    : null,

            prefixIcon: Icon(
              Icons.date_range_rounded,
              color: isFocused ? AppTheme.colors.primary : AppTheme.colors.gray,
              size: 30,
            ),
          ),

          style: GoogleFonts.roboto(color: AppTheme.colors.black, fontSize: 16),
          onTapOutside: (event) {
            focusNode.unfocus();
          },
        ),

        widget.isError
            ? Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1),
              child: Text(
                "Please choose a date",
                style: TextStyle(color: Colors.red[600], fontSize: 12),
              ),
            )
            : Container(),
      ],
    );
  }

  // Method to show the date picker
  Future<void> selectDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate:
          widget.controller.text.isEmpty
              ? DateTime.now()
              : DateTime.parse(widget.controller.text),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    setState(() {
      if (date != null) {
        widget.controller.text = date.toString().split(" ")[0];

        if (widget.isRequired) {
          widget.isError = false;
          widget.handleError!(widget.isError);
        }
      }
    });
  }
}
