import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddEnrollSchedPage extends StatefulWidget {
  const AddEnrollSchedPage({super.key});

  @override
  State<AddEnrollSchedPage> createState() => _AddEnrollSchedPageState();
}

class _AddEnrollSchedPageState extends State<AddEnrollSchedPage> {

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController schoolYearController = TextEditingController();
  final TextEditingController termController = TextEditingController();


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
                title: "Enroll Schedule"
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
                          "Add New Enrollment Schedule",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        TextInput(
                          controller: fromController, 
                          label: "Title:", 
                          hint: "Enter Title",
                        ),

                        const SizedBox(height: 10,),

                        TextInput(
                          controller: toController, 
                          label: "Date:",
                          hint: "Enter Date",
                        ),
                        
                        const SizedBox(height: 10,),

                        TextInput(
                          controller: schoolYearController, 
                          label: "School Year:",
                          hint: "Enter School Year",
                        ),
                        
                        const SizedBox(height: 10,),

                        TextInput(
                          controller: termController, 
                          label: "Term:",
                          hint: "Enter Term",
                        ),
                        
                        const SizedBox(height: 10,),
                      ],
                    ),

                    BottomButton(
                      onPressed: () {}, 
                      text: "Add New Enroll Schedule"
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