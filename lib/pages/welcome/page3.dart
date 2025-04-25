import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/welcome/components/button_filled.dart';
import 'package:sti_startnow/pages/welcome/components/button_outline.dart';
import 'package:sti_startnow/pages/welcome/components/page_indicator.dart';
import 'package:sti_startnow/pages/welcome/page4.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
                      "assets/img/welcome_img/page3.png",
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

                    const SizedBox(height: 20,),

                    // Text Description
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Simple, fast, and hassle-free enrollment.",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    // Page Indicator
                    PageIndicator(
                      index: 3,
                    ),

                    const SizedBox(height: 20,),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ButtonOutline(
                            text: "Back", 
                            onPressed: () {
                              Navigator.pop(context);
                            }
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          child: ButtonFilled(
                            text: "Next", 
                            onPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => Page4()));
                            }
                          )
                        )
                      ],
                    )
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