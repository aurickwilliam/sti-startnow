import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_date_picker.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/current_address_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({super.key});

  @override
  State<StudentInfoPage> createState() => _StudentInfoPageState();
}

class _StudentInfoPageState extends State<StudentInfoPage> {
  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController suffixNameController = TextEditingController();
  final TextEditingController citizenshipController = TextEditingController();
  final TextEditingController dateBirthController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController religionController = TextEditingController();

  final List<String> genderChoices = ["Male", "Female", "Others"];

  final List<String> civilStatusChoices = ["Single", "Married"];

  String genderValue = "";
  String civilStatusValue = "";

  bool genderEmpty = false;
  bool civilStatusEmpty = false;
  bool dateBirthEmpty = false;

  bool validate() {
    bool valid = _formKey.currentState!.validate();
    setState(() {
      if (genderValue.isEmpty) {
        genderEmpty = true;
      }

      if (civilStatusValue.isEmpty) {
        civilStatusEmpty = true;
      }

      if (dateBirthController.text.isEmpty) {
        dateBirthEmpty = true;
      }
    });

    if (genderEmpty || civilStatusEmpty || dateBirthEmpty) {
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
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                EnrollmentHeader(
                  step1: true,
                  step2: true,
                  step3: false,
                  step4: false,
                  title: "Personal Information",
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
                      Text(
                        "Student Information",
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

                      const SizedBox(height: 10),

                      // First Name
                      TextInput(
                        controller: firstNameController,
                        label: "First Name:",
                        hint: "Given Name",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Middle Name
                      TextInput(
                        controller: middleNameController,
                        label: "Middle Name:",
                        hint: "Middle Name",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Last Name
                      TextInput(
                        controller: lastNameController,
                        label: "Last Name:",
                        hint: "Last Name",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Suffix
                      TextInput(
                        controller: suffixNameController,
                        label: "Suffix Name:",
                        hint: "eg. Jr.",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Gender
                      CustomDropdownMenu(
                        listChoices: genderChoices,
                        label: "Gender:",
                        hint: "Gender",
                        isRequired: true,
                        selectedValue: genderValue,
                        onTap: (index) {
                          setState(() {
                            genderValue = genderChoices[index];
                            genderEmpty = false;
                          });
                        },
                        isError: genderEmpty,
                      ),

                      const SizedBox(height: 10),

                      // Civil Status
                      CustomDropdownMenu(
                        listChoices: civilStatusChoices,
                        label: "Civil Status:",
                        hint: "Civil Status",
                        isRequired: true,
                        selectedValue: civilStatusValue,
                        onTap: (index) {
                          setState(() {
                            civilStatusValue = civilStatusChoices[index];
                            civilStatusEmpty = false;
                          });
                        },
                        isError: civilStatusEmpty,
                      ),

                      const SizedBox(height: 10),

                      // Citizenship
                      TextInput(
                        controller: citizenshipController,
                        label: "Citizenship:",
                        hint: "Citizenship",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Date of Birth
                      CustomDatePicker(
                        controller: dateBirthController,
                        label: "Date of Birth:",
                        hint: "yyyy-mm-dd",
                        isRequired: true,
                        isError: dateBirthEmpty,
                        handleError: (value) {
                          dateBirthEmpty = value;
                        },
                      ),

                      const SizedBox(height: 10),

                      // Birthplace
                      TextInput(
                        controller: birthPlaceController,
                        label: "Birthplace:",
                        hint: "Birthplace",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Religion
                      TextInput(
                        controller: religionController,
                        label: "Religion:",
                        hint: "Religion",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 50),

                      BackNextButton(
                        nextPressed: () {
                          if (validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CurrentAddressPage(),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
