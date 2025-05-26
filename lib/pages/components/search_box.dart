import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isEnable;
  final void Function(String)? onChanged;

  const SearchBox({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.isEnable = true,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
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
            children: [TextSpan(text: widget.label)],
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          onChanged: widget.onChanged,
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
              Icons.search_rounded,
              color: isFocused ? AppTheme.colors.primary : AppTheme.colors.gray,
            ),
          ),
          style: GoogleFonts.roboto(color: AppTheme.colors.black, fontSize: 16),
          onTapOutside: (event) => focusNode.unfocus(),
        ),
      ],
    );
  }
}
