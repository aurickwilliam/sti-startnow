import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ReceiptContainer extends StatelessWidget {
  final String imgPath;

  const ReceiptContainer({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppTheme.colors.gray,
          width: 2.0,
        ),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}