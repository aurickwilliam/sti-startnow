import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  late final int profID; // id ng instructor sa database

  String departmentValue = "";
  bool isDepartmentEmpty = false;
  List<String> listOfDepartments = [
    "Information Technology",
    "Engineering",
    "Business & Management",
    "Hospitality Management",
    "Arts & Sciences",
    "Tourism Management",
  ];

  bool validate() {
    bool valid = _formKey.currentState!.validate();
    setState(() {
      if (departmentValue.isEmpty) {
        isDepartmentEmpty = true;
      }
    });

    if (isDepartmentEmpty) {
      return false;
    }
    return valid;
  }

  @override
  void initState() {
    firstNameController.text = widget.rowValues[1];
    lastNameController.text = widget.rowValues[2];
    departmentValue = widget.rowValues[3];
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
                              listChoices: listOfDepartments, 
                              selectedValue: departmentValue, 
                              label: "Department:", 
                              onTap: (index) {
                                setState(() {
                                  departmentValue = listOfDepartments[index];
                                  isDepartmentEmpty = false;
                                });
                              },
                              isError: isDepartmentEmpty,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: emailAddressController,
                              label: "Email Address:",
                              isEmail: true,
                              isRequired: true,
                              hasFormat: true,
                              invalidCheck: (input) {
                                RegExp emailPattern = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );

                                if (emailPattern.hasMatch(input)) {
                                  return false;
                                }
                                return true;
                              },
                              requiredMessage: "Please enter an email address",
                              invalidMessage:
                                  "Please enter a valid email address",
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
                        if (validate()) {
                          showModalBottomSheet(
                            context: context, 
                            builder: (context) {
                              return CustomBottomSheet(
                                subtitle: "Changing the information at the database.",
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
                                      .from("PROFESSOR")
                                      .update({
                                        'prof_fname': firstNameController.text,
                                        'prof_lname': lastNameController.text,
                                        'department': departmentValue,
                                        'email': emailAddressController.text,
                                      })
                                      .eq('prof_id', profID);

                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                },
                              );
                            }
                          );
                        }
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
                                    .from("PROFESSOR")
                                    .delete()
                                    .eq('prof_id', profID);

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
