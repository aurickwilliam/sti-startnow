import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditInstructorRowPage extends StatefulWidget {
  final List rowValues;

  const EditInstructorRowPage({super.key, required this.rowValues});

  @override
  State<EditInstructorRowPage> createState() => _EditInstructorRowPageState();
}

class _EditInstructorRowPageState extends State<EditInstructorRowPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  late final int profID; // id ng instructor sa database
  @override
  void initState() {
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    departmentController.text = widget.rowValues[3];
    emailAddressController.text = widget.rowValues[4];
    profID = int.parse(widget.rowValues[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 20
                ),
                child: Column(
                  children: [
                    PageAppBar(title: "Edit Information"),

                    const SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
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

                          TextInput(
                            controller: departmentController,
                            label: "Department:",
                          ),

                          const SizedBox(height: 10),

                          TextInput(
                            controller: emailAddressController,
                            label: "Email Address:",
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
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
                          .from("PROFESSOR")
                          .update({
                            'prof_fname': firstNameController.text,
                            'prof_lname': lastNameController.text,
                            'department': departmentController.text,
                            'email': emailAddressController.text,
                          })
                          .eq('prof_id', profID);

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
                          .from("PROFESSOR")
                          .delete()
                          .eq('prof_id', profID);

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
        )
      ),
    );
  }
}
