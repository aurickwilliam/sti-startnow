import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/main_dashboard/enrollment_status_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentStatusCard extends StatelessWidget {
  final Student student;
  final String status;

  const EnrollmentStatusCard({
    super.key,
    required this.student,
    required this.status,
  });

  TextStyle getStatusColor() {
    switch (status) {
      case 'NOT ENROLLED':
        return GoogleFonts.roboto(color: AppTheme.colors.black);
      case 'UNVERIFIED':
        return GoogleFonts.roboto(color: AppTheme.colors.gold);
      case 'VERIFIED':
        return GoogleFonts.roboto(color: AppTheme.colors.green);
      case 'REJECTED':
        return GoogleFonts.roboto(color: AppTheme.colors.red);
    }
    return GoogleFonts.roboto(color: AppTheme.colors.gray);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enrollment Status:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => EnrollmentStatusPage(
                              student: student,
                              status: status,
                            ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.colors.primary,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name of the Student
                Text(
                  student.fullName,
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Student Number of the Student
                Text(
                  student.studentNo!,
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                  ),
                ),

                Divider(height: 10),

                // Term and Year
                status != 'NOT ENROLLED'
                    ? Text(
                      "${student.enrollment.yearLevel} ${student.enrollment.semester} SY. ${student.enrollment.academicYear}",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    : Container(),

                const SizedBox(height: 10),

                RichText(
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: "Status: "),

                      // Status Text
                      TextSpan(text: status, style: getStatusColor()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
