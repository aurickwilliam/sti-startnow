import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(

      // if it is user, align right
      // if it is bot, align left
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: isUser ? AppTheme.colors.gold : AppTheme.colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: isUser ? AppTheme.colors.gold: AppTheme.colors.gray,
              width: 2.0
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              message,
              style: GoogleFonts.roboto(
                color: isUser ? AppTheme.colors.white : AppTheme.colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}