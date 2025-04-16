import 'package:flutter/material.dart';

class SettingsBoxItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isLastItem; // Terrible solution, refer below
  final void Function()? onTap;

  const SettingsBoxItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF0B5793)),
      minLeadingWidth: 30,
      title: Text(title),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDADADA)),
      ),
      shape: // This adds bottom border to item if not last in box, please refactor
          isLastItem
              ? null
              : Border(bottom: BorderSide(color: Color(0xFFDADADA))),
    );
  }
}
