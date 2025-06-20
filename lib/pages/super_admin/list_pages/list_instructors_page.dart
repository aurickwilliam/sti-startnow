import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_instructor_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_instructor_row_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListInstructorsPage extends StatefulWidget {
  const ListInstructorsPage({super.key});

  @override
  State<ListInstructorsPage> createState() => _ListInstructorsPageState();
}

class _ListInstructorsPageState extends State<ListInstructorsPage> {
  late DatabaseProvider db;
  late final StreamSubscription<List<Map<String, dynamic>>> instructorStream;
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "First Name",
    "Last Name",
    "Department",
    "Email Address",
  ];

  late List<List> values;
  List<List> matchedValues = [];

  void getInstructors(List<Map<String, dynamic>> instructors) {
    db.setInstructors = instructors;
    if (mounted) {
      setState(() {
        values = [];
        for (final instructor in instructors) {
          values.add([
            instructor['prof_id'].toString(),
            instructor['prof_fname'],
            instructor['prof_lname'],
            instructor['department'],
            instructor['email'],
          ]);
        }
        matchedValues = values;
      });
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    getInstructors(db.instructors); // Initial instructors

    // Listen to changes in the professor database
    instructorStream = supabase
        .from("PROFESSOR")
        .stream(primaryKey: ['prof_id'])
        .order('prof_id', ascending: true)
        .listen((instructors) {
          getInstructors(instructors);
        });

    super.initState();
  }

  @override
  void dispose() {
    instructorStream.cancel();
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
                (instructor) => instructor[1].toLowerCase().startsWith(
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
                                      (context) => EditInstructorRowPage(
                                        rowValues: item,
                                      ),
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
            MaterialPageRoute(builder: (context) => const AddInstructorPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
