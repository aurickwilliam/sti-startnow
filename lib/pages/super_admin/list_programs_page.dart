import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListProgramsPage extends StatefulWidget {
  const ListProgramsPage({super.key});

  @override
  State<ListProgramsPage> createState() => _ListProgramsPageState();
}

class _ListProgramsPageState extends State<ListProgramsPage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "Name",
    "Acronym",
    "Department",
    "Description",
  ];

  // Temporary Values for the table
  List<List> values = [
    ["1", "Bachelor of Science in Computer Science", "BSCS", "Information Technology", "..."],
    ["2", "Bachelor of Science in Information Technology", "BSIT", "Information Technology", "..."],
    ["3", "Bachelor of Science in Computer Engineering", "BSCPE", "Information Technology", "..."],
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
                  title: "Programs"
                ),

                const SizedBox(height: 10,),

                SearchBox(
                  controller: searchController, 
                  label: "Search:", 
                  hint: "Enter a program name"
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
    );
  }
}