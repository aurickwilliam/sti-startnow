import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/main_dashboard/view_tor_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class DocumentCard extends StatelessWidget {
  final String imgDocPath;
  final String docName;

  const DocumentCard({
    super.key,
    required this.imgDocPath,
    required this.docName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => 
        ViewTorPage(
          documentName: docName,
          documentImgPath: imgDocPath,
        )));
      },
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 4.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
      
        child: LayoutBuilder(
          builder: (context, constraints) {
            double imgHeight = constraints.maxHeight * 0.6;
      
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: imgHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgDocPath),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    docName,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            );
          }
        )
      ),
    );
  }
}