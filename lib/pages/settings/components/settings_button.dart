import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const SettingsButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0B5793),
        fixedSize: Size(400, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
      ),
    );
  }
}
