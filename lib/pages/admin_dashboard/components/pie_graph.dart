import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PieGraph extends StatelessWidget {
  final List<List> dataList;

  const PieGraph({
    super.key,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        duration: const Duration(milliseconds: 750),
        PieChartData(
          centerSpaceRadius: 70,
          sections: [

            // NOT ENROLLED
            PieChartSectionData(
              value: dataList[0][0].toDouble(),
              title: "${dataList[0][1]}: ${dataList[0][0]}",
              color: AppTheme.colors.gray,
              showTitle: true,
              titleStyle: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // UNVERIFIED
            PieChartSectionData(
              value: dataList[1][0].toDouble(),
              title: "${dataList[1][1]}: ${dataList[1][0]}",
              color: AppTheme.colors.primary,
              showTitle: true,
              titleStyle: GoogleFonts.roboto(
                color: AppTheme.colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: AppTheme.colors.black, 
                    blurRadius: 2
                  )
                ]
              )
            ),

            // VERIFIED
            PieChartSectionData(
              value: dataList[2][0].toDouble(),
              title: "${dataList[2][1]}: ${dataList[2][0]}",
              color: AppTheme.colors.green,
              showTitle: true,
              titleStyle: GoogleFonts.roboto(
                color: AppTheme.colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: AppTheme.colors.black, 
                    blurRadius: 2
                  )
                ]
              )
            ),
            
            // REJECTED
            PieChartSectionData(
              value: dataList[3][0].toDouble(),
              title: "${dataList[3][1]}: ${dataList[3][0]}",
              color: AppTheme.colors.red,
              showTitle: true,
              titleStyle: GoogleFonts.roboto(
                color: AppTheme.colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: AppTheme.colors.black, 
                    blurRadius: 2
                  )
                ]
              )
            )
          ]
        )
      ),
    );
  }
}