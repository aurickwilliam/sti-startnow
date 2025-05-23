import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/last_school_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    telephoneController.text = student.telephone ?? "";
    mobileController.text = student.contactNo ?? "";
    emailController.text = student.email ?? "";

    super.initState();
  }

  void saveInput() {
    student.telephone = telephoneController.text;
    student.contactNo = mobileController.text;
    student.email = emailController.text;
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
                        "Contact Details",
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
                            
                      // Telephone No
                      NumberInput(
                        controller: telephoneController,
                        label: "Telephone No.:",
                        hint: "",
                        isRequired: false,
                        isEnable: true,
                      ),
                            
                      const SizedBox(height: 10),
                            
                      // Mobile Phone No
                      NumberInput(
                        controller: mobileController,
                        label: "Mobile No.:",
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
                        requiredMessage: "Please enter your mobile no.",
                        invalidMessage: "Please enter a valid mobile no.",
                      ),
                            
                      const SizedBox(height: 10),
                            
                      TextInput(
                        controller: emailController,
                        label: "Email Address:",
                        hint: "example@domain.com",
                        isRequired: true,
                        isEnable: true,
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
                        requiredMessage: "Please enter your email address",
                        invalidMessage:
                            "Please enter a valid email address",
                      ),
                  
                      const SizedBox(height: 20),
                  
                      BackNextButton(
                        nextPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveInput();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LastSchoolPage(),
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
        )
      ),
    );
  }
}
