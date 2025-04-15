import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_box.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_option.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_admin_page.dart';

class SignInStudentPage extends StatelessWidget {
  const SignInStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Empty grey container
            Container(color: Color(0xFFDADADA), height: 200),

            // Welcome message
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 8),
              child: Text(
                "Welcome Back\nSTIer's!",
                style: TextStyle(
                  color: Color(0xFF393939),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sign in box
            SignInBox(
              firstInputHeader: "Email Address/Student No.",
              firstInputHint: "Email Address",
            ),
            const SizedBox(height: 24),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(color: Color(0xFFF7C32E), thickness: 2),
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
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: SignInOption(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
