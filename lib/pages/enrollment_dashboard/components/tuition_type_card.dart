import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
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

  List<String> breakDownHeader = ["Description", "Amount"];

  // example
  List<List> breakDownData = [
    ["Tuition Fees", "10000"],
    ["Miscellaneous Fees", "5000"],
    ["Other School Fees", "5000"],
    [
      Text(
        "Total:",
        style: GoogleFonts.roboto(
          color: AppTheme.colors.primary,
          fontWeight: FontWeight.bold
        ),
      ), 
      Text(
        "35000",
        style: GoogleFonts.roboto(
          color: AppTheme.colors.primary,
          fontWeight: FontWeight.bold
        ),
      ), 
    ],
  ];

  List<String> paymentScheduleHeader = ["Payment Schedule", "Amount"];

  List<List> paymentScheduleData = [
    ["1st: Upon Enrollment", "7877"],
    ["2nd: Prelims", "7877"],
    ["3rd: Midterms", "7877"],
    ["4th: Prefinals", "7877"],
    ["5th: Finals", "7877"],
    [
      Text(
        "Total:",
        style: GoogleFonts.roboto(
          color: AppTheme.colors.primary,
          fontWeight: FontWeight.bold
        ),
      ), 
      Text(
        "36000",
        style: GoogleFonts.roboto(
          color: AppTheme.colors.primary,
          fontWeight: FontWeight.bold
        ),
      ), 
    ],
  ];

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
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // For break down of tuition
                CustomDataTable(
                  columnNames: breakDownHeader,
                  dataTableValues: breakDownData
                ),

                const SizedBox(height: 20,),

                // For payment Schedule
                CustomDataTable(
                  columnNames: paymentScheduleHeader, 
                  dataTableValues: paymentScheduleData
                ),

                const SizedBox(height: 20,),
              ],
            )
          ),
        ],
      ),
    );
  }
}
