import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/components/multiple_choice_card.dart';
import 'package:sti_startnow/pages/enrollment/irregular/checklist_page.dart';
import 'package:sti_startnow/pages/enrollment/student_portal_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class StudentStatusPage extends StatefulWidget {
  const StudentStatusPage({super.key});

  @override
  State<StudentStatusPage> createState() => _StudentStatusPageState();
}

class _StudentStatusPageState extends State<StudentStatusPage> {

  List<String> statusStudent = ["Regular", "Irregular"];
  String selectedStatus = "";

  void handleSelectedStatus(String value){
    setState(() {
      selectedStatus = value;
    });
  }

  void checkifHasInput(){
    if (selectedStatus == ""){
      print("Select a Status");
    }
    else {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context, 
        builder: (builder) {
          return CustomBottomSheet(
            submitFunc: () {
              handleNavigation();
            }
          );
        }
      );
    }
  }

  // Refactor kapag nandyan na ung DB
  // Remove the prop drilling
  void handleNavigation(){
    Widget destination = SizedBox.shrink();

    if (selectedStatus == statusStudent[0]){
      destination = StudentPortalPage(studentStatus: selectedStatus);
    }
    else if (selectedStatus == statusStudent[1]){
      destination = ChecklistPage(studentStatus: selectedStatus,);
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
  }

  @override
  Widget build(BuildContext context) {

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
                step2: false, 
                step3: false, 
                step4: false,
                title: "Student Status",
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24, 
                  vertical: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Caloocan Campus",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.gold,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    
                        const SizedBox(height: 10,),
                    
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: "Welcome back existing student!\n",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                )
                              ),
                              TextSpan(
                                text: "Based on your records, you are currently endorsed as:"
                              )
                            ]
                          )
                        ),
                    
                        const SizedBox(height: 20,),
                    
                        MultipleChoiceCard(
                          question: "What is your student status?", 
                          choices: statusStudent, 
                          selectedItem: selectedStatus, 
                          onChanged: handleSelectedStatus
                        )
                      ],
                    ),
              
                    
                  ],
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 200 : 24,
              vertical: isLandscape ? 10 : 0,
            ),
            child: BottomButton(
              onPressed: () {
                checkifHasInput();
              },
              text: "Next",
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