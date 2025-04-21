import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_outline_button.dart';
import 'package:sti_startnow/pages/enrollment/completed_page.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/providers/subject_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class VerifySubjectsPage extends StatelessWidget {
  VerifySubjectsPage({super.key});

  // Values for the Column
  final List<String> columnNames = [
    "Subject Code",
    "Subject Name",
    "Units",
    "Time",
    "Day",
    "Room"
  ];

  // Temporay values for the Data Table
  final List<List> dataTableValues = [
    ["COSC1001", "Information Management", "3.00", "7:00AM - 9:00AM", "S", "512"],
    ["COSC1001", "Information Management", "3.00", "7:00AM - 10:00AM", "W", "603"],
    ["COSC1001", "Fundamentals of Mobile Programming", "3.00", "9:00AM - 11:00AM", "TH", "402"],
    ["COSC1001", "Fundamentals of Mobile Programming", "3.00", "10:00AM - 1:00PM", "W", "603"],
    ["COSC1001", "Human-Computer Interaction", "3.50", "7:00AM - 9:00AM", "TH", "402"],
    ["COSC1001", "Human-Computer Interaction", "3.50", "11:30AM - 1:00PM", "TH", "601"],
    ["COSC1001", "Ethics", "3.00", "7:00AM - 10:00AM", "F", "410"],
    ["COSC1001", "Design and Analysis of Algorithms", "3.00", "10:00AM - 1:00PM", "F", "402"],
    ["COSC1001", "Computer Systems Architecture", "3.00", "9:00AM - 12:00PM", "S", "509"],
    ["COSC1001", "Great Books", "3.00", "7:00AM - 10:00AM", "T", "P"],
    ["COSC1001", "Philippine Popular Culture", "3.00", "10:00AM - 1:00PM", "T", "402"],
    ["COSC1001", "P.E./PATHFIT 4: Team Sports", "3.00", "1:00PM - 3:00PM", "TH", "COURT"],
  ];

  @override
  Widget build(BuildContext context) {
    final subjectListProvider = Provider.of<SubjectListProvider>(context);
    final totalUnits = subjectListProvider.getTotalUnitsSelectedSubjects();

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            EnrollmentHeader(
              step1: true, 
              step2: true, 
              step3: true, 
              step4: false, 
              title: "Enrollment"
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Schedule:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Units: $totalUnits",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),

                    Divider(
                      height: 10,
                    ),

                    CustomDataTable(
                      columnNames: columnNames, 
                      dataTableValues: dataTableValues
                    ),

                    const SizedBox(height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomOutlineButton(
                          text: "Back", 
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          isFullWidth: false,
                        ),

                        BottomButton(
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => CompletedPage()));
                          }, 
                          text: "Submit",
                          isFullWidth: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}