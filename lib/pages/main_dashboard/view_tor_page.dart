import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/fullscreen_image_page.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ViewTorPage extends StatelessWidget {
  final String documentName;
  final String documentImgPath;

  const ViewTorPage({
    super.key,
    required this.documentName,
    required this.documentImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Documents"
              ),

              const SizedBox(height: 10,),

              Text(
                documentName,
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20,),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => 
                  FullscreenImagePage(
                    imgPath: documentImgPath,
                  )));
                },
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppTheme.colors.primary,
                      width: 2.0
                    ),
                    image: DecorationImage(
                      image: AssetImage(documentImgPath),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}