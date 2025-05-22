import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangePasswordNew extends StatelessWidget {
  ChangePasswordNew({super.key});

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

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
          // Header and text fields
          Column(
            children: [
              // Change password header
              PageAppBar(title: "Change Password"),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // New password field
                    PasswordInput(
                      controller: newPasswordController,
                      label: "Enter New Password:",
                      hint: "Enter New Password",
                      isRequired: true,
                      isEnable: true,
                      isPasswordChange: true,
                      altMessage: "Please enter your new password",
                    ),

                    const SizedBox(height: 15),

                    // Re-type new password
                    PasswordInput(
                      controller: reTypePasswordController,
                      label: "Re-Type New Password:",
                      hint: "Re-Type New Password",
                      isRequired: true,
                      isEnable: true,
                      isRetype: true,
                      newPass: newPasswordController.text,
                      altMessage: "Please retype your new password",
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Change pass button
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
                    MaterialPageRoute(builder: (context) => AccountSettings()),
                  );
                }
              },
              text: "Change Password",
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
