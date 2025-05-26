import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditStudentRowPage extends StatefulWidget {
  final List rowValues;

  const EditStudentRowPage({super.key, required this.rowValues});

  @override
  State<EditStudentRowPage> createState() => _EditStudentRowPageState();
}

class _EditStudentRowPageState extends State<EditStudentRowPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  late final int studentNumber;
  late DatabaseProvider db;

  @override
  void initState() {
    studentNumber = int.parse(widget.rowValues[0]);
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    programController.text = widget.rowValues[3];
    mobileController.text = widget.rowValues[4];
    super.initState();
    db = context.read<DatabaseProvider>();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            PageAppBar(title: "Edit Information"),

            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isLandscape ? 200 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInput(
                    controller: firstNameController,
                    label: "First Name:",
                  ),

                  const SizedBox(height: 10),

                  TextInput(
                    controller: lastNameController,
                    label: "Last Name:",
                  ),

                  const SizedBox(height: 10),

                  TextInput(controller: programController, label: "Program:"),

                  const SizedBox(height: 10),

                  NumberInput(
                    controller: mobileController,
                    label: "Contact Number:",
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10,
          ),
          child: Column(
            children: [
              BottomButton(
                onPressed: () async {
                  await supabase
                      .from("STUDENT")
                      .update({
                        'stud_fname': firstNameController.text,
                        'stud_lname': lastNameController.text,
                        'program_id': db.getAcronymID(programController.text),
                        'mobile': mobileController.text,
                      })
                      .eq('student_id', studentNumber);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                text: "Save",
              ),

              const SizedBox(height: 10),

              DeleteButton(
                onPressed: () async {
                  await supabase
                      .from("STUDENT")
                      .delete()
                      .eq('student_id', studentNumber);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                text: "Delete",
              ),
            ],
          ),
        ),
      ],
    );

    // Choosing the parent widget
    Widget parentWidget =
        isLandscape
            ? SingleChildScrollView(child: content)
            : Container(child: content);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(child: parentWidget),
    );
  }
}
