import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/validate_tile.dart';
import 'package:sti_startnow/pages/enrollment/new_student/reservation_fee_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ValidateDetailsPage extends StatefulWidget {
  const ValidateDetailsPage({super.key});

  @override
  State<ValidateDetailsPage> createState() => _ValidateDetailsPageState();
}

class _ValidateDetailsPageState extends State<ValidateDetailsPage> {
  // Temporary Data
  final List<List> schoolInformationList = [
    ["Campus:", "Caloocan"],
    ["Preferred Course:", "BSCS"],
    ["Admit Type:", "New Student"],
    ["Yr Level/Grade Level:", "1st Year"],
    ["School Year:", "2025-2026"],
    ["Term:", "1st Term"],
  ];

  final List<List> studentInformationList = [
    ["First Name:", "John"],
    ["Middle Name:", "Donaldson"],
    ["Last Name:", "Doe"],
    ["Suffix Name:", "N/A"],
    ["Telephone Number:", "2935544"],
    ["Mobile Number:", "09123456789"],
    ["Current Address:", "Samson St. STI Caloocan"],
    ["Permanent Address:", "Caimito Rd. Kadiliman"],
    ["Email Address:", "johndoe@yahoo.com"],
    ["Date of Birth:", "mm/dd/yy"],
    ["Religion:", "Atheist"],
    ["Citizenship:", "Canadian"],
    ["Gender:", "Cismale"],
    ["Civil Status:", "Widow"],
  ];

  final List<List> educationBGList = [
    ["Current or Last School Attended:", "Stanford University"],
    ["Program/Track & Strand/Specialization:", "Political Science"],
    ["Date of Graduation:", "N/A"],
    ["School Year:", "2024-2025"],
    ["Year/Grade:", "Grade 13"],
    ["Term:", "3rd Term"],
  ];

  final List<List> parentInformationList = [
    ["Father's Name / Contact#:", "Steve Jobs / 09123456789"],
    ["Mother's Name / Contact#:", "Mary Jane / 09123456789"],
    ["Guardian's Name / Contact#:", "Vicenzo Cassano / 09123456789"],
  ];

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
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
                title: "Validate Details",
              ),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Application Details as follows:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ExpansionTile contents
                    // School Information
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          // School Information
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  "School Information",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: AppTheme.colors.white,

                                children: List.generate(
                                  schoolInformationList.length,
                                  (index) {
                                    return ValidateTile(
                                      label: schoolInformationList[index][0],
                                      data: schoolInformationList[index][1],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Divider(),

                          // Student Information
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  "Student Information",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: AppTheme.colors.white,

                                children: List.generate(
                                  studentInformationList.length,
                                  (index) {
                                    return ValidateTile(
                                      label: studentInformationList[index][0],
                                      data: studentInformationList[index][1],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Divider(),

                          // Educational Background
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  "Educational Background",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: AppTheme.colors.white,

                                children: List.generate(
                                  educationBGList.length,
                                  (index) {
                                    return ValidateTile(
                                      label: educationBGList[index][0],
                                      data: educationBGList[index][1],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Divider(),

                          // Parent / Guardian's Information
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  "Parent/Guardian's Information",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: AppTheme.colors.white,

                                children: List.generate(
                                  parentInformationList.length,
                                  (index) {
                                    return ValidateTile(
                                      label: parentInformationList[index][0],
                                      data: parentInformationList[index][1],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    BackNextButton(
                      nextPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (builder) {
                            return CustomBottomSheet(
                              submitFunc: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReservationFeePage(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
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
