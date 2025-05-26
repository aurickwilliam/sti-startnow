import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AddInstructorPage extends StatefulWidget {
  const AddInstructorPage({super.key});

  @override
  State<AddInstructorPage> createState() => _AddInstructorPageState();
}

class _AddInstructorPageState extends State<AddInstructorPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 20
                ),
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
                          ),

                          const SizedBox(height: 10),

                          TextInput(
                            controller: lastNameController,
                            label: "Last Name:",
                            hint: "Enter Last Name",
                          ),

                          const SizedBox(height: 10),

                          TextInput(
                            controller: departmentController,
                            label: "Department:",
                            hint: "Enter Department Name",
                          ),

                          const SizedBox(height: 10),

                          TextInput(
                            controller: emailAddressController,
                            label: "Email Address:",
                            hint: "example@domain.com",
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: BottomButton(
                onPressed: () async {
                  await supabase.from("PROFESSOR").upsert({
                    'prof_fname': firstNameController.text,
                    'prof_lname': lastNameController.text,
                    'department': departmentController.text,
                    'email': emailAddressController.text,
                  });

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                text: "Add New Instructor",
              ),
            ),
          ],
        )
      ),
    );
  }
}
