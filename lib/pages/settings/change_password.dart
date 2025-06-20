import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/settings/change_password_new.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  // For input validation
  final TextEditingController oldPasswordController = TextEditingController();

  Future<void> _checkOldPassword() async {
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

    // Check if old password entered is correct
    try {
      final email = supabase.auth.currentSession!.user.email;
      await supabase.auth.signInWithPassword(
        email: email,
        password: oldPasswordController.text,
      );

      if (mounted) {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChangePasswordNew()),
        );
      }
    } on AuthException {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Invalid Password",
              subtitle:
                  "The password you entered does\nnot match your current password",
            );
          },
        );
      }
    }
  }

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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _checkOldPassword();
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
