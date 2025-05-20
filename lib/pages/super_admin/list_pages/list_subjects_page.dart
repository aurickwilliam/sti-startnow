import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_subject_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_subject_row_page.dart';
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
  ];

  // Temporary Values for the table
  List<List> values = [
    [
      "1",
      "Information Management",
      "COSC1001",
      "3.00",
      "2nd Year",
      "Information Technology",
    ],
    [
      "2",
      "Fundamental of Mobile Programming",
      "COSC1001",
      "3.00",
      "2nd Year",
      "Information Technology",
    ],
    [
      "3",
      "Computer Programming 3",
      "COSC1001",
      "3.00",
      "2nd Year",
      "Information Technology",
    ],
    [
      "4",
      "Great Books",
      "COSC1001",
      "3.00",
      "2nd Year",
      "Information Technology",
    ],
    [
      "5",
      "Philippine Popular Culture",
      "COSC1001",
      "3.00",
      "2nd Year",
      "Information Technology",
    ],
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
                (subject) => subject[1].toLowerCase().startsWith(
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
              PageAppBar(title: "Subjects"),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(
                      controller: searchController,
                      label: "Search:",
                      hint: "Enter a subject name",
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
                                        EditSubjectRowPage(rowValues: item),
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
            MaterialPageRoute(builder: (context) => AddSubjectPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
