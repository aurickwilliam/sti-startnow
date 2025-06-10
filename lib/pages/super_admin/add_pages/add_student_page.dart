import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  late DatabaseProvider db;
  late SharedPreferences pref;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String programValue = "";
  List<String> programAcronyms = [];
  bool programEmpty = false;

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    programAcronyms = db.getProgramAcronyms();
    super.initState();
  }

  Future<void> addStudent() async {
    // Show circular progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(child: const CircularProgressIndicator()),
        );
      },
    );

    // Get ready for this abomination
    try {
      final studentPassword = "${lastNameController.text}12345";
      await supabase.auth.signUp(
        email: emailAddressController.text,
        password: studentPassword,
      );
    } on AuthException catch (error) {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Something went wrong",
              subtitle: error.message,
            );
          },
        );
      }
      return;
    }

    final user = supabase.auth.currentUser;
    await supabase.from('USER_ROLES').insert({
      'user_id': user!.id,
      'role': 'student',
    });

    final res = await supabase
        .from("STUDENT")
        .insert({
          'stud_fname': firstNameController.text,
          'stud_lname': lastNameController.text,
          'personal_email': emailAddressController.text,
          'program_id': db.getAcronymID(programValue),
          'mobile': mobileController.text,
        })
        .select('student_id');

    final studentNumber = res[0]['student_id'].toString();
    final schoolEmail =
        "${lastNameController.text.toLowerCase()}.${studentNumber.substring(4)}@caloocan.sti.edu.ph";

    await supabase
        .from("STUDENT")
        .update({'school_email': schoolEmail})
        .eq('student_id', int.parse(studentNumber));

    await supabase.auth.signOut();

    pref = await SharedPreferences.getInstance();
    final adminPassword = pref.getString('bad_code');

    await supabase.auth.signInWithPassword(
      email: db.admin.email,
      password: adminPassword!,
    );

    if (mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  bool validate() {
    bool valid = _formKey.currentState!.validate();
    setState(() {
      if (programValue.isEmpty) {
        programEmpty = true;
      }
    });

    if (programEmpty) {
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
                      PageAppBar(title: "Students"),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLandscape ? 200 : 24,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Student",
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
                              listChoices: programAcronyms,
                              selectedValue: programValue,
                              label: "Program/Course:",
                              hint: "Select a Program",
                              isRequired: true,
                              onTap: (index) {
                                setState(() {
                                  programValue = programAcronyms[index];
                                  programEmpty = false;
                                });
                              },
                              isError: programEmpty,
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

                            const SizedBox(height: 10),

                            NumberInput(
                              controller: mobileController,
                              label: "Contact Number:",
                              hint: "09XXXXXXXXX",
                              isRequired: true,
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
                            subtitle: "Adding a New Student.",
                            submitFunc: () async {
                              await addStudent();
                            },
                          );
                        }
                      );
                    }
                  },
                  text: "Add New Student",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
