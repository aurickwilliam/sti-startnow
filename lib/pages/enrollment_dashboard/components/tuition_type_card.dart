import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/providers/tuition_fee_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TuitionTypeCard extends StatefulWidget {
  const TuitionTypeCard({super.key});

  @override
  State<TuitionTypeCard> createState() => _TuitionTypeCardState();
}

class _TuitionTypeCardState extends State<TuitionTypeCard> {
  bool isCash = true;
  bool isLowDown = false;

  late TuitionFeeProvider tuition;
  List<List> tuitionList = [];

  void changeToCash(){
    tuition.changeSeletectedType("Cash");

    setState(() {
      isCash = true;
      isLowDown = false;
      tuitionList = tuition.tuitionType;
    });


    debugPrint(tuition.tuitionType.toString());
  }

  void changeToLowDown(){
    tuition.changeSeletectedType("Low Down");

    setState(() {
      isCash = false;
      isLowDown = true;
      tuitionList = tuition.tuitionType;
    });


    debugPrint(tuition.tuitionType.toString());
  }

  List<String> breakDownHeader = ["Description", "Amount"];

  List<String> paymentScheduleHeader = ["Payment Schedule", "Amount"];


  @override
  void initState() {
    tuition = context.read<TuitionFeeProvider>();

    debugPrint(tuition.tuitionType.toString());

    setState(() {
      tuitionList = tuition.tuitionType;
    });


    super.initState();
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
                  dataTableValues: tuition.breakDown
                ),

                const SizedBox(height: 20,),

                // For payment Schedule
                CustomDataTable(
                  columnNames: paymentScheduleHeader, 
                  dataTableValues: tuition.paymentSched
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
