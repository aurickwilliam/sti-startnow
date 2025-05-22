import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_enroll_sched_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_enroll_sched_row_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListEnrollSchedulePage extends StatefulWidget {
  const ListEnrollSchedulePage({super.key});

  @override
  State<ListEnrollSchedulePage> createState() => _ListEnrollSchedulePageState();
}

class _ListEnrollSchedulePageState extends State<ListEnrollSchedulePage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = ["#", "From", "To", "School Year", "Term"];

  // Temporary Values for the table
  List<List> values = [
    ["1", "mm/dd/yy", "mm/dd/yy", "2025-2026", "1st Term"],
    ["2", "mm/dd/yy", "mm/dd/yy", "2024-2025", "2nd Term"],
    ["3", "mm/dd/yy", "mm/dd/yy", "2023-2024", "1st Term"],
    ["4", "mm/dd/yy", "mm/dd/yy", "2022-2023", "1st Term"],
    ["5", "mm/dd/yy", "mm/dd/yy", "2021-2022", "2nd Term"],
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
                (schedule) => schedule[3].toLowerCase().contains(
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
              PageAppBar(title: "Enroll Schedule"),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(
                      controller: searchController,
                      label: "Search:",
                      hint: "Enter school year",
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
                                        EditEnrollSchedRowPage(rowValues: item),
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
            MaterialPageRoute(builder: (context) => AddEnrollSchedPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
