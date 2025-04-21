import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditProgramRowPage extends StatefulWidget {
  final List rowValues;

  const EditProgramRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditProgramRowPage> createState() => _EditProgramRowPageState();
}

class _EditProgramRowPageState extends State<EditProgramRowPage> {

  final TextEditingController programNameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Assinging values
    programNameController.text = widget.rowValues[1];
    acronymController.text = widget.rowValues[2];
    departmentController.text = widget.rowValues[3];

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
                          controller: programNameController, 
                          label: "Program Name:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: acronymController, 
                          label: "Acronym:", 
                        ),
                
                        const SizedBox(height: 10,),
                
                        TextInput(
                          controller: departmentController, 
                          label: "Department:"
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