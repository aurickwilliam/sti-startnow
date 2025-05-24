import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController termController = TextEditingController();
  final TextEditingController yearLevelController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageAppBar(
              title: "Students"
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add New Student",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 20,),
                  
                  TextInput(
                    controller: firstNameController, 
                    label: "First Name:", 
                    hint: "Enter First Name",
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  TextInput(
                    controller: lastNameController, 
                    label: "Last Name:",
                    hint: "Enter Last Name",
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  TextInput(
                    controller: programController, 
                    label: "Program:",
                    hint: "Enter Program Name",
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  TextInput(
                    controller: emailAddressController, 
                    label: "Email Address:",
                    hint: "example@domain.com",
                  ),

                  const SizedBox(height: 10,),
                  
                  TextInput(
                    controller: termController, 
                    label: "Term:",
                    hint: "Enter Current Term",
                  ),

                  const SizedBox(height: 10,),
                  
                  TextInput(
                    controller: yearLevelController, 
                    label: "Year Level:",
                    hint: "Enter Year Level",
                  ),

                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10
          ),
          child: BottomButton(
            onPressed: () {}, 
            text: "Add New Student"
          ),
        )
      ],
    );

    // Choosing the parent widget
    Widget parentWidget = isLandscape
      ? SingleChildScrollView(child: content,)
      : Container(child: content,);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: parentWidget
      ),
    );
  }
}