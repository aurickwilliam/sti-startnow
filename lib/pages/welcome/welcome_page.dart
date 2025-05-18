import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/sign_in/sign_in_student_page.dart';
import 'package:sti_startnow/pages/welcome/components/button_filled.dart';
import 'package:sti_startnow/pages/welcome/components/button_outline.dart';
import 'package:sti_startnow/pages/welcome/components/individual_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController();

  bool isLastPage = false;
  int lastIndex = 5;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: PageView(
            controller: controller,

            onPageChanged: (value) {
              setState(() {
                isLastPage = (value == lastIndex - 1);
              });
              print(value);
            },

            children: [
              IndividualPage(
                image: "assets/img/sti_start_now_logo.png", 
                text: "Welcome to\nSTI StartNow!"
              ),

              IndividualPage(
                image: "assets/img/welcome_img/page2.png", 
                text: "Enroll in courses with ease."
              ),

              IndividualPage(
                image: "assets/img/welcome_img/page3.png", 
                text: "Simple, fast, and hassle-free enrollment."
              ),

              IndividualPage(
                image: "assets/img/welcome_img/page4.png", 
                text: "Manage your student profile effortlessly."
              ),

              IndividualPage(
                image: "assets/img/welcome_img/register_img.png", 
                text: "Register now and secure your spot."
              ),
            ],
          ),
        ),
      ),

      bottomSheet: SafeArea(
        child: isLastPage ?
          Container(
            color: AppTheme.colors.white,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
            ),
          )
          : Container(
          color: AppTheme.colors.white,
          height: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.jumpToPage(5);
                  }, 
                  child: Text(
                    "Skip",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
          
                SmoothPageIndicator(
                  controller: controller, 
                  count: lastIndex,
                  effect: ExpandingDotsEffect(
                    spacing: 10,
                    activeDotColor: AppTheme.colors.gold,
                    dotColor: AppTheme.colors.gray
                  ),
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index, 
                      duration: Duration(milliseconds: 500), 
                      curve: Curves.easeInOut
                    );
                  },
                ),
            
                TextButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500), 
                      curve: Curves.easeInOut
                    );
                  }, 
                  child: Text(
                    "Next",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}