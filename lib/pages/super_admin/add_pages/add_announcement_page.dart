import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  State<AddAnnouncementPage> createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Announcements"
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add New Announcement",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        TextInput(
                          controller: titleController, 
                          label: "Title:", 
                          hint: "Enter Title",
                        ),

                        const SizedBox(height: 10,),

                        TextInput(
                          controller: dateController, 
                          label: "Date:",
                          hint: "Enter Date",
                        ),
                        
                        const SizedBox(height: 10,),
                      ],
                    ),

                    BottomButton(
                      onPressed: () {}, 
                      text: "Add New Announcement"
                    )
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}