import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class VerifyButton extends StatelessWidget {
  final String title;
  final String selectedValue;
  final Function onTap;

  const VerifyButton({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: RadioListTile(
        title: Text(
          title
        ),
        groupValue: selectedValue,
        value: title,
        activeColor: AppTheme.colors.gold,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),

        onChanged: (value) {
          onTap(value);
        },
      ),
    );
  }
}