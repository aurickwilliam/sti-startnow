import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/main_dashboard/components/document_card.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ListTorPage extends StatelessWidget {
  ListTorPage({super.key});

  final List<List> sampleDataDocument = [
    ["assets/img/sample_tor.png", "Document Name"],
  ];

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Documents",
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => 
                  MainDashboard(selectedIndex: 2,)));
                },
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
                    Text(
                      "Transcript of Records:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                          
                    const SizedBox(height: 20,),
                          
                    Container(
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        shrinkWrap: true,
                        crossAxisCount: isLandscape ? 4 : 2,
                        children: List.generate(10, (index) {
                          return DocumentCard(
                            imgDocPath: sampleDataDocument[0][0], 
                            docName: sampleDataDocument[0][1]
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 30,),
            ],
          ),
        )
      ),
    );
  }
}