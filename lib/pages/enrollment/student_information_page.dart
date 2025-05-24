import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/irregular/select_year_level_page.dart';
import 'package:sti_startnow/pages/enrollment/regular/select_section_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentInformationPage extends StatefulWidget {
  final String studentStatus;

  const StudentInformationPage({super.key, required this.studentStatus});

  @override
  State<StudentInformationPage> createState() => _StudentInformationPageState();
}

class _StudentInformationPageState extends State<StudentInformationPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  // Fix Fields
  final TextEditingController studentNoController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController studentAcademicTypeController =
      TextEditingController();

  // Drop Downs
  String admissionTypeValue = "";
  String newYearLevelValue = "";
  String paymentLocationValue = "";
  String paymentTypeValue = "";

  // Text Input
  final TextEditingController referenceNoController = TextEditingController();

  // Number Input
  final TextEditingController amountPaidController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();

  // Temporary Data
  final String program = "BSCS";

  // Choices for Admission Type
  final List<String> admissionTypeList = [
    "Old Student",
    "Transferee",
    "Returnee",
  ];

  // Temporary Choices for New Year Level
  // Same choices sa tuition fee adivising
  final List<String> newYearLevel = ["1Y2", "2Y2", "3Y2", "4Y2"];

  // Choices for Paymnet location
  final List<String> paymentLocation = [
    "School",
    "GCash",
    "M Lhuillier",
    "Others",
  ];

  // Choices for payment type
  final List<String> paymentType = ["Cash", "Low Down", "Low Monthly"];

  // Pang check kung may napili na ba si user
  bool admissionTypeEmpty = false;
  bool newYearLevelEmpty = false;
  bool paymentLocationEmpty = false;
  bool paymentTypeEmpty = false;

  bool validate() {
    bool valid = _formKey.currentState!.validate();
    setState(() {
      if (admissionTypeValue.isEmpty) {
        admissionTypeEmpty = true;
      }

      if (newYearLevelValue.isEmpty) {
        newYearLevelEmpty = true;
      }

      if (paymentLocationValue.isEmpty) {
        paymentLocationEmpty = true;
      }

      if (paymentTypeValue.isEmpty) {
        paymentTypeEmpty = true;
      }
    });

    if (admissionTypeEmpty ||
        newYearLevelEmpty ||
        paymentLocationEmpty ||
        paymentTypeEmpty) {
      return false;
    }
    return valid;
  }

  void checkIfHasInput() {
    if (widget.studentStatus == "") {
      debugPrint("Select a Status");
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return CustomBottomSheet(
            submitFunc: () {
              handleNavigation();
            },
          );
        },
      );
    }
  }

  // Temporary
  // Remove Prop drilling
  void handleNavigation() {
    Widget destination = SizedBox.shrink();

    if (widget.studentStatus == "Regular") {
      destination = SelectSectionPage();
    } else if (widget.studentStatus == "Irregular") {
      destination = SelectYearLevelPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    admissionTypeValue = student.enrollment.admissionType ?? "";
    newYearLevelValue = student.enrollment.yearLevel ?? "";
    paymentLocationValue = student.enrollment.paymentLocation ?? "";
    paymentTypeValue = student.enrollment.paymentType ?? "";
    referenceNoController.text = student.enrollment.referenceNo ?? "";
    amountPaidController.text = student.enrollment.amountPaid ?? "";
    contactNoController.text = student.contactNo ?? "";

    studentNoController.text = student.studentNo!;
    studentNameController.text = student.fullName;
    super.initState();
  }

  void saveInput() {
    student.enrollment.admissionType = admissionTypeValue;
    student.enrollment.yearLevel = newYearLevelValue;
    student.enrollment.paymentLocation = paymentLocationValue;
    student.enrollment.paymentType = paymentTypeValue;
    student.enrollment.referenceNo = referenceNoController.text;
    student.enrollment.amountPaid = amountPaidController.text;
    student.contactNo = contactNoController.text;
  }

  @override
  Widget build(BuildContext context) {
    // Assinging of value to the textfield
    programController.text = program;
    studentAcademicTypeController.text = widget.studentStatus;

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          saveInput();
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EnrollmentHeader(
                  step1: true,
                  step2: true,
                  step3: true,
                  step4: false,
                  title: "Enrollment",
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
                          "Student Details:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // STUDENT NUMBER
                        TextInput(
                          controller: studentNoController,
                          label: "Student No:",
                          hint: "",
                          isRequired: false,
                          isEnable: false,
                        ),

                        const SizedBox(height: 10),

                        // STUDENT NAME
                        TextInput(
                          controller: studentNameController,
                          label: "Student Name:",
                          hint: "",
                          isRequired: false,
                          isEnable: false,
                        ),

                        const SizedBox(height: 10),

                        // STUDENT PROGRAM
                        TextInput(
                          controller: programController,
                          label: "Program:",
                          hint: "",
                          isRequired: false,
                          isEnable: false,
                        ),

                        const SizedBox(height: 10),

                        // STUDENT ACADEMIC TYPE
                        TextInput(
                          controller: studentAcademicTypeController,
                          label: "Student Academic Type:",
                          hint: "",
                          isRequired: false,
                          isEnable: false,
                        ),

                        const SizedBox(height: 10),

                        // STUDENT ADMISSION TYPE
                        CustomDropdownMenu(
                          listChoices: admissionTypeList,
                          label: "Admission Type:",
                          hint: "Select Student Type",
                          isRequired: true,
                          selectedValue: admissionTypeValue,
                          onTap: (index) {
                            setState(() {
                              admissionTypeValue = admissionTypeList[index];
                              admissionTypeEmpty = false;
                            });
                          },
                          isError: admissionTypeEmpty,
                        ),

                        const SizedBox(height: 10),

                        // STUDENT NEW LEVEL
                        CustomDropdownMenu(
                          listChoices: newYearLevel,
                          label: "Your New Level:",
                          hint: "Select New Level",
                          isRequired: true,
                          selectedValue: newYearLevelValue,
                          onTap: (index) {
                            setState(() {
                              newYearLevelValue = newYearLevel[index];
                              newYearLevelEmpty = false;
                            });
                          },
                          isError: newYearLevelEmpty,
                        ),

                        const SizedBox(height: 10),

                        // PAYMENT LOCATION
                        CustomDropdownMenu(
                          listChoices: paymentLocation,
                          label: "Payment Location:",
                          hint: "Select Payment Location",
                          isRequired: true,
                          selectedValue: paymentLocationValue,
                          onTap: (index) {
                            setState(() {
                              paymentLocationValue = paymentLocation[index];
                              paymentLocationEmpty = false;
                            });
                          },
                          isError: paymentLocationEmpty,
                        ),

                        const SizedBox(height: 10),

                        // PAYMENT TYPE
                        CustomDropdownMenu(
                          listChoices: paymentType,
                          label: "Payment Type:",
                          hint: "Select Payment Type",
                          isRequired: true,
                          selectedValue: paymentTypeValue,
                          onTap: (index) {
                            setState(() {
                              paymentTypeValue = paymentType[index];
                              paymentTypeEmpty = false;
                            });
                          },
                          isError: paymentTypeEmpty,
                        ),

                        const SizedBox(height: 10),

                        // REFERENCE NO.
                        TextInput(
                          controller: referenceNoController,
                          label: "Reference / OR. No.:",
                          hint: "Enter Reference / OR. No.",
                          isRequired: true,
                          isEnable: true,
                        ),

                        const SizedBox(height: 10),

                        // AMOUNT PAID
                        NumberInput(
                          controller: amountPaidController,
                          label: "Amount Paid:",
                          hint: "Enter Amount Paid",
                          isRequired: true,
                          isEnable: true,
                        ),

                        const SizedBox(height: 10),

                        NumberInput(
                          controller: contactNoController,
                          label: "Contact Number:",
                          hint: "Enter Contact Number",
                          isRequired: true,
                          isEnable: true,
                          hasFormat: true,
                          invalidCheck: (input) {
                            RegExp contactPattern = RegExp(r'^09[\d]{9}$');

                            if (contactPattern.hasMatch(input)) {
                              return false;
                            }
                            return true;
                          },
                          requiredMessage: "Please enter your contact no.",
                          invalidMessage: "Please enter a valid contact no.",
                        ),

                        const SizedBox(height: 100),

                        BottomButton(
                          onPressed: () {
                            if (validate()) {
                              saveInput();
                              checkIfHasInput();
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
                          text: "Submit",
                        ),
                      ],
                    ),
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
