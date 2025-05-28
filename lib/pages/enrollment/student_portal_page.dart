import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/enrollment/payment_receipt_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentPortalPage extends StatefulWidget {
  const StudentPortalPage({super.key});

  @override
  State<StudentPortalPage> createState() => _StudentPortalPageState();
}

class _StudentPortalPageState extends State<StudentPortalPage> {
  late DatabaseProvider db;
  final _formKey = GlobalKey<FormState>(); // For input validation

  final studentNumberController = TextEditingController();
  final accessCodeController = TextEditingController();

  Future<void> _fetchExistingStudent() async {
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

    // Check if student exists
    final studentNumber = int.parse(studentNumberController.text);
    final studentExists = await db.initializeExistingStudent(studentNumber);

    if (studentExists) {
      try {
        await supabase.auth.signInWithPassword(
          email: db.student.email,
          password: accessCodeController.text,
        );
      } on AuthException {
        if (mounted) {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                isError: true,
                title: "Invalid Access Code",
                subtitle: "Please try again",
              );
            },
          );
        }
        return;
      }
      if (mounted) {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaymentReceiptPage()),
        );
      }
    } else {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Invalid Student No.",
              subtitle: "Student does not exist",
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    super.initState();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EnrollmentHeader(
                step1: true,
                step2: false,
                step3: false,
                step4: false,
                title: "Student Portal",
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    NumberInput(
                      controller: studentNumberController,
                      label: "Student Number:",
                      hint: "02000XXXXXX",
                      isRequired: true,
                      isEnable: true,
                      hasFormat: true,
                      invalidCheck: (input) {
                        RegExp studentNoPattern = RegExp(r'^02000[\d]{6}$');

                        if (studentNoPattern.hasMatch(input)) {
                          return false;
                        }
                        return true;
                      },
                      requiredMessage: "Please enter your student no.",
                      invalidMessage: "Please enter a valid student no.",
                    ),

                    const SizedBox(height: 10),

                    PasswordInput(
                      controller: accessCodeController,
                      label: "Access Code:",
                      hint: "Enter Access Code",
                      isRequired: true,
                      hasToolTip: true,
                      toolTipMessage: "SurnameYYYYMMDD",
                      altMessage: "Please enter your access code",
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: 10,
            ),
            child: BottomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _fetchExistingStudent();
                }
              },
              text: "Submit",
            ),
          ),
        ],
      ),
    );

    // Choosing the parent widget
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
