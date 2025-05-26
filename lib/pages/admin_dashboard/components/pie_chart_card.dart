import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/indicator_value.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/pie_graph.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PieChartCard extends StatefulWidget {
  const PieChartCard({super.key});

  @override
  State<PieChartCard> createState() => _PieChartCardState();
}

class _PieChartCardState extends State<PieChartCard> {
  late EnrolleeListProvider enroll;
  late final List<List> noEnrolless;

  @override
  void initState() {
    enroll = context.read<EnrolleeListProvider>();

    noEnrolless = [
      [enroll.notEnrolledList.length, "Not Enrolled"],
      [enroll.unverifiedList.length, "Unverified"],
      [enroll.verifiedList.length, "Verified"],
      [enroll.rejectedList.length, "Rejected"],
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
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
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Enrollees Graph:",
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: PieGraph(
                dataList: noEnrolless,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: [
                  IndicatorValue(
                    color: AppTheme.colors.gray, 
                    label: "Not Enrolled"
                  ),
              
                  IndicatorValue(
                    color: AppTheme.colors.primary, 
                    label: "Unverified"
                  ),
              
                  IndicatorValue(
                    color: AppTheme.colors.green, 
                    label: "Verified"
                  ),
              
                  IndicatorValue(
                    color: AppTheme.colors.red, 
                    label: "Rejected"
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}