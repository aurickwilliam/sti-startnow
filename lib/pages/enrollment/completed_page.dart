import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pdf/pre_assessment_api.dart';
import 'package:sti_startnow/pdf/save_and_open_pdf.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnrollmentHeader(
              step1: true, 
              step2: true, 
              step3: true, 
              step4: true, 
              title: "Completed"
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24, 
                vertical: 10
              ),
              child: Column(
                children: [
                  Text(
                    "You are now Registered!",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    
                  const SizedBox(height: 20,),
                    
                  CustomOutlineButton(
                    text: "Download Pre-Assessment Form", 
                    onPressed: () async {
                      // ipasa nalang sa parameter ung object nandoon lahat ng info about sa pre-assessment
                      final preAssessment = await PreAssessmentApi.generatePreAssessment();

                      // IF GUSTO IOPEN PAGTAPOS IDOWNLOAD
                      // SaveAndOpenPdf.openPdf(preAssessment);
                    }
                  ),
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10
          ),
          child: BottomButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => MainDashboard()));
            }, 
            text: "Next"
          ),
        )
      ],
    );

    // Choosing the parent widget
    Widget parentWidget = isLandscape
      ? SingleChildScrollView(
        child: content,
      )
      : Container(
        child: content,
      );

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: parentWidget
      ),
    );
  }
}