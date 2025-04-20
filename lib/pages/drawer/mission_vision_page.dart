import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MissionVisionPage extends StatelessWidget {
  const MissionVisionPage({super.key});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageAppBar(
                  title: "Mission & Vision",
                ),
          
                const SizedBox(height: 20,),
          
                Text(
                  "Mission",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 10,),
          
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
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
          
                const SizedBox(height: 20,),
          
                Text(
                  "Vision",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 10,),
          
                Text(
                  "To be the leader in innovative and relevant education that nurtures individuals to become competent and responsible members of society.",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 16,
                  ),
                ),
          
                const SizedBox(height: 20,),
          
                Text(
                  "STI Hymn",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 10,),
          
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
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
                      TextSpan(text: "Be the best that you can be\n"),
                    ]
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}