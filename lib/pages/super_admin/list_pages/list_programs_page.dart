import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_program_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_program_row_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListProgramsPage extends StatefulWidget {
  const ListProgramsPage({super.key});

  @override
  State<ListProgramsPage> createState() => _ListProgramsPageState();
}

class _ListProgramsPageState extends State<ListProgramsPage> {
  late DatabaseProvider db;
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = ["#", "Name", "Acronym", "Department"];

  late List<List> values;

  List<List> matchedValues = [];

  // From database
  void getPrograms(List<Map<String, dynamic>> programs) {
    db.setPrograms = programs;
    if (mounted) {
      setState(() {
        values = [];
        for (final program in programs) {
          values.add([
            program['id'].toString(),
            program['program_name'],
            program['acronym'],
            program['department'],
          ]);
        }
        matchedValues = values;
      });
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    getPrograms(db.programs); // Initial programs

    // Listen to changes in the program database
    supabase
        .from("PROGRAM")
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .listen((programs) {
          getPrograms(programs);
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
                (program) =>
                    program[1].toLowerCase().contains(searchTerm.toLowerCase()),
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
                                  builder: (context) {
                                    return EditProgramRowPage(rowValues: item);
                                  },
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
            MaterialPageRoute(builder: (context) => const AddProgramPage()),
          );
        },
        backgroundColor: AppTheme.colors.white,
        foregroundColor: AppTheme.colors.primary,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
