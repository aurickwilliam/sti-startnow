import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  String? selectedItem = yearLevelList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageAppBar(
                  title: "Tuition Fee", 
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Year Level:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 5,),

                    DropdownMenu(
                      width: double.infinity,
                      enableSearch: false,
                      hintText: "Select a Year Level",
                      trailingIcon: Icon(Icons.unfold_more),
                      textStyle: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        fillColor: AppTheme.colors.black,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: AppTheme.colors.black),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        focusColor: AppTheme.colors.primary,
                      ),
                    
                      initialSelection: yearLevelList.first,
                      dropdownMenuEntries: yearLevelList.map((item) => DropdownMenuEntry(
                        value: item, 
                        label: item,
                        
                      )).toList(),
                      onSelected: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                    ),
                  ],
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
              ],
            ),
          ),
        )
      ),
    );
  }
}