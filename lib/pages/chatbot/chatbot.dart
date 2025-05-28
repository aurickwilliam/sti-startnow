import 'package:http/http.dart' as http;
import 'dart:convert';
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

  ScrollController scrollController = ScrollController();

  final List<List> messages = [
    ["Welcome to STI StartNow Chatbot!", false],
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
              title: "StartNow ChatBot"
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10
                ),
                child: ListView.builder(
                  controller: scrollController,
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
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10
              ),
              child: Row(
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

                  const SizedBox(width: 10,),
                      
                  IconButton(
                    onPressed: () async {
                      final userInput = messageController.text.trim();
                      if (userInput.isEmpty) return;
                      
                      setState(() {
                        messages.add([userInput, true]);
                        messageController.clear();
                      });
                      
                      try{
                        //ping si render para magising server
                        final pingCheck = await http.get(Uri.parse("https://sti-startnow.onrender.com/ping"));
                        if (pingCheck.statusCode != 200) {
                          setState(() {
                            messages.add(["Server not ready. Please try again later.", false]);
                          });
                          return;
                        }
                      
                        final response = await http.post(
                            Uri.parse('https://sti-startnow.onrender.com/chat'),
                            headers: {'Content-Type': 'application/json'},
                            body: jsonEncode({'userInput': userInput}),
                        );
                      
                        if (response.statusCode == 200) {
                          final botReply = jsonDecode(response.body)['response'];
                          setState(() {
                            messages.add([botReply, false]);
                          });
                        } else {
                          setState(() {
                            messages.add(["Error: ${response.statusCode}", false]);
                          });
                        }
                      } catch(e){
                        setState(() {
                          messages.add(["Failed to connect to server.", false]);
                        });
                      }

                      // Auto-scroll to bottom
                      Future.delayed(Duration(milliseconds: 100), () {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }, 
                    icon: Icon(
                      Icons.arrow_upward_rounded,
                      color: AppTheme.colors.white,
                      size: 30,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppTheme.colors.primary
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}