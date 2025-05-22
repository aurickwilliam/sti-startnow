import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/validate_details_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class NewSelectSectionPage extends StatefulWidget {
  const NewSelectSectionPage({super.key});

  @override
  State<NewSelectSectionPage> createState() => _NewSelectSectionPageState();
}

class _NewSelectSectionPageState extends State<NewSelectSectionPage> {
  late Student student;
  // Temporary values for list of section
  final List<String> listSection = ["CS401", "CS402"];

  // Values for the Column
  final List<String> columnNames = [
    "Subject Code",
    "Subject Name",
    "Units",
    "Time",
    "Day",
    "Room",
  ];

  // Temporary value for total units
  final double totalUnits = 23.0;

  // Temporay values for the Data Table
  final List<List> dataTableValues = [
    [
      "COSC1001",
      "Information Management",
      "3.00",
      "7:00AM - 9:00AM",
      "S",
      "512",
    ],
    [
      "COSC1001",
      "Information Management",
      "3.00",
      "7:00AM - 10:00AM",
      "W",
      "603",
    ],
    [
      "COSC1001",
      "Fundamentals of Mobile Programming",
      "3.00",
      "9:00AM - 11:00AM",
      "TH",
      "402",
    ],
    [
      "COSC1001",
      "Fundamentals of Mobile Programming",
      "3.00",
      "10:00AM - 1:00PM",
      "W",
      "603",
    ],
    [
      "COSC1001",
      "Human-Computer Interaction",
      "3.50",
      "7:00AM - 9:00AM",
      "TH",
      "402",
    ],
    [
      "COSC1001",
      "Human-Computer Interaction",
      "3.50",
      "11:30AM - 1:00PM",
      "TH",
      "601",
    ],
    ["COSC1001", "Ethics", "3.00", "7:00AM - 10:00AM", "F", "410"],
    [
      "COSC1001",
      "Design and Analysis of Algorithms",
      "3.00",
      "10:00AM - 1:00PM",
      "F",
      "402",
    ],
    [
      "COSC1001",
      "Computer Systems Architecture",
      "3.00",
      "9:00AM - 12:00PM",
      "S",
      "509",
    ],
    ["COSC1001", "Great Books", "3.00", "7:00AM - 10:00AM", "T", "P"],
    [
      "COSC1001",
      "Philippine Popular Culture",
      "3.00",
      "10:00AM - 1:00PM",
      "T",
      "402",
    ],
    [
      "COSC1001",
      "P.E./PATHFIT 4: Team Sports",
      "3.00",
      "1:00PM - 3:00PM",
      "TH",
      "COURT",
    ],
  ];

  String sectionValue = "";

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
        
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // student.enrollment.section = sectionValue;
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EnrollmentHeader(
                  step1: true,
                  step2: true,
                  step3: true,
                  step4: false,
                  title: "Section",
                ),
      
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select a Section",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
      
                          const SizedBox(height: 20),
      
                          CustomDropdownMenu(
                            listChoices: listSection,
                            label: "Available Sections:",
                            hint: "Select a section",
                            selectedValue: sectionValue,
                            onTap: (index) {
                              setState(() {
                                sectionValue = listSection[index];
                              });
                            },
                          ),
                        ],
                      ),
                    ),
      
                    const SizedBox(height: 30),
      
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              ),
                            ],
                          ),
      
                          Divider(height: 10),
      
                          CustomDataTable(
                            columnNames: columnNames,
                            dataTableValues: dataTableValues,
                          ),
                        ],
                      ),
                    ),
      
                    const SizedBox(height: 50),
      
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: BottomButton(
                        onPressed: () {
                          if (sectionValue.isEmpty) {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  isError: true,
                                  title: "Your Section",
                                  subtitle: "Please select your section",
                                );
                              },
                            );
                          } else {
                            student.enrollment.section = sectionValue;
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  submitFunc: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ValidateDetailsPage(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                        text: "Submit",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}