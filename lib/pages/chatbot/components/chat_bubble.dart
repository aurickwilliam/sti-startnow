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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65
          ),
          decoration: BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.colors.primary,
              width: 2.0
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              message,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.white,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          constraints: BoxConstraints(
            // 65% ng width ng screen ung haba ng message
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.colors.gray,
              width: 2.0
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
              ),
            ),
          )
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: isUser ? userBubble : botBubble
    );
  }
}