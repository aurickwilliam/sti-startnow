import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_box.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_option.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_admin_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInStudentPage extends StatefulWidget {
  const SignInStudentPage({super.key});

  @override
  State<SignInStudentPage> createState() => _SignInStudentPageState();
}

class _SignInStudentPageState extends State<SignInStudentPage> {
  late DatabaseProvider db;

  final _formKey = GlobalKey<FormState>();
  // For input validation
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool usedStudentNumber = false;
  bool usedSchoolEmail = false;

  Future<void> _handleStudentSignIn() async {
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

    // Check kung may internet before any interaction
    final isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Your Offline",
              subtitle: "No internet connection, reconnect\nand try again",
            );
          },
        );
      }
      return;
    }

    // Check if student exists
    final student = await db.findStudent(
      emailController.text,
      usedStudentNumber: usedStudentNumber,
      usedSchoolEmail: usedSchoolEmail,
    );

    if (student != null) {
      try {
        await supabase.auth.signInWithPassword(
          email: student['personal_email'],
          password: passwordController.text,
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

      await db.initializeExistingStudent(student['student_id']);
      await db.initializeCurrentEnroll();
      if (mounted) {
        Navigator.pop(context);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainDashboard()),
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
              title: "Something went wrong",
              subtitle: "Invalid login credentials",
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

    return Scaffold(
      backgroundColor: AppTheme.colors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppTheme.colors.gray,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/sign_in/one_sti_cover_img.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome message
                    Text(
                      "Welcome Back\nSTIer's!",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Sign in box
                    Form(
                      key: _formKey,
                      child: SignInBox(
                        children: [
                          // Email text field
                          TextInput(
                            controller: emailController,
                            label: "Email Address/Student No.:",
                            hint: "Email Address or Student No.",
                            isRequired: true,
                            isEnable: true,
                            hasFormat: true,
                            invalidCheck: (input) {
                              RegExp emailPattern = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );
                              RegExp studentNoPattern = RegExp(
                                r'^02000[\d]{6}$',
                              );

                              if (emailPattern.hasMatch(input)) {
                                usedStudentNumber = false;
                                if (input.contains("caloocan.sti.edu.ph")) {
                                  usedSchoolEmail = true;
                                } else {
                                  usedSchoolEmail = false;
                                }
                                return false;
                              } else if (studentNoPattern.hasMatch(input)) {
                                usedStudentNumber = true;
                                usedSchoolEmail = false;
                                return false;
                              } else {
                                return true;
                              }
                            },
                            requiredMessage:
                                "Please enter your email or student no.",
                            invalidMessage:
                                "Please enter a valid email or student no.",
                          ),

                          const SizedBox(height: 16),

                          // Password text field
                          PasswordInput(
                            controller: passwordController,
                            label: "Password:",
                            hint: "Password",
                            isRequired: true,
                            isEnable: true,
                          ),

                          const SizedBox(height: 16),

                          // Sign in button
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await _handleStudentSignIn();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.colors.primary,
                              minimumSize: Size(double.infinity, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Divider
                    Divider(),

                    const SizedBox(height: 16),

                    // Other pages
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SignInOption(
                          header: "New Student?",
                          linkText: "Enroll now",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const EnrollmentDashboard(),
                              ),
                            );
                          },
                        ),
                        SignInOption(
                          header: "A faculty member?",
                          linkText: "Admin Sign In",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInAdminPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
