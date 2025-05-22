import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_program_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_program_row_page.dart';
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
    [
      "1",
      "Bachelor of Science in Computer Science",
      "BSCS",
      "Information Technology",
      "...",
    ],
    [
      "2",
      "Bachelor of Science in Information Technology",
      "BSIT",
      "Information Technology",
      "...",
    ],
    [
      "3",
      "Bachelor of Science in Computer Engineering",
      "BSCPE",
      "Information Technology",
      "...",
    ],
    [
      "4",
      "Bachelor of Science in Artificial Intelligence",
      "BSIT",
      "Information Technology",
      "...",
    ],
    [
      "5",
      "Bachelor of Science in Machine Learning",
      "BSCPE",
      "Information Technology",
      "...",
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
                (program) =>
                    program[1].toLowerCase().contains(searchTerm.toLowerCase()),
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
              PageAppBar(title: "Programs"),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(
                      controller: searchController,
                      label: "Search:",
                      hint: "Enter a program name",
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
                                        EditProgramRowPage(rowValues: item),
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
            MaterialPageRoute(builder: (context) => AddProgramPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
