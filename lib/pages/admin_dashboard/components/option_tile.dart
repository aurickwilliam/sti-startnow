import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isLastItem;
  final Function()? onTap;

  const OptionTile({
    super.key,
    required this.text,
    required this.icon,
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
            child: ListTile(
              title: Text(
                text,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                ),
              ),
            
              leading: Icon(
                icon,
                color: AppTheme.colors.primary,
                size: 30,
              ),
            
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.colors.gray,
                size: 30,
              ),
                    
              tileColor: AppTheme.colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),      
              
              onTap: onTap,
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