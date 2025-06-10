import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddProgramPage extends StatefulWidget {
  const AddProgramPage({super.key});

  @override
  State<AddProgramPage> createState() => _AddProgramPageState();
}

class _AddProgramPageState extends State<AddProgramPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController programNameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();

  String departmentValue = "";
  List<String> listOfDepartments = [
    "Information Technology",
    "Engineering",
    "Business & Management",
    "Hospitality Management",
    "Arts & Sciences",
    "Tourism Management",
  ];
  bool isDepartmentEmpty = false;

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
                      PageAppBar(title: "Programs"),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLandscape ? 200 : 24,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Program",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextInput(
                              controller: programNameController,
                              label: "Program Name:",
                              hint: "Enter Program Name",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: acronymController,
                              label: "Acronym:",
                              hint: "Enter Program Acronym",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            CustomDropdownMenu(
                              listChoices: listOfDepartments, 
                              selectedValue: departmentValue, 
                              label: "Department:", 
                              hint: "Enter Program Department",
                              isRequired: true,
                              onTap: (index) {
                                setState(() {
                                  departmentValue = listOfDepartments[index];
                                  isDepartmentEmpty = false;
                                });
                              },
                              isError: isDepartmentEmpty,
                            )
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
                child: BottomButton(
                  onPressed: () async {
                    if (validate()) {
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

                      await supabase.from("PROGRAM").insert({
                        'program_name': programNameController.text,
                        'acronym': acronymController.text,
                        'department': departmentValue,
                      });

                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }
                  },
                  text: "Add New Program",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
