import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class OptionBox extends StatelessWidget {
  final List<Widget> children;

  const OptionBox({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        border: Border.all(
          color: AppTheme.colors.gray,
          width: 2.0
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}