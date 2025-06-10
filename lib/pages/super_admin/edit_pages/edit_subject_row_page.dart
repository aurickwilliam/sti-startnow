import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/super_admin/list_pages/list_subjects_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditSubjectRowPage extends StatefulWidget {
  final List rowValues;

  const EditSubjectRowPage({super.key, required this.rowValues});

  @override
  State<EditSubjectRowPage> createState() => _EditSubjectRowPageState();
}

class _EditSubjectRowPageState extends State<EditSubjectRowPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController subjectUnitsController = TextEditingController();
  final TextEditingController subjectPrerequisitesController =
      TextEditingController();
  late final String originalCode; // original course code

  @override
  void initState() {
    originalCode = widget.rowValues[0];
    subjectCodeController.text = widget.rowValues[0];
    subjectNameController.text = widget.rowValues[1];
    subjectUnitsController.text = widget.rowValues[2];
    subjectPrerequisitesController.text =
        widget.rowValues[3] == '---' ? "" : widget.rowValues[3];
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
                      PageAppBar(
                        title: "Edit Information",
                        onPressed:
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListSubjectsPage(),
                              ),
                            ),
                      ),

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
                              controller: subjectNameController,
                              label: "Course Name:",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: subjectCodeController,
                              label: "Course Code:",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            NumberInput(
                              controller: subjectUnitsController,
                              label: "Units:",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: subjectPrerequisitesController,
                              label: "Course Prerequisites:",
                              hint: "Enter Course Prerequisites",
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
                        if (_formKey.currentState!.validate()) {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return CustomBottomSheet(
                                subtitle: "Changing the information at the database",
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
                                      .from("SUBJECT")
                                      .update({
                                        'course_code': subjectCodeController.text,
                                        'course_name': subjectNameController.text,
                                        'units': double.parse(
                                          subjectUnitsController.text,
                                        ),
                                        'prereq':
                                            subjectPrerequisitesController.text.isEmpty
                                                ? null
                                                : subjectPrerequisitesController.text,
                                      })
                                      .eq('course_code', originalCode);

                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ListSubjectsPage(),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          );         
                        }
                      },
                      text: "Save",
                    ),

                    const SizedBox(height: 10),

                    DeleteButton(
                      onPressed: () {
                         showModalBottomSheet(
                          isScrollControlled: true,
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
                                    .from("SUBJECT")
                                    .delete()
                                    .eq('course_code', originalCode);

                                if (context.mounted) {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ListSubjectsPage(),
                                    ),
                                  );
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
