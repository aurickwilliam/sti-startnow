import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/main_dashboard/components/category_button.dart';
import 'package:sti_startnow/pages/main_dashboard/components/subject_tile.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainSubjectsPage extends StatefulWidget {
  const MainSubjectsPage({super.key});

  @override
  State<MainSubjectsPage> createState() => _MainSubjectsPageState();
}

class _MainSubjectsPageState extends State<MainSubjectsPage> {

  bool isCurrentSelected = true;
  bool isCompletedSelected = false;

  // Call when Current button click
  void handleCurrentChange() {
    setState(() {
      isCurrentSelected = true;
      isCompletedSelected = false;

      selectedList = currentList;
    });
  }

  // Call when completed button click
  void handleCompletedChange() {
    setState(() {
      isCurrentSelected = false;
      isCompletedSelected = true;

      selectedList = completedList;
    });
  }

  // TEMPORARY DATA for the List of subjects
  final List<List> currentList = [
    ["Information Management", "COSC1001", "Lorenz Christopher Afan", "3.00"],
    ["Fundamanetals of Mobile Programming", "COSC1001", "Lorenz Christopher Afan", "3.00"],
    ["Design and Analysis of Algorithm", "COSC1001", "Lorenz Christopher Afan", "2.50"],
    ["Information Management", "COSC1001", "Lorenz Christopher Afan", "1.00"],
    ["Information Management", "COSC1001", "Lorenz Christopher Afan", "2.00"],
  ];

  final List<List> completedList = [
    ["Computer Programming 3", "COSC1001", "Lorenz Christopher Afan", "3.00"],
    ["Computer Programming 2", "COSC1001", "Cyber Celwin Popanes", "3.00"],
    ["Computer Programming 1", "COSC1001", "Cyber Celwin Popanes", "3.00"],
  ];

  late List<List> selectedList;

  @override
  void initState() {
    super.initState();
    selectedList = currentList;
  }

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            
            // App Bar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_rounded,
                        color: AppTheme.colors.gold,
                        size: 35,
                      ),
                      
                      const SizedBox(width: 10,),
                      
                      Text(
                        "Subjects",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                    
                Divider(
                  height: 10,
                  thickness: 3,
                )
              ],
            ),
                
            const SizedBox(height: 10,),
                
            // Categories button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24, 
              ),
              child: Row(
                children: [
                  CategoryButton(
                    text: "Current",
                    onPressed: handleCurrentChange,
                    isSelected: isCurrentSelected,
                  ),
                  
                  CategoryButton(
                    text: "Completed",
                    onPressed: handleCompletedChange,
                    isSelected: isCompletedSelected,
                  ),
                ],
              ),
            ),
                
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: selectedList.length,
                  itemBuilder: (context, index) {
                    return SubjectTile(
                      subjectName: selectedList[index][0],
                      subjectCode: selectedList[index][1],
                      subjectTeacher: selectedList[index][2],
                      noUnits: selectedList[index][3],
                    );
                  }
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}