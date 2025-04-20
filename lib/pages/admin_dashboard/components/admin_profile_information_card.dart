import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminProfileInformationCard extends StatelessWidget {
  final List<Widget> children;

  const AdminProfileInformationCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
        color: AppTheme.colors.white
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              "Information",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}