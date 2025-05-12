import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/custom_dropdown_menu.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/tuition_type_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class TuitionFeeCoursePage extends StatefulWidget {

  final int index;

  const TuitionFeeCoursePage({
    super.key,
    required this.index,
  });

  @override
  State<TuitionFeeCoursePage> createState() => _TuitionFeeCoursePageState();
}

class _TuitionFeeCoursePageState extends State<TuitionFeeCoursePage> {
  final List<String> courses = [
    "Computer Science",
    "Information Technology",
    "Computer Engineering",
    "Business Administration",
    "Accounting Information System",
    "Accountancy",
    "Hospitality Management",
    "Communication",
    "Multimedia Arts",
    "Tourism Management",
  ];

  static List<String> yearLevelList = [
    "1Y2",
    "2Y2",
    "3Y2",
    "4Y2",
  ];

  TextEditingController yearLevelController = TextEditingController();

  @override
  void initState(){
    super.initState();

    yearLevelController.addListener(handleYearLevelChange);
  }

  // Method when the user changes the dropdown
  // So it can change the card below
  void handleYearLevelChange(){
    print(yearLevelController.text);
  }

  @override
  void dispose(){
    yearLevelController.removeListener(handleYearLevelChange);
    yearLevelController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    yearLevelController.text = yearLevelList.first;

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Tuition Fee", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
                    
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 10,),

                    Container(
                      child: Text(
                        courses[widget.index],
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                              
                    const SizedBox(height: 10,),
                              
                    // Dropdown of Year Level 
                    CustomDropdownMenu(
                      listChoices: yearLevelList, 
                      controller: yearLevelController,
                      label: "Year Level:",
                      hint: "Select a Year Level",
                      initialValue: yearLevelList.first,
                      isRequired: false,
                      isEnable: true,
                    ),
                              
                    const SizedBox(height: 20,),
                              
                    Text(
                      "Units: 23",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                              
                    const SizedBox(height: 10,),
                              
                    TuitionTypeCard(),

                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}