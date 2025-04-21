import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});

  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {

  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController subjectUnitsController = TextEditingController();
  final TextEditingController subjectYearController = TextEditingController();
  final TextEditingController subjectDepartmentController = TextEditingController();

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
                title: "Subjects"
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
                          "Add New Subject",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        TextInput(
                          controller: subjectNameController, 
                          label: "Subject Name:", 
                          hint: "Enter Subject Name",
                        ),

                        const SizedBox(height: 10,),

                        TextInput(
                          controller: subjectCodeController, 
                          label: "Subject Code:",
                          hint: "Enter Subject Code",
                        ),
                        
                        const SizedBox(height: 10,),

                        NumberInput(
                          controller: subjectUnitsController, 
                          label: "Subject Units:",
                          hint: "Enter Subject Units",
                        ),
                        
                        const SizedBox(height: 10,),

                        TextInput(
                          controller: subjectYearController, 
                          label: "Subject Year:",
                          hint: "Enter Subject Year",
                        ),
                        
                        const SizedBox(height: 10,),
                        
                        TextInput(
                          controller: subjectDepartmentController, 
                          label: "Department:",
                          hint: "Enter Department Name",
                        ),

                        const SizedBox(height: 10,),
                      ],
                    ),

                    BottomButton(
                      onPressed: () {}, 
                      text: "Add New Subject"
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