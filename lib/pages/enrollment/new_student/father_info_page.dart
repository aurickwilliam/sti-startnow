import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/mother_info_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class FatherInfoPage extends StatefulWidget {
  const FatherInfoPage({super.key});

  @override
  State<FatherInfoPage> createState() => _FatherInfoPageState();
}

class _FatherInfoPageState extends State<FatherInfoPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleInitialController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    firstNameController.text = student.father.firstName ?? "";
    lastNameController.text = student.father.lastName ?? "";
    middleInitialController.text = student.father.middleInitial ?? "";
    suffixController.text = student.father.suffix ?? "";
    mobileNoController.text = student.father.mobileNumber ?? "";
    emailController.text = student.father.email ?? "";
    occupationController.text = student.father.occupation ?? "";

    super.initState();
  }

  void saveInput() {
    student.father.firstName = firstNameController.text;
    student.father.lastName = lastNameController.text;
    student.father.middleInitial = middleInitialController.text;
    student.father.suffix = suffixController.text;
    student.father.mobileNumber = mobileNoController.text;
    student.father.email = emailController.text;
    student.father.occupation = occupationController.text;
  }

  // Check if all required fields has value
  bool ifOtherInputHasValue() {
    bool hasFName = firstNameController.text.trim().isNotEmpty;
    bool hasLName = lastNameController.text.trim().isNotEmpty;
    bool hasMobileNo = mobileNoController.text.trim().isNotEmpty;
    bool hasEmail = emailController.text.trim().isNotEmpty;

    return hasFName || hasLName || hasMobileNo || hasEmail;
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
                        "Father's Information:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Leave it all blank if information is not available",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // First Name
                      TextInput(
                        controller: firstNameController,
                        label: "First Name:",
                        hint: "First Name",
                        isRequired: true,
                        requiredMessage:
                            "Please enter a information or put blank",
                        isParentGuardian: true,
                        ifOtherInputHasValue: ifOtherInputHasValue,
                      ),

                      const SizedBox(height: 10),

                      // Last Name
                      TextInput(
                        controller: lastNameController,
                        label: "Last Name:",
                        hint: "Last Name",
                        isRequired: true,
                        requiredMessage:
                            "Please enter a information or put blank",
                        isParentGuardian: true,
                        ifOtherInputHasValue: ifOtherInputHasValue,
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
                        requiredMessage:
                            "Please enter a mobile no. or put blank",
                        invalidMessage: "Please enter a valid mobile no.",
                        isParentGuardian: true,
                        ifOtherInputHasValue: ifOtherInputHasValue,
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
                        requiredMessage: "Please enter an email or put blank",
                        invalidMessage: "Please enter a valid email address",
                        isParentGuardian: true,
                        ifOtherInputHasValue: ifOtherInputHasValue,
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

                      const SizedBox(height: 50),

                      BackNextButton(
                        nextPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveInput();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MotherInfoPage(),
                              ),
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
