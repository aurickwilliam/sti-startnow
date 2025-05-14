import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/search_box.dart';
import 'package:sti_startnow/pages/super_admin/add_pages/add_announcement_page.dart';
import 'package:sti_startnow/pages/super_admin/components/list_data_table.dart';
import 'package:sti_startnow/pages/super_admin/edit_pages/edit_announcement_row_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListAnnouncementsPage extends StatefulWidget {
  const ListAnnouncementsPage({super.key});

  @override
  State<ListAnnouncementsPage> createState() => _ListAnnouncementsPageState();
}

class _ListAnnouncementsPageState extends State<ListAnnouncementsPage> {
  final TextEditingController searchController = TextEditingController();

  // Column values
  List<String> columnNames = [
    "#",
    "Title",
    "Date",
  ];

  // Temporary Values for the table
  List<List> values = [
    ["1", "No Uniform, No Entry", "mm/dd/yy"],
    ["2", "P200 to retake Exam", "mm/dd/yy"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageAppBar(
                title: "Announcements"
              ),
          
              const SizedBox(height: 10,),
          
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(
                      controller: searchController, 
                      label: "Search:", 
                      hint: "Enter a name"
                    ),
                              
                    const SizedBox(height: 20,),
                              
                    ListDataTable(
                      columnNames: columnNames, 
                      dataTableValues: values,
                      handleNavigation: (item) {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => EditAnnouncementRowPage(rowValues: item)));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),

       // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => AddAnnouncementPage()));
        },
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