import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_student_page.dart';
import 'package:sti_startnow/pages/welcome/components/button_filled.dart';
import 'package:sti_startnow/pages/welcome/components/button_outline.dart';
import 'package:sti_startnow/pages/welcome/components/page_indicator.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Image.asset(
                      "assets/img/welcome_img/register_img.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: AppTheme.colors.white,
                border: Border.all(
                  color: AppTheme.colors.gray,
                  width: 3.0
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35)
                )
              ),

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Helpful Tip",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // Text Description
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Register now and secure your spot.",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                      
                            const SizedBox(height: 10,),
                      
                            Text(
                              "Get started on your academic journey today!",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.black,
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // Page Indicator
                    PageIndicator(
                      index: 5,
                    ),

                    const SizedBox(height: 20,),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ButtonOutline(
                                text: "Sign In", 
                                onPressed: () {
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => SignInStudentPage())); 
                                }
                              ),

                              Text(
                                "For Existing Students",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.black,
                                  fontSize: 12
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          child: Column(
                            children: [
                              ButtonFilled(
                                text: "Enroll Now!", 
                                onPressed: () {
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => EnrollmentDashboard()));
                                }
                              ),

                              Text(
                                "For New Students",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.black,
                                  fontSize: 12
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}