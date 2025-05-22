import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditSubjectRowPage extends StatefulWidget {
  final List rowValues;

  const EditSubjectRowPage({
    super.key,
    required this.rowValues,
  });

  @override
  State<EditSubjectRowPage> createState() => _EditSubjectRowPageState();
}

class _EditSubjectRowPageState extends State<EditSubjectRowPage> {

  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController subjectUnitsController = TextEditingController();
  final TextEditingController subjectYearController = TextEditingController();
  final TextEditingController subjectDepartmentController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    // Assinging values
    subjectNameController.text = widget.rowValues[1];
    subjectCodeController.text = widget.rowValues[2];
    subjectUnitsController.text = widget.rowValues[3];
    subjectYearController.text = widget.rowValues[4];
    subjectDepartmentController.text = widget.rowValues[5];

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
                    controller: subjectNameController, 
                    label: "Subject Name:", 
                  ),
                              
                  const SizedBox(height: 10,),
                              
                  TextInput(
                    controller: subjectCodeController, 
                    label: "Subject Code:", 
                  ),
                              
                  const SizedBox(height: 10,),
                              
                  NumberInput(
                    controller: subjectUnitsController, 
                    label: "Units:"
                  ),
                              
                  const SizedBox(height: 10,),
                              
                  TextInput(
                    controller: subjectYearController, 
                    label: "Subject Year:", 
                  ),
                              
                  const SizedBox(height: 10,),
                              
                  TextInput(
                    controller: subjectDepartmentController, 
                    label: "Subject Department:", 
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
            vertical: 10,
          ),
          child: BottomButton(
            onPressed: () {}, 
            text: "Save"
          ),
        )
      ],
    );

    // Choosing the parent widget
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