import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/year_level_tile.dart';
import 'package:sti_startnow/pages/enrollment/irregular/select_subject_page.dart';
import 'package:sti_startnow/pages/enrollment/irregular/verify_subjects_page.dart';
import 'package:sti_startnow/providers/subject_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SelectYearLevelPage extends StatefulWidget {
  const SelectYearLevelPage({super.key});

  @override
  State<SelectYearLevelPage> createState() => _SelectYearLevelState();
}

class _SelectYearLevelState extends State<SelectYearLevelPage> {

  List<String> yearLevel = [
    "1st Year",
    "2nd Year",
    "3rd Year",
    "4th Year",
  ];

  @override
  Widget build(BuildContext context) {

    // Reference lang sa provider
    final subjectListProvider = Provider.of<SubjectListProvider>(context);

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Year Level: ",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                  // Length of the list which hold all the selected subjects
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
                          
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: yearLevel.length,
                    itemBuilder: (context, index) {
                      return YearLevelTile(
                        year: yearLevel[index],
                        onTap: () {
                          // setState(() {
                          //   selectedYearLevel = yearLevel[index];
                          // });
                          subjectListProvider.changeSeletectedYear(index + 1);
                          
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (_) => SelectSubjectPage()));
                        },
                      );
                    },
                  ),
                      
                  const SizedBox(height: 30,),
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: isLandscape ? 10 : 0
          ),
          child: BottomButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => VerifySubjectsPage()));
              
              for (var sub in subjectListProvider.allSelectedSubjects) {
                print(sub.name);
              }
            }, 
            text: "Submit"
          ),
        )
      ],
    );

    // Choosing the parent widget
    Widget parentWidget = isLandscape
      ? SingleChildScrollView(
        child: content,
      )
      : Container(
        child: content,
      );

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: parentWidget
      ),
    );
  }
}