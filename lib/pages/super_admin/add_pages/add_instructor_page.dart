import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddInstructorPage extends StatefulWidget {
  const AddInstructorPage({super.key});

  @override
  State<AddInstructorPage> createState() => _AddInstructorPageState();
}

class _AddInstructorPageState extends State<AddInstructorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

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
                      PageAppBar(title: "Instructors"),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLandscape ? 200 : 24,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Instructor",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextInput(
                              controller: firstNameController,
                              label: "First Name:",
                              hint: "Enter First Name",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            TextInput(
                              controller: lastNameController,
                              label: "Last Name:",
                              hint: "Enter Last Name",
                              isRequired: true,
                            ),

                            const SizedBox(height: 10),

                            CustomDropdownMenu(
                              listChoices: listOfDepartments, 
                              selectedValue: departmentValue, 
                              label: "Department:", 
                              hint: "Enter Department Name",
                              isRequired: true,
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
                              hint: "example@domain.com",
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
                child: BottomButton(
                  onPressed: () {
                    if (validate()) {
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) {
                          return CustomBottomSheet(
                            subtitle: "Adding a New Instructor.",
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

                              await supabase.from("PROFESSOR").insert({
                                'prof_fname': firstNameController.text,
                                'prof_lname': lastNameController.text,
                                'department': departmentController.text,
                                'email': emailAddressController.text,
                              });

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
                  text: "Add New Instructor",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
