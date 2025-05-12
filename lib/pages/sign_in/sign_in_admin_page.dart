import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_box.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_option.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_student_page.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_dashboard.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SignInAdminPage extends StatefulWidget {
  const SignInAdminPage({super.key});

  @override
  State<SignInAdminPage> createState() => _SignInAdminPageState();
}

class _SignInAdminPageState extends State<SignInAdminPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void handleAdminNavigation(){
    String email = emailController.text;
    String password = passwordController.text;

    Widget destination = AdminDashboard();

    if (email == "MIS" && password == "admin123") {
      destination = SuperAdminDashboard();
    }

    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => destination));
  }

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;
    
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
                    image: AssetImage("assets/img/sign_in/one_sti_cover_img.jpg"),
                    fit: BoxFit.cover
                  )
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
                    SignInBox(
                      children: [
                        // Email text field
                        TextInput(
                          controller: emailController, 
                          label: "Email Address:", 
                          hint: "Email Address", 
                          isRequired: true, 
                          isEnable: true
                        ),
                    
                        const SizedBox(height: 16),
                          
                        // Password text field
                        PasswordInput(
                          controller: passwordController, 
                          label: "Password:", 
                          hint: "Password", 
                          isRequired: true, 
                          isEnable: true
                        ),
                        
                        const SizedBox(height: 20),
                          
                        // Sign in button
                        ElevatedButton(
                          onPressed: () {
                            handleAdminNavigation();
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
                              fontSize: 16
                            ),
                          ),
                        ),
                      ],
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
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => EnrollmentDashboard()));
                          },
                        ),
                        SignInOption(
                          header: "An existing student?",
                          linkText: "Sign In here",
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => SignInStudentPage()));
                          },
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 50,),
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
