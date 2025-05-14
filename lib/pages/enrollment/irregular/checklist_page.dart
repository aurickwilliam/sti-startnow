import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/student_portal_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ChecklistPage extends StatelessWidget {
  final String studentStatus;

  const ChecklistPage({
    super.key,
    required this.studentStatus,
  });

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
              step2: false, 
              step3: false, 
              step4: false, 
              title: "Checklist"
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24, 
                vertical: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Before Proceeding",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                    
                  const SizedBox(height: 10,),
                    
                  Text(
                    "Make sure that you already have your student checklist and that you have consulted to your program head before proceeding the enrollment.\n\nIf you don’t have student checklist yet, kindly request to the registrar/admission.",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: isLandscape ? 10 : 0
          ),
          child: BottomButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => StudentPortalPage(studentStatus: studentStatus)));
            }, 
            text: "Next"
          ),
        )
      ],
    );

    // Choosing the parent
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