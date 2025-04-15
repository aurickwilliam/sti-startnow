import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  final String header;
  final void Function()? onPressed;
  const SettingsHeader({super.key, required this.header, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),

        // Back button and Header
        Row(
          children: [
            // Back button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0B5793),
                shape: CircleBorder(),
                minimumSize: Size.fromRadius(14),
                elevation: 0,
              ),
              onPressed: onPressed ?? () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFFFFF)),
            ),

            // Header
            Text(
              header,
              style: TextStyle(
                color: Color(0xFF0B5793),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // Divider
        Divider(
          color: Color(0xFFF7C32E),
          thickness: 2,
          height: 2,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
