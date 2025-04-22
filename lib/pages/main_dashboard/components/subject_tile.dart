import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SubjectTile extends StatelessWidget {
  final String imgPath;
  final String subjectName;
  final String subjectCode;
  final String subjectTeacher;

  const SubjectTile({
    super.key,
    required this.imgPath,
    required this.subjectName,
    required this.subjectCode,
    required this.subjectTeacher,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
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
      
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
      
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover
                  ) 
                ),
              ),
      
              const SizedBox(width: 20,),
      
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      
                    // Subject Name
                    Text(
                      subjectName,
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      
                    // Subject Code
                    Text(
                      subjectCode,
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 14,
                      ),
                    ),
                      
                    Divider(height: 10,),
                      
                    // Subject Teacher
                    Text(
                      subjectTeacher,
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}