import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_outline_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ReservationFeePage extends StatelessWidget {
  const ReservationFeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            EnrollmentHeader(
              step1: true, 
              step2: true, 
              step3: true, 
              step4: true, 
              title: "Reservation Fee"
            ),

            const SizedBox(height: 10,),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                            ),
                                  
                            children: [
                              TextSpan(
                                text: "Pay the reservation fee online or over-the-counter thru our "
                              ),
                                  
                              TextSpan(
                                text: "Alternative Payment Partners.",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  textStyle: TextStyle(decoration: TextDecoration.underline),
                                  fontWeight: FontWeight.w500
                                )
                              ),
                                  
                              TextSpan(
                                text: "\n\nAttach the screenshot or a photo of your proof of payment below:",
                              )
                            ]
                          )
                        ),
                                  
                        const SizedBox(height: 30,),
                                  
                        CustomOutlineButton(
                          text: "Attach a Photo",
                          onPressed: () {},
                        )
                      ],
                    ),

                    BottomButton(
                      onPressed: () {}, 
                      text: "Submit Application"
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}