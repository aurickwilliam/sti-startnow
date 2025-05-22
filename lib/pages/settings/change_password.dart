import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/change_password_new.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header and text field
          Column(
            children: [
              // Change password header
              PageAppBar(title: "Change Password"),

              const SizedBox(height: 20),

              // Old password field
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: PasswordInput(
                  controller: oldPasswordController,
                  label: "Enter Old Password:",
                  hint: "Enter Old Password",
                  isRequired: true,
                  isEnable: true,
                ),
              ),
            ],
          ),

          // Submit button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: 10,
            ),
            child: BottomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordNew(),
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
