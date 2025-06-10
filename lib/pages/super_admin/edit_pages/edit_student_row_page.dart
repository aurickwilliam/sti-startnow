import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  late final int studentNumber;
  late DatabaseProvider db;

  String programValue = "";
  List<String> listOfAcronyms = [];

  @override
  void initState() {
    studentNumber = int.parse(widget.rowValues[0]);
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    programValue = widget.rowValues[3];
    mobileController.text = widget.rowValues[4];
    super.initState();
    db = context.read<DatabaseProvider>();
    listOfAcronyms = db.getProgramAcronyms();
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      PageAppBar(title: "Edit Information"),

                      const SizedBox(height: 20),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLandscape ? 200 : 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInput(
                              controller: firstNameController,
                              label: "First Name:",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: lastNameController,
                              label: "Last Name:",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            CustomDropdownMenu(
                              listChoices: listOfAcronyms,
                              selectedValue: programValue,
                              label: "Program/Course:",
                              onTap: (index) {
                                setState(() {
                                  programValue = listOfAcronyms[index];
                                });
                              },
                            ),

                            const SizedBox(height: 10),

                            NumberInput(
                              controller: mobileController,
                              label: "Contact Number:",
                              hint: "09XXXXXXXXX",
                              isRequired: true,
                              hasFormat: true,
                              invalidCheck: (input) {
                                RegExp mobilePattern = RegExp(r'^09[\d]{9}$');

                                if (mobilePattern.hasMatch(input)) {
                                  return false;
                                } else {
                                  return true;
                                }
                              },
                              requiredMessage: "Please enter a mobile no.",
                              invalidMessage: "Please enter a valid mobile no.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    BottomButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context, 
                          builder: (context) {
                            return CustomBottomSheet(
                              subtitle: "Changing the information at the database.",
                              submitFunc: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Show circular progress indicator
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PopScope(
                                        canPop: false,
                                        child: Center(
                                          child: const CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  );

                                  await supabase
                                      .from("STUDENT")
                                      .update({
                                        'stud_fname': firstNameController.text,
                                        'stud_lname': lastNameController.text,
                                        'program_id': db.getAcronymID(programValue),
                                        'mobile': mobileController.text,
                                      })
                                      .eq('student_id', studentNumber);

                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            );
                          }
                        );
                      },
                      text: "Save",
                    ),

                    const SizedBox(height: 10),

                    DeleteButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CustomBottomSheet(
                              subtitle: "Permanently deleting a record.",
                              submitFunc: () async {
                                // Show circular progress indicator
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PopScope(
                                      canPop: false,
                                      child: Center(
                                        child: const CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                );

                                await supabase
                                    .from("STUDENT")
                                    .delete()
                                    .eq('student_id', studentNumber);

                                if (context.mounted) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            );
                          }
                        );
                      },
                      text: "Delete",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
