import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/drawer/components/info_card.dart';
import 'package:sti_startnow/pages/drawer/components/text_info.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final List<List> makesDiffText = [
    ["ICT-Powered Learning", "We integrate tech-based tools into our learning systems."],
    ["Industry-Based Curriculum", "We develop programs in collaboration with industry partners."],
    ["Holistic Development", "STI promotes academic excellence, personal growth, and social responsibility."],
    ["Student-Centered Culture", "We foster a nurturing and supportive environment for all learners."],
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
                title: "About"
              ),
                    
              const SizedBox(height: 10,),
                    
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    InfoCard(
                      title: "About STI College", 
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                              height: 1.5
                            ),
                            children: [
                              TextSpan(
                                text: "STI College",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              
                              TextSpan(
                                text: " is one of the leading educational institutions in the Philippines, known for its focus on Information and Communications Technology (ICT), Business, Hospitality, Tourism Management, Engineering, and Arts & Sciences.\n\n",
                              ),
                              
                              TextSpan(
                                text: "Founded in "
                              ),
                              
                              TextSpan(
                                text: "1983",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              
                              TextSpan(
                                text: ", STI (originally Systems Technology Institute) started with just two schools and a vision to provide computer literacy to Filipinos. Today, STI has grown into a nationwide network of campuses committed to delivering real-life education that equips students with the knowledge and skills they need for the workforce."
                              ),
                            ]
                          )
                        ),
                      ]
                    ),                          
                     
                    const SizedBox(height: 20,),

                    InfoCard(
                      title: "What Makes STI Different?", 
                      children: List.generate(makesDiffText.length, (index) {
                        return TextInfo(
                          topic: makesDiffText[index][0], 
                          info: makesDiffText[index][1]
                        );
                      }),
                    ),
                              
                    const SizedBox(height: 20,),

                    InfoCard(
                      title: "Campus Nationwide",
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                              height: 1.5
                            ),
                            children: [
                              TextSpan(
                                text: "STI has over ",
                              ),

                              TextSpan(
                                text: "60 campuses",
                                style: GoogleFonts.roboto(
                                  color: AppTheme.colors.primary,
                                  fontWeight: FontWeight.bold,
                                )
                              ),

                              TextSpan(
                                text: " across the Philippines, bringing accessible and quality education to students in various regions."
                              )
                            ]
                          )
                        ),
                      ],
                    ),
                              
                    const SizedBox(height: 100),
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