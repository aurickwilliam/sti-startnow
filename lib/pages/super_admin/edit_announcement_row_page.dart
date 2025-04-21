import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditAnnouncementRowPage extends StatefulWidget {
  final List rowValues;

  const EditAnnouncementRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditAnnouncementRowPage> createState() => _EditAnnouncementRowPageState();
}

class _EditAnnouncementRowPageState extends State<EditAnnouncementRowPage> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    // Assinging values
    titleController.text = widget.rowValues[1];
    dateController.text = widget.rowValues[2];

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              PageAppBar(
                title: "Edit Information"
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInput(
                          controller: titleController, 
                          label: "Title:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: dateController, 
                          label: "Date:", 
                        ),
                
                        const SizedBox(height: 10,),
                      ],
                    ),
                
                    BottomButton(
                      onPressed: () {}, 
                      text: "Save"
                    )
                
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}