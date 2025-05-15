import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define(){
    return ThemeData(
      dividerTheme: DividerThemeData(
        color: colors.gold,
        thickness: 2,
        space: 1,
      ),
      primaryColor: colors.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.colors.primary)
    );
  }
}