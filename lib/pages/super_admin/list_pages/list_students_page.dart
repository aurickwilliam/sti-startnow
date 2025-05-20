import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_student_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_student_row_page.dart';
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
    ["4", "Mario", "Bro", "02000123456", "BSIT", "doe@gmail.com"],
    ["5", "Luigi", "Bro", "02000123456", "BSCPE", "doe@gmail.com"],
  ];

  List<List> matchedValues = [];

  @override
  void initState() {
    matchedValues = values;
    super.initState();
  }

  void searchValues(String searchTerm) {
    List<List> results = [];

    if (searchTerm.isEmpty) {
      results = values;
    } else {
      results =
          values
              .where(
                (student) => student[1].toLowerCase().startsWith(
                  searchTerm.toLowerCase(),
                ),
              )
              .toList();
    }

    setState(() {
      matchedValues = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageAppBar(title: "List of Students"),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(
                      controller: searchController,
                      label: "Search:",
                      hint: "Enter a name",
                      onChanged: searchValues,
                    ),

                    const SizedBox(height: 20),

                    matchedValues.isNotEmpty
                        ? ListDataTable(
                          columnNames: columnNames,
                          dataTableValues: matchedValues,
                          handleNavigation: (item) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        EditStudentRowPage(rowValues: item),
                              ),
                            );
                          },
                        )
                        : Center(child: Text("No matches found")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
