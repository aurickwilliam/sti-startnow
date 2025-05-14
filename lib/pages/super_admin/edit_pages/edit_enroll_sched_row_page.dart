import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditEnrollSchedRowPage extends StatefulWidget {
  final List rowValues;

  const EditEnrollSchedRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditEnrollSchedRowPage> createState() => _EditEnrollSchedRowPageState();
}

class _EditEnrollSchedRowPageState extends State<EditEnrollSchedRowPage> {

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController schoolYearController = TextEditingController();
  final TextEditingController termController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    // Assinging values
    fromController.text = widget.rowValues[1];
    toController.text = widget.rowValues[2];
    schoolYearController.text = widget.rowValues[2];
    termController.text = widget.rowValues[2];

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
                horizontal:isLandscape ? 200 : 24,
                vertical: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInput(
                    controller: fromController, 
                    label: "From:", 
                  ),
                              
                  const SizedBox(height: 10,),
                              
                  TextInput(
                    controller: toController, 
                    label: "To:", 
                  ),
                              
                  const SizedBox(height: 10,),
                      
                  TextInput(
                    controller: schoolYearController, 
                    label: "School Year:", 
                  ),
                              
                  const SizedBox(height: 10,),
                      
                  TextInput(
                    controller: termController, 
                    label: "Term:", 
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
            vertical: isLandscape ? 10 : 0
          ),
          child: BottomButton(
            onPressed: () {}, 
            text: "Save"
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