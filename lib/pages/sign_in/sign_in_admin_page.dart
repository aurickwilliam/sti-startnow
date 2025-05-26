import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_box.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_option.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_student_page.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_dashboard.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInAdminPage extends StatefulWidget {
  const SignInAdminPage({super.key});

  @override
  State<SignInAdminPage> createState() => _SignInAdminPageState();
}

class _SignInAdminPageState extends State<SignInAdminPage> {
  late DatabaseProvider db;
  late EnrolleeListProvider enroll;
  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleAdminSignIn() async {
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

    // Sign in user with email and password
    try {
      // Authentication response from supabase
      final authRes = await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = authRes.user!;

      // Database response from supabase about the user's role
      final roleRes = await supabase
          .from("USER_ROLES")
          .select('role')
          .eq('user_id', user.id);
      final role = roleRes[0]['role'];
      if (role != 'student') {
        await db.initializeAdmin(user.email!, role);
        await db.initializePrograms();
        if (role == 'super_admin') {
          await db.initializeInstructors();
          await db.initializeCourses();
        }

        if (role == 'admin') {
          await enroll.initializeEnrollees();
          await db.initializeLogs();
          enroll.setCurrentEnrollees();
        }
        if (mounted) {
          Navigator.pop(context);
          switch (role) {
            case 'super_admin':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuperAdminDashboard(),
                ),
              );
            case 'admin':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboard()),
              );
          }
        }
      } else {
        // Kapag student pala si user
        await supabase.auth.signOut();
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
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    enroll = context.read<EnrolleeListProvider>();
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
                      "Welcome Back\nAdmin!",
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
                            label: "Email Address:",
                            hint: "Email Address",
                            isRequired: true,
                            isEnable: true,
                            hasFormat: true,
                            invalidCheck: (input) {
                              RegExp emailPattern = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (emailPattern.hasMatch(input)) {
                                return false;
                              } else if (input == "MIS") {
                                return false;
                              } else {
                                return true;
                              }
                            },
                            requiredMessage: "Please enter your email",
                            invalidMessage: "Please enter a valid email",
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

                          const SizedBox(height: 20),

                          // Sign in button
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await _handleAdminSignIn();
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
                          header: "An existing student?",
                          linkText: "Sign In here",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInStudentPage(),
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
