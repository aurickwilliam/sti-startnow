import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/address.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/validate_tile.dart';
import 'package:sti_startnow/pages/enrollment/new_student/reservation_fee_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ValidateDetailsPage extends StatefulWidget {
  const ValidateDetailsPage({super.key});

  @override
  State<ValidateDetailsPage> createState() => _ValidateDetailsPageState();
}

class _ValidateDetailsPageState extends State<ValidateDetailsPage> {
  late Student student;
  // Temporary Data
  late List<List> schoolInformationList;
  late List<List> studentInformationList;
  late List<List> educationBGList;
  late List<List> parentInformationList;

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    super.initState();
  }

  String formatAddress(Address address) {
    String formattedAddress = "${address.streetNumber} ${address.street},";

    if (address.subdivision!.isNotEmpty) {
      formattedAddress += " ${address.subdivision},";
    }

    if (address.barangay!.isNotEmpty) {
      formattedAddress += " ${address.barangay},";
    }

    formattedAddress += " ${address.city}";

    if (address.province!.isNotEmpty) {
      formattedAddress += ", ${address.province}";
    }

    if (address.zipCode!.isNotEmpty) {
      formattedAddress += ", ${address.zipCode}";
    }

    return formattedAddress;
  }

  @override
  Widget build(BuildContext context) {
    schoolInformationList = [
      ["Campus:", "Caloocan"],
      ["Preferred Course:", student.course],
      ["Admit Type:", student.enrollment.admissionType],
      ["Yr Level/Grade Level:", student.enrollment.yearLevel],
      ["School Year:", student.enrollment.academicYear],
      ["Term:", student.enrollment.semester],
    ];

    studentInformationList = [
      ["First Name:", student.firstName],
      [
        "Middle Name:",
        student.middleName!.isEmpty ? "N/A" : student.middleName,
      ],
      ["Last Name:", student.lastName],
      [
        "Suffix Name:",
        student.suffixName!.isEmpty ? "N/A" : student.suffixName,
      ],
      [
        "Telephone Number:",
        student.telephone!.isEmpty ? "N/A" : student.telephone,
      ],
      ["Mobile Number:", student.contactNo],
      ["Current Address:", formatAddress(student.currentAddress)],
      ["Permanent Address:", formatAddress(student.permanentAddress)],
      ["Email Address:", student.email],
      ["Date of Birth:", student.dateOfBirth],
      ["Religion:", student.religion],
      ["Citizenship:", student.citizenship],
      ["Gender:", student.gender],
      ["Civil Status:", student.civilStatus],
    ];

    educationBGList = [
      [
        "Current or Last School Attended:",
        student.currentLastSchool.schoolName,
      ],
      [
        "Program/Track & Strand/Specialization:",
        student.currentLastSchool.program!.isEmpty
            ? "N/A"
            : student.currentLastSchool.program,
      ],
      [
        "Date of Graduation:",
        student.currentLastSchool.graduationDate!.isEmpty
            ? "N/A"
            : student.currentLastSchool.graduationDate,
      ],
      ["School Year:", student.currentLastSchool.schoolYear],
      ["Year/Grade:", student.currentLastSchool.yearLevel],
      [
        "Term:",
        student.currentLastSchool.term!.isEmpty
            ? "N/A"
            : student.currentLastSchool.term,
      ],
    ];

    // PLEASE REFACTOR THIS SHIT
    parentInformationList = [
      [
        "Father's Name / Contact#:",
        "${student.father.firstName == "N/A" || student.father.lastName == "N/A" ? "N/A" : "${student.father.firstName} ${student.father.lastName}"} / ${student.father.mobileNumber == "0" ? "N/A" : student.father.mobileNumber}",
      ],
      [
        "Mother's Name / Contact#:",
        "${student.mother.firstName == "N/A" || student.mother.lastName == "N/A" ? "N/A" : "${student.mother.firstName} ${student.mother.lastName}"} / ${student.mother.mobileNumber == "0" ? "N/A" : student.mother.mobileNumber}",
      ],
      [
        "Guardian's Name / Contact#:",
        "${student.guardian.firstName == "N/A" || student.guardian.lastName == "N/A" ? "N/A" : "${student.guardian.firstName} ${student.guardian.lastName}"} / ${student.guardian.mobileNumber == "0" ? "N/A" : student.guardian.mobileNumber}",
      ],
    ];
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
