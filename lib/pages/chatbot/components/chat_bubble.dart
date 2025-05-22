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

    // For User
    Widget userBubble = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.colors.gold,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppTheme.colors.gold,
              width: 2.0
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              message,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),

        const SizedBox(width: 5,),

        // Profile Image
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            image: DecorationImage(
              image: AssetImage(
                "assets/img/def_profile.jpg"
              )
            )
          ),
        )
      ],
    );

    // For Bot
    Widget botBubble = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Profile Image
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
            image: DecorationImage(
              image: AssetImage(
                "assets/img/chatbot_profile/pero.png"
              )
            )
          ),
        ),

        const SizedBox(width: 5,),

        Container(
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppTheme.colors.gray,
              width: 2.0
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              message,
              softWrap: true,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: isUser ? userBubble : botBubble
    );
  }
}