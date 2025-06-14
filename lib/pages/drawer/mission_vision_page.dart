import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/drawer/components/info_card.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MissionVisionPage extends StatelessWidget {
  const MissionVisionPage({super.key});  

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
                title: "Mission & Vision",
              ),
                    
              const SizedBox(height: 20,),
                    
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoCard(
                      title: "Mission", 
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                              height: 1.5
                            ),
                            children: [
                              TextSpan(
                                text: "We are an institution committed to provide knowledge through the development and delivery of superior learning systems.\n\n"
                              ),
                              
                              TextSpan(
                                text: "We strive to provide optimum value to all our stakeholders — our students, our faculty members, our employees, our partners, our shareholders, and our community.\n\n"
                              ),
                              
                              TextSpan(
                                text: "We will pursue this mission with utmost integrity, dedication, transparency, and creativity."
                              ),
                            ]
                          )
                        ),
                      ]
                    ),
                          
                    const SizedBox(height: 20,),

                    InfoCard(
                      title: "Vision", 
                      children: [
                        Text(
                          "To be the leader in innovative and relevant education that nurtures individuals to become competent and responsible members of society.",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 14,
                            height: 1.5
                          ),
                        ),
                      ]
                    ),
                          
                    const SizedBox(height: 20,),

                    InfoCard(
                      title: "STI Hymn", 
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                              height: 2
                            ),
                            children: [
                              TextSpan(text: "Aim high with STI\n"),
                              TextSpan(text: "The future is here today\n"),
                              TextSpan(text: "Fly high with STI\n"),
                              TextSpan(text: "Be the best that you can be\n"),
                              TextSpan(text: "Onward to tomorrow\n"),
                              TextSpan(text: "With dignity and pride\n"),
                              TextSpan(text: "A vision of excellence\n"),
                              TextSpan(text: "Our resounding battle cry\n"),
                              TextSpan(text: "Aim high with STI\n"),
                              TextSpan(text: "The future is here today\n"),
                              TextSpan(text: "Fly high with STI\n"),
                              TextSpan(text: "Be the best that you can be"),
                            ]
                          )
                        ),
                      ]
                    ),

                    const SizedBox(height: 100,),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}