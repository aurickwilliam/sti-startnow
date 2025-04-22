import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PageIndicator extends StatelessWidget {
  final int index;

  const PageIndicator({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index == 1 ? AppTheme.colors.primary : AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            shape: BoxShape.circle
          ),
        ),

        const SizedBox(width: 5),

        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index == 2 ? AppTheme.colors.primary : AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            shape: BoxShape.circle
          ),
        ),

        const SizedBox(width: 5),

        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index == 3 ? AppTheme.colors.primary : AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            shape: BoxShape.circle
          ),
        ),

        const SizedBox(width: 5),

        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index == 4 ? AppTheme.colors.primary : AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            shape: BoxShape.circle
          ),
        ),

        const SizedBox(width: 5),

        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index == 5 ? AppTheme.colors.primary : AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            shape: BoxShape.circle
          ),
        ),
      ],
    );
  }
}