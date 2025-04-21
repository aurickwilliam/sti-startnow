import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/custom_data_table.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListStudentsPage extends StatefulWidget {
  const ListStudentsPage({super.key});

  @override
  State<ListStudentsPage> createState() => _ListStudentsPageState();
}

class _ListStudentsPageState extends State<ListStudentsPage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "First Name",
    "Last Name",
    "Student No.",
    "Program",
    "Email Address",
  ];

  // Temporary Values for the table
  List<List> values = [
    ["1", "John", "Doe", "02000123456", "BSCS", "doe@gmail.com"],
    ["2", "Kai", "Cenat", "02000123456", "BSIT", "doe@gmail.com"],
    ["3", "Duke", "Dennis", "02000123456", "BSCPE", "doe@gmail.com"],
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
                  title: "List of Students"
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