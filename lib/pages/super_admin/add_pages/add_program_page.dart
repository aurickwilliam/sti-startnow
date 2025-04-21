import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddProgramPage extends StatefulWidget {
  const AddProgramPage({super.key});

  @override
  State<AddProgramPage> createState() => _AddProgramPageState();
}

class _AddProgramPageState extends State<AddProgramPage> {

  final TextEditingController programNameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

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
                title: "Programs"
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
                          "Add New Program",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        TextInput(
                          controller: programNameController, 
                          label: "Program Name:", 
                          hint: "Enter Program Name",
                        ),

                        const SizedBox(height: 10,),

                        TextInput(
                          controller: acronymController, 
                          label: "Acronym:",
                          hint: "Enter Program Acronym",
                        ),
                        
                        const SizedBox(height: 10,),
                        
                        TextInput(
                          controller: departmentController, 
                          label: "Department:",
                          hint: "Enter Department Name",
                        ),

                        const SizedBox(height: 10,),
                      ],
                    ),

                    BottomButton(
                      onPressed: () {}, 
                      text: "Add New Program"
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