import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_instructor_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_instructor_row_page.dart';
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
    ["4", "Mario", "Bro", "Information Technology", "doe@gmail.com"],
    ["5", "Bowser", "Gay", "Tourism Management", "doe@gmail.com"],
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
                (instructor) => instructor[1].toLowerCase().startsWith(
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
              PageAppBar(title: "List of Instructors"),

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
                                        EditInstructorRowPage(rowValues: item),
                              ),
                            );
                          },
                        )
                        : Container(
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  child: Image(
                                    image: AssetImage(
                                      "assets/img/not_found_img.png",
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                Text(
                                  "No matches found",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
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
            MaterialPageRoute(builder: (context) => AddInstructorPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
