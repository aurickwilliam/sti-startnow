import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});

  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController subjectUnitsController = TextEditingController();
  final TextEditingController subjectPrerequisitesController =
      TextEditingController();

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageAppBar(title: "Courses"),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLandscape ? 200 : 24,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Course",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextInput(
                              controller: subjectNameController,
                              label: "Course Name:",
                              hint: "Enter Course Name",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: subjectCodeController,
                              label: "Course Code:",
                              hint: "Enter Course Code",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            NumberInput(
                              controller: subjectUnitsController,
                              label: "Units:",
                              hint: "Enter Course Units",
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

              // 🔹 Fixed bottom button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: BottomButton(
                  onPressed: () async {
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

                      await supabase.from("SUBJECT").insert({
                        'course_code': subjectCodeController.text,
                        'course_name': subjectNameController.text,
                        'units': double.parse(subjectUnitsController.text),
                        'prereq':
                            subjectPrerequisitesController.text.isEmpty
                                ? null
                                : subjectPrerequisitesController.text,
                      });

                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }
                  },
                  text: "Add New Subject",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
