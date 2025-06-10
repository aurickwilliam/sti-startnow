import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditProgramRowPage extends StatefulWidget {
  final List rowValues;

  const EditProgramRowPage({super.key, required this.rowValues});

  @override
  State<EditProgramRowPage> createState() => _EditProgramRowPageState();
}

class _EditProgramRowPageState extends State<EditProgramRowPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController programNameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();
  late final int id; // id ng program sa database
  
  String departmentValue = "";
  List<String> listOfDepartments = [
    "Information Technology",
    "Engineering",
    "Business & Management",
    "Hospitality Management",
    "Arts & Sciences",
    "Tourism Management",
  ];

  @override
  void initState() {
    programNameController.text = widget.rowValues[1];
    acronymController.text = widget.rowValues[2];
    departmentValue = widget.rowValues[3];
    id = int.parse(widget.rowValues[0]);
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextInput(
                                  controller: programNameController,
                                  label: "Program Name:",
                                  isRequired: true,
                                ),

                                const SizedBox(height: 10),

                                TextInput(
                                  controller: acronymController,
                                  label: "Acronym:",
                                  isRequired: true,
                                ),

                                const SizedBox(height: 10),

                                CustomDropdownMenu(
                                  listChoices: listOfDepartments, 
                                  selectedValue:departmentValue, 
                                  label: "Department:", 
                                  onTap: (index) {
                                    setState(() {
                                      departmentValue = listOfDepartments[index];
                                    });
                                  }
                                )
                              ],
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
                      // Edit button
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
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
                                      .from("PROGRAM")
                                      .update({
                                        'program_name': programNameController.text,
                                        'acronym': acronymController.text,
                                        'department': departmentValue,
                                      })
                                      .eq('id', id);

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

                                await supabase.from("PROGRAM").delete().eq('id', id);

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
