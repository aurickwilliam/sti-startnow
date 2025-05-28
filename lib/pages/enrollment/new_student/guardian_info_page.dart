import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/new_select_section_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class GuardianInfoPage extends StatefulWidget {
  const GuardianInfoPage({super.key});

  @override
  State<GuardianInfoPage> createState() => _GuardianInfoPageState();
}

class _GuardianInfoPageState extends State<GuardianInfoPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleInitialController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    firstNameController.text = student.guardian.firstName ?? "";
    lastNameController.text = student.guardian.lastName ?? "";
    middleInitialController.text = student.guardian.middleInitial ?? "";
    suffixController.text = student.guardian.suffix ?? "";
    mobileNoController.text = student.guardian.mobileNumber ?? "";
    emailController.text = student.guardian.email ?? "";
    occupationController.text = student.guardian.occupation ?? "";
    relationshipController.text = student.guardian.relationship ?? "";

    super.initState();
  }

  void saveInput() {
    student.guardian.firstName = firstNameController.text;
    student.guardian.lastName = lastNameController.text;
    student.guardian.middleInitial = middleInitialController.text;
    student.guardian.suffix = suffixController.text;
    student.guardian.mobileNumber = mobileNoController.text;
    student.guardian.email = emailController.text;
    student.guardian.occupation = occupationController.text;
    student.guardian.relationship = relationshipController.text;
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EnrollmentHeader(
                step1: true,
                step2: true,
                step3: false,
                step4: false,
                title: "Personal Information",
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Parent / Guardian Information",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Fill up the necessary information:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Guardian's Information:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // First Name
                      TextInput(
                        controller: firstNameController,
                        label: "First Name:",
                        hint: "First Name",
                        isRequired: true,
                        isEnable: true,
                        requiredMessage: "Please enter name",
                      ),

                      const SizedBox(height: 10),

                      // Last Name
                      TextInput(
                        controller: lastNameController,
                        label: "Last Name:",
                        hint: "Last Name",
                        isRequired: true,
                        isEnable: true,
                        requiredMessage: "Please enter name",
                      ),

                      const SizedBox(height: 10),

                      // Middle Initial
                      TextInput(
                        controller: middleInitialController,
                        label: "Middle Initial:",
                        hint: "Middle Initial",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Suffix
                      TextInput(
                        controller: suffixController,
                        label: "Suffix:",
                        hint: "eg. Jr.",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Mobile Number
                      NumberInput(
                        controller: mobileNoController,
                        label: "Mobile Number:",
                        hint: "09XXXXXXXXX",
                        isRequired: true,
                        isEnable: true,
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

                      const SizedBox(height: 10),

                      // Email
                      TextInput(
                        controller: emailController,
                        label: "Email Address:",
                        hint: "example@domain.com",
                        isEmail: true,
                        isRequired: true,
                        isEnable: true,
                        hasFormat: true,
                        invalidCheck: (input) {
                          RegExp emailPattern = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (emailPattern.hasMatch(input)) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        requiredMessage: "Please enter an email",
                        invalidMessage: "Please enter a valid email address",
                      ),

                      const SizedBox(height: 10),

                      // Occupation
                      TextInput(
                        controller: occupationController,
                        label: "Occupation:",
                        hint: "Occupation",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Relationship
                      TextInput(
                        controller: relationshipController,
                        label: "Relationship:",
                        hint: "Relationship",
                        isRequired: true,
                        isEnable: true,
                        requiredMessage: "Please enter a relationship",
                      ),

                      const SizedBox(height: 50),

                      BackNextButton(
                        nextPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveInput();
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return CustomBottomSheet(
                                  submitFunc: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const NewSelectSectionPage(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  isError: true,
                                  title: "Missing Information",
                                  subtitle:
                                      "Please input all the\nnecessary information",
                                );
                              },
                            );
                          }
                        },
                        backPressed: () {
                          saveInput();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
