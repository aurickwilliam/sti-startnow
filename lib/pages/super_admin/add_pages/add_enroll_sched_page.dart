import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
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
              title: "Enroll Schedule"
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
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: isLandscape ? 10 : 0,
          ),
          child: BottomButton(
            onPressed: () {}, 
            text: "Add New Enroll Schedule"
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