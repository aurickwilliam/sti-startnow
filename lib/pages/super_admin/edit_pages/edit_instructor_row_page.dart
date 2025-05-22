import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditInstructorRowPage extends StatefulWidget {
  final List rowValues;

  const EditInstructorRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditInstructorRowPage> createState() => _EditInstructorRowPageState();
}

class _EditInstructorRowPageState extends State<EditInstructorRowPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Assinging values
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    departmentController.text = widget.rowValues[3];
    emailAddressController.text = widget.rowValues[4];

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            PageAppBar(
              title: "Edit Information"
            ),
        
            const SizedBox(height: 20,),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10
              ),
              child: Column(
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
                              
                  TextInput(
                    controller: departmentController, 
                    label: "Department:"
                  ),
                              
                  const SizedBox(height: 10,),
                      
                  TextInput(
                    controller: emailAddressController, 
                    label: "Email Address:"
                  ),
                              
                  const SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10
          ),
          child: Column(
            children: [
              BottomButton(
                onPressed: () {}, 
                text: "Save"
              ),

              const SizedBox(height: 10,),

              DeleteButton(
                onPressed: () {}, 
                text: "Delete"
              )
            ],
          ),
        )
      ],
    );

    // Parent Widget
    Widget parentWidget = isLandscape
      ? SingleChildScrollView(
        child: content,
      )
      : Container(
        child: content,
      );

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: parentWidget
      ),
    );
  }
}