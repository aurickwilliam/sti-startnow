import 'package:flutter/material.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class FullscreenImagePage extends StatelessWidget {
  final String? imgUrl; // Kapag merong receipt sa database
  final String imgPath;

  const FullscreenImagePage({super.key, required this.imgPath, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: InteractiveViewer(
          child: Center(
            child:
                imgUrl == null
                    ? Image.asset(imgPath, fit: BoxFit.contain)
                    : Image.network(imgUrl!),
          ),
        ),
      ),
    );
  }
}
