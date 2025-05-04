import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/password_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_box.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_option.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_admin_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SignInStudentPage extends StatelessWidget {
  SignInStudentPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        
              // Welcome message
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 8),
                child: Text(
                  "Welcome Back\nSTIer's!",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
        
              const SizedBox(height: 24),
        
              // Sign in box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SignInBox(
                  children: [
                    // Email text field
                    TextInput(
                      controller: emailController, 
                      label: "Email Address/Student No.:", 
                      hint: "Email Address or Student No.", 
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
                    
                    const SizedBox(height: 16),
                      
                    // Sign in button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => MainDashboard()));
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
              ),
              const SizedBox(height: 24),
        
              // Divider
              Divider(
                indent: 24,
                endIndent: 24,
              ),
        
              const SizedBox(height: 16),
        
              // Other pages
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
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
                      header: "A faculty member?",
                      linkText: "Admin Sign In",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInAdminPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
