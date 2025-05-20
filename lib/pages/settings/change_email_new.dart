import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/settings/change_email_verify.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmailNew extends StatelessWidget {
  ChangeEmailNew({super.key});

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Content inside
    Widget content = Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header and text field
          Column(
            children: [
              // Change email header
              PageAppBar(title: "Change Email"),

              const SizedBox(height: 20),

              // New email field
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: TextInput(
                  controller: newEmailController,
                  label: "Enter New Email:",
                  hint: "Enter New Email",
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
                  requiredMessage: "Please enter your new email address",
                  invalidMessage: "Please enter a valid email address",
                ),
              ),
            ],
          ),

          // Submit button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: isLandscape ? 10 : 0,
            ),
            child: BottomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeEmailVerify(),
                    ),
                  );
                }
              },
              text: "Submit",
            ),
          ),
        ],
      ),
    );

    // Choosing parent widget based on orientation
    Widget parentWidget =
        isLandscape
            ? SingleChildScrollView(child: content)
            : Container(child: content);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(child: parentWidget),
    );
  }
}
