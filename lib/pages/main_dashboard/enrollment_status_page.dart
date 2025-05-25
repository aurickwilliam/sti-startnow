import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentStatusPage extends StatefulWidget {
  final Student student;

  const EnrollmentStatusPage({super.key, required this.student});

  @override
  State<EnrollmentStatusPage> createState() => _EnrollmentStatusPageState();
}

class _EnrollmentStatusPageState extends State<EnrollmentStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageAppBar(title: "Enrollment Status"),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Information:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    InformationTile(
                      label: "Name:",
                      data: widget.student.fullName,
                    ),

                    const SizedBox(height: 10),

                    InformationTile(
                      label: "Student No.:",
                      data: widget.student.studentNo!,
                    ),

                    const SizedBox(height: 10),

                    InformationTile(
                      label: "Term and Year:",
                      data:
                          "${widget.student.enrollment.yearLevel} ${widget.student.enrollment.semester} SY. ${widget.student.enrollment.academicYear}",
                    ),

                    Divider(height: 30),

                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "Status: "),

                          // Status Text
                          TextSpan(
                            // Temporary
                            text: "PENDING",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.gold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    BottomButton(onPressed: () {}, text: "Re-Take Enrollment"),
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
