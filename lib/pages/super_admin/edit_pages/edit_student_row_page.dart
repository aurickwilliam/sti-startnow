import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditStudentRowPage extends StatefulWidget {
  final List rowValues;

  const EditStudentRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditStudentRowPage> createState() => _EditStudentRowPageState();
}

class _EditStudentRowPageState extends State<EditStudentRowPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController studentNoController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    // Assinging values
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    studentNoController.text = widget.rowValues[3];
    programController.text = widget.rowValues[4];
    emailAddressController.text = widget.rowValues[5];

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
                          controller: firstNameController, 
                          label: "First Name:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: lastNameController, 
                          label: "Last Name:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        NumberInput(
                          controller: studentNoController, 
                          label: "Student No:"
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: programController, 
                          label: "Program:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: emailAddressController, 
                          label: "Email Address:", 
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