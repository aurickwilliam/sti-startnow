import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomTooltip extends StatefulWidget {
  final String message;
  final Duration duration;

  const CustomTooltip({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

void _showTooltip() {
  if (_overlayEntry != null || !mounted) return;

  // Delay ensures the widget is built and mounted
  Future.delayed(Duration.zero, () {
    if (!mounted || _iconKey.currentContext == null) return;

    final renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx + size.width / 2 - 130,
        top: offset.dy - 40,
        width: 140,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              border: Border.all(
                color: AppTheme.colors.gray,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              softWrap: true,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(widget.duration, () {
      _removeTooltip();
    });
  });
}

  void _removeTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showTooltip();
      },
      child: Container(
        key: _iconKey,
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: AppTheme.colors.primary,
          shape: BoxShape.circle
        ),
        child: Icon(
          Icons.question_mark_rounded,
          color: AppTheme.colors.white,
          size: 18,
        ),
      ),
    );
  }
}