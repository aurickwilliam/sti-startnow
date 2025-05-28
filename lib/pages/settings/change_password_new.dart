import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordNew extends StatefulWidget {
  const ChangePasswordNew({super.key});

  @override
  State<ChangePasswordNew> createState() => _ChangePasswordNewState();
}

class _ChangePasswordNewState extends State<ChangePasswordNew> {
  final _formKey = GlobalKey<FormState>();
  // For input validation
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController reTypePasswordController =
      TextEditingController();

  Future<void> _updatePassword() async {
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

    // Update user password
    try {
      await supabase.auth.updateUser(
        UserAttributes(password: newPasswordController.text),
      );
      // If successful, log out from other devices
      await supabase.auth.signOut(scope: SignOutScope.others);

      if (mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password updated successfully'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainDashboard()),
          (context) => false,
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
              title: "Something went wrong",
              subtitle: "Please try again",
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
                      retype: (input) {
                        return input == newPasswordController.text;
                      },
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _updatePassword();
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
