import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/change_email_new.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmail extends StatelessWidget {
  ChangeEmail({super.key});

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController passwordController = TextEditingController();

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
              // Change email header
              PageAppBar(title: "Change Email"),

              const SizedBox(height: 20),

              // Enter password field
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: PasswordInput(
                  controller: passwordController,
                  label: "Enter Password:",
                  hint: "Enter Password",
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
              vertical: isLandscape ? 10 : 0,
            ),
            child: BottomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangeEmailNew()),
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
