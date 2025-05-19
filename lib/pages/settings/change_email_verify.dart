import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/settings/account_settings.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChangeEmailVerify extends StatelessWidget {
  ChangeEmailVerify({super.key});

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // content
    Widget content = Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header, instructions, and verify email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Change email header
              PageAppBar(title: "Change Email"),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Instructions header
                    Text(
                      "Verify New Email",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Instructions
                    Text(
                      "Enter the 6-Digit Code that will be sent to your new email for verification.",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Verification code field
                    NumberInput(
                      controller: codeController,
                      label: "Verification Code:",
                      hint: "XXXXXX",
                      isRequired: true,
                      isEnable: true,
                      hasFormat: true,
                      invalidCheck: (input) {
                        RegExp codePattern = RegExp(r'^\d{6}$');

                        if (codePattern.hasMatch(input)) {
                          return false;
                        }
                        return true;
                      },
                      requiredMessage: "Please enter the verification code",
                      invalidMessage: "Please enter the 6-digit code",
                    ),

                    const SizedBox(height: 10),

                    // Resend code
                    GestureDetector(
                      onTap: () {
                        codeController.clear();
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (builder) {
                            return CustomBottomSheet(
                              isError: true,
                              title: "Verification Code",
                              subtitle:
                                  "Please check your email for\nyour new verification code",
                            );
                          },
                        );
                      },
                      child: Text(
                        "Resend Code",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Submit button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: isLandscape ? 20 : 0,
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
              text: "Submit",
            ),
          ),
        ],
      ),
    );

    // Choosing the parent widget based on orientation
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
