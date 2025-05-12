import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/chatbot/components/chat_bubble.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {

  final List<List> messages = [
    ["Hello Chatbot", true],
    ["Good afternoon, what can I help you today?", false],
    ["Thank you", true],
  ];

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,

      // Content
      body: SafeArea(
        child: Column(
          children: [

            PageAppBar(
              title: "ChatBot"
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                            
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          
                          // if empty pa ung messages
                          // for future backend
                          if (messages.isEmpty){
                            return Center(
                              child: Text("Chat Now!"),
                            );
                          }
                            
                          // Return a chat bubble
                          return ChatBubble(
                            message: messages[index][0], 
                            isUser: messages[index][1]
                          );
                        }
                      )
                    ),
                            
                    // Chat Box and Send Button
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              
                              // If Focused
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTheme.colors.primary, 
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            
                              // Not Focused
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTheme.colors.gray,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            
                              hintText: "Say Hello.."
                            ),
                            
                            // Text style
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                            ),
                          ),
                        ),
                            
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(
                            Icons.send_rounded,
                            color: AppTheme.colors.primary,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}