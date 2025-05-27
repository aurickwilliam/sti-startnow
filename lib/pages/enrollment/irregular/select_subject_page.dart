import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/enrollment/components/add_button_table.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/irregular/verify_subjects_page.dart';
import 'package:sti_startnow/providers/subject_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SelectSubjectPage extends StatefulWidget {

  const SelectSubjectPage({
    super.key,
  });

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {

  // Column Header
  List<String> headerList = [
    "#",
    "Subject Name",
    "Instructor",
    "Start Time",
    "End Time",
    "Day",
    "Section",
    "Room",
    "Add",
  ];

  // Temp Data
  List<List> subjectList = [
    ["1", "Information Management", "Serr Lorenz", "07:00AM", "10:00AM", "W", "CS401", "402"],
    ["2", "Information Management", "Serr Lorenz", "07:00AM", "10:00AM", "W", "CS401", "402"],
    ["3", "Information Management", "Serr Lorenz", "07:00AM", "10:00AM", "W", "CS401", "402"],
    ["4", "Information Management", "Serr Lorenz", "07:00AM", "10:00AM", "W", "CS401", "402"],
    
  ];

  @override
  void initState() {
    subjectList = subjectList.map((innerList) {
      innerList.add(
        AddButtonTable(
          onPressed: () {
            debugPrint("SHIBAL");
          },
        ),
      );

      return innerList;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Reference lang sa provider
    final subjectListProvider = Provider.of<SubjectListProvider>(context);

    // Get the list of subjects from the selected year
    final listOfSubjects = subjectListProvider.subjectsForSelectedYear;

    // If is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EnrollmentHeader(
                step1: true, 
                step2: true, 
                step3: true, 
                step4: false, 
                title: "Enrollment"
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24, 
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          
                        Expanded(
                          child: Text(
                            "Select a Subject/s:",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                          
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Count:",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                            
                                const SizedBox(width: 10,),
                            
                                Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.colors.white
                                  ),
                                  child: Text(
                                    subjectListProvider.allSelectedSubjects.length.toString(),
                                    style: GoogleFonts.roboto(
                                      color: AppTheme.colors.black,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                          
                      ],
                    ),

                    // Table
                    CustomDataTable(
                      columnNames: headerList, 
                      dataTableValues: subjectList
                    ),

                    const SizedBox(height: 30,),

                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => VerifySubjectsPage()));
                      }, 
                      text: "Submit"
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}