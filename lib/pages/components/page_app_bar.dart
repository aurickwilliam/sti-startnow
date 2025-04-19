import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PageAppBar extends StatelessWidget {

  final String title;
  final bool hasBackButton;
  final Function()? onPressed;

  const PageAppBar({
    super.key,
    required this.title,
    this.hasBackButton = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              hasBackButton ? IconButton(
                onPressed: onPressed ?? () { Navigator.pop(context); }, 
                icon: Icon(Icons.arrow_circle_left),
                iconSize: 35,
                color: AppTheme.colors.primary,
              ) : SizedBox.shrink(), 

              Text(
                title,
                softWrap: true,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Divider(
            height: 10,
            thickness: 3,
          ),
        ],
      ),
    );
  }
}