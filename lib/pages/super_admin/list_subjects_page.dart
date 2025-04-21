import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListSubjectsPage extends StatefulWidget {
  const ListSubjectsPage({super.key});

  @override
  State<ListSubjectsPage> createState() => _ListSubjectsPageState();
}

class _ListSubjectsPageState extends State<ListSubjectsPage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "Name",
    "Subject Code",
    "Units",
    "Year",
    "Department",
    "Description",
  ];

  // Temporary Values for the table
  List<List> values = [
    ["1", "Information Management", "COSC1001", "3.00", "2nd Year", "Information Technology", "..."],
    ["2", "Fundamental of Mobile Programming", "COSC1001", "3.00", "2nd Year", "Information Technology", "..."],
    ["3", "Computer Programming 3", "COSC1001", "3.00", "2nd Year", "Information Technology", "..."],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                PageAppBar(
                  title: "Subjects"
                ),

                const SizedBox(height: 10,),

                SearchBox(
                  controller: searchController, 
                  label: "Search:", 
                  hint: "Enter a subject name"
                ),

                const SizedBox(height: 20,),

                CustomDataTable(
                  columnNames: columnNames, 
                  dataTableValues: values
                )
              ],
            ),
          ),
        )
      ),

      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}