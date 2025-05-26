import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_subject_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_subject_row_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListSubjectsPage extends StatefulWidget {
  const ListSubjectsPage({super.key});

  @override
  State<ListSubjectsPage> createState() => _ListSubjectsPageState();
}

class _ListSubjectsPageState extends State<ListSubjectsPage> {
  late DatabaseProvider db;
  late final StreamSubscription<List<Map<String, dynamic>>> subjectStream;
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = ["Course Code", "Name", "Units", "Prerequisites"];

  late List<List> values;
  List<List> matchedValues = [];

  void getCourses(List<Map<String, dynamic>> courses) {
    db.setCourses = courses;
    if (mounted) {
      setState(() {
        values = [];
        for (final course in courses) {
          values.add([
            course['course_code'],
            course['course_name'],
            course['units'].toStringAsFixed(1),
            course['prereq'] ?? "---",
          ]);
        }
        matchedValues = values;
      });
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    getCourses(db.courses); // Initial courses

    // Listen for changes in the subject database
    subjectStream = supabase
        .from("SUBJECT")
        .stream(primaryKey: ['course_code'])
        .order('course_code', ascending: true)
        .listen((courses) {
          getCourses(courses);
        });

    super.initState();
  }

  @override
  void dispose() {
    subjectStream.cancel();
    super.dispose();
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
    if (mounted) {
      setState(() {
        matchedValues = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Scrollbar(
          trackVisibility: true,
          thickness: 5,
          radius: Radius.circular(10),
          interactive: true,
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          EditSubjectRowPage(rowValues: item),
                                ),
                              );
                            },
                          )
                          : Center(
                            child: Column(
                              children: [
                                SizedBox(
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddSubjectPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
