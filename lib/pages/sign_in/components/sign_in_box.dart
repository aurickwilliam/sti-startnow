import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/sign_in/components/sign_in_field.dart';

class SignInBox extends StatelessWidget {
  final String firstInputHeader;
  final String firstInputHint;

  const SignInBox({
    super.key,
    required this.firstInputHeader,
    required this.firstInputHint,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0.0, 1.0),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign in header
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 16),
              child: Text(
                "Sign In Now!",
                style: TextStyle(
                  color: Color(0xFF393939),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Email text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SignInField(
                header: firstInputHeader,
                hintText: firstInputHint,
              ),
            ),
            const SizedBox(height: 16),

            // Password text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SignInField(
                header: "Password",
                hintText: "Password",
                isPassword: true,
              ),
            ),
            const SizedBox(height: 16),

            // Sign in button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0B5793),
                  fixedSize: Size(400, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
