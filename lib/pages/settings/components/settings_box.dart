import 'package:flutter/material.dart';

class SettingsBox extends StatelessWidget {
  final List<Widget> children;

  const SettingsBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFDADADA)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: children),
    );
  }
}
