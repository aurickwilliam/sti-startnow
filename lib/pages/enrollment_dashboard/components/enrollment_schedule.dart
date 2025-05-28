import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentSchedule extends StatefulWidget {
  const EnrollmentSchedule({super.key});

  @override
  State<EnrollmentSchedule> createState() => _EnrollmentScheduleState();
}

class _EnrollmentScheduleState extends State<EnrollmentSchedule> {
  bool isRegular = true;
  bool isIrregular = false;

  String regularFrom = "05/29/25";
  String regularTo = "06/02/25";

  String irregularFrom = "05/29/25";
  String irregularTo = "05/31/25";

  void changeToRegular() {
    setState(() {
      isRegular = true;
      isIrregular = false;
    });
  }

  void changeToIrregular() {
    setState(() {
      isRegular = false;
      isIrregular = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        children: [
          // Buttons for switching from regular to irregular
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                // Regular
                TextButton(
                  onPressed: changeToRegular,
                  style: TextButton.styleFrom(
                    backgroundColor: isRegular ? AppTheme.colors.primary : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Regular",
                    style: GoogleFonts.roboto(
                      color:
                          isRegular
                              ? AppTheme.colors.white
                              : AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Irregular
                TextButton(
                  onPressed: changeToIrregular,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isIrregular ? AppTheme.colors.primary : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Irregular",
                    style: GoogleFonts.roboto(
                      color:
                          isIrregular
                              ? AppTheme.colors.white
                              : AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Start of Enrollment
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From To",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isRegular ? regularFrom : irregularFrom,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isRegular ? regularTo : irregularTo,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
