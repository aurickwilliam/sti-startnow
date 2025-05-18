import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MenuDropdown extends StatelessWidget {
  final double? width;
  final List<Widget> child;

  const MenuDropdown({
    super.key,
    this.width,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: width ?? 200,
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 300
        ),
        decoration: BoxDecoration(
          color: AppTheme.colors.bgWhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppTheme.colors.gray,
            width: 2
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 32,
              offset: Offset(0, 20),
              spreadRadius: -8,
            ),
          ],
        ),
        
        // Content
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Scrollbar(
            trackVisibility: true,
            thickness: 5,
            radius: Radius.circular(10),
            interactive: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}