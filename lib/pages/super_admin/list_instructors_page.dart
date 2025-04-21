import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListInstructorsPage extends StatefulWidget {
  const ListInstructorsPage({super.key});

  @override
  State<ListInstructorsPage> createState() => _ListInstructorsPageState();
}

class _ListInstructorsPageState extends State<ListInstructorsPage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "First Name",
    "Last Name",
    "Department",
    "Email Address",
  ];

  // Temporary Values for the table
  List<List> values = [
    ["1", "John", "Doe", "Business Management", "doe@gmail.com"],
    ["2", "Kai", "Cenat", "Information Technology", "doe@gmail.com"],
    ["3", "Duke", "Dennis", "Tourism Management", "doe@gmail.com"],
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
                  title: "List of Instructors"
                ),

                const SizedBox(height: 10,),

                SearchBox(
                  controller: searchController, 
                  label: "Search:", 
                  hint: "Enter a name"
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