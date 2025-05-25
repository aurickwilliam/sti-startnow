import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
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

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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

            const SizedBox(height: 20),

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
                  ),

                  const SizedBox(height: 10),

                  TextInput(
                    controller: subjectCodeController,
                    label: "Course Code:",
                  ),

                  const SizedBox(height: 10),

                  NumberInput(
                    controller: subjectUnitsController,
                    label: "Units:",
                  ),

                  const SizedBox(height: 10),

                  TextInput(
                    controller: subjectPrerequisitesController,
                    label: "Course Prerequisites:",
                    hint: "Enter Course Prerequisites",
                  ),

                  const SizedBox(height: 10),
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
                      .from("SUBJECT")
                      .update({
                        'course_code': subjectCodeController.text,
                        'course_name': subjectNameController.text,
                        'units': double.parse(subjectUnitsController.text),
                        'prereq':
                            subjectPrerequisitesController.text.isEmpty
                                ? null
                                : subjectPrerequisitesController.text,
                      })
                      .eq('course_code', originalCode);

                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListSubjectsPage(),
                      ),
                    );
                  }
                },
                text: "Save",
              ),

              const SizedBox(height: 10),

              DeleteButton(
                onPressed: () async {
                  await supabase
                      .from("SUBJECT")
                      .delete()
                      .eq('course_code', originalCode);

                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListSubjectsPage(),
                      ),
                    );
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
