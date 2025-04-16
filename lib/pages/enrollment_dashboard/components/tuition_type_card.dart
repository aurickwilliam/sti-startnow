import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TuitionTypeCard extends StatefulWidget {
  const TuitionTypeCard({super.key});

  @override
  State<TuitionTypeCard> createState() => _TuitionTypeCardState();
}

class _TuitionTypeCardState extends State<TuitionTypeCard> {
  bool isCash = true;
  bool isLowDown = false;
  bool isLowMonthly = false;

  void changeToCash(){
    setState(() {
      isCash = true;
      isLowDown = false;
      isLowMonthly = false;
    });
  }

  void changeToLowMonthly(){
    setState(() {
      isCash = false;
      isLowDown = false;
      isLowMonthly = true;
    });
  }

  void changeToLowDown(){
    setState(() {
      isCash = false;
      isLowDown = true;
      isLowMonthly = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                TextButton(
                  onPressed: changeToCash,
                  style: TextButton.styleFrom(
                    backgroundColor: isCash ? AppTheme.colors.primary : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Cash",
                    style: GoogleFonts.roboto(
                      color:
                          isCash
                              ? AppTheme.colors.white
                              : AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                TextButton(
                  onPressed: changeToLowDown,
                  style: TextButton.styleFrom(
                    backgroundColor: isLowDown ? AppTheme.colors.primary : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Low Down",
                    style: GoogleFonts.roboto(
                      color:
                          isLowDown
                              ? AppTheme.colors.white
                              : AppTheme.colors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                TextButton(
                  onPressed: changeToLowMonthly,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isLowMonthly ? AppTheme.colors.primary : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Low Monthly",
                    style: GoogleFonts.roboto(
                      color:
                          isLowMonthly
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tuition Fees",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "P 18,365.00",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Divider(color: AppTheme.colors.black, height: 10, thickness: 1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Other School Fees",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "P 7,286.00",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Divider(color: AppTheme.colors.black, height: 10, thickness: 1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Miscellaneous Fees",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "P 1,845.00",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Divider(color: AppTheme.colors.black, height: 10, thickness: 1),
              ],
            ),
          ),

          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Schedule:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1st Upon Enrollment",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      "P 18,365.00",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Divider(height: 10),
              ],
            ),
          ),

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                Text(
                  "P 27,496.00",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
