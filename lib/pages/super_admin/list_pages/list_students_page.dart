import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_student_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_student_row_page.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_dashboard.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListStudentsPage extends StatefulWidget {
  const ListStudentsPage({super.key});

  @override
  State<ListStudentsPage> createState() => _ListStudentsPageState();
}

class _ListStudentsPageState extends State<ListStudentsPage> {
  late DatabaseProvider db;
  late final StreamSubscription<List<Map<String, dynamic>>> studentStream;
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "Student No.",
    "First Name",
    "Last Name",
    "Program",
    "Contact No.",
  ];

  late List<List> values;
  List<List> matchedValues = [];

  void getStudents(List<Map<String, dynamic>> students) {
    db.setStudents = students;
    setState(() {
      values = [];
      for (final student in students) {
        values.add([
          "0${student['student_id']}",
          student['stud_fname'],
          student['stud_lname'],
          db.getProgramAcronym(student['program_id']),
          student['mobile'],
        ]);
      }
      matchedValues = values;
    });
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    getStudents(db.students); // Initial students

    // Listen to changes in student database
    studentStream = supabase
        .from("STUDENT")
        .stream(primaryKey: ['student_id'])
        .order('student_id', ascending: true)
        .listen((students) {
          getStudents(students);
        });

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

    if (mounted) {
      setState(() {
        matchedValues = results;
      });
    }
  }

  @override
  void dispose() {
    studentStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (didPop, result) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SuperAdminDashboard(),
            ),
          ),
      child: Scaffold(
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
                  PageAppBar(
                    title: "List of Students",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuperAdminDashboard(),
                        ),
                      );
                    },
                  ),

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
              MaterialPageRoute(builder: (context) => AddStudentPage()),
            );
          },
          backgroundColor: AppTheme.colors.white,
          foregroundColor: AppTheme.colors.primary,
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
