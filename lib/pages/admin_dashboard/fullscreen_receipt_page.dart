import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class FullscreenReceiptPage extends StatelessWidget {
  final String imgPath;

  const FullscreenReceiptPage({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: InteractiveViewer(
            child: Image.asset(
              imgPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}