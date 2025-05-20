import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isRequired;
  final bool isEnable;
  final bool hasFormat; // Kapag may specific format ang field (e.g. Email)
  final bool Function(String)?
  invalidCheck; // Gagamitin sa pag check kung sunod sa format ang input
  final String? requiredMessage; // Optional, message kapag wala inenter user
  final String? invalidMessage; // Optional, message kapag mali ienenter ni user

  TextInput({
    super.key,
    required this.controller,
    required this.label,
    this.hint = "",
    this.isRequired = false,
    this.isEnable = true,
    this.hasFormat = false,
    this.invalidCheck,
    this.requiredMessage,
    this.invalidMessage,
  }) {
    if (hasFormat) {
      assert(invalidCheck != null);
      // Kailangan may invalid check kapag may format
    }
  }

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
              TextSpan(text: widget.label),
              TextSpan(
                text: widget.isRequired ? "*" : "",
                style: GoogleFonts.roboto(color: AppTheme.colors.red),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        TextFormField(
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
              borderRadius: BorderRadius.circular(10),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.gray, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.gray, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            hintText: widget.hint,
            errorStyle: TextStyle(color: Colors.red[600]),

            suffixIcon:
                isFocused
                    ? IconButton(
                      onPressed: () {
                        widget.controller.clear();
                      },
                      icon: Icon(Icons.clear),
                    )
                    : null,
          ),
          style: GoogleFonts.roboto(color: AppTheme.colors.black, fontSize: 16),
          onTapOutside: (event) {
            focusNode.unfocus();
          },

          validator:
              widget.isRequired || widget.hasFormat
                  ? (input) {
                    bool isInvalid;
                    String message;

                    if (widget.isRequired) {
                      isInvalid = input == null || input.trim().isEmpty;
                      message =
                          widget.requiredMessage ?? "Please enter information";

                      if (isInvalid) {
                        return message;
                      }
                    }

                    if (widget.hasFormat) {
                      if (input != null && input.isNotEmpty) {
                        isInvalid = widget.invalidCheck!(input);
                      } else {
                        return null;
                      }
                      message =
                          widget.invalidMessage ??
                          "Please enter valid information";

                      if (isInvalid) {
                        return message;
                      }
                    }

                    return null;
                  }
                  : null,
          autovalidateMode: AutovalidateMode.onUnfocus,
        ),
      ],
    );
  }
}
