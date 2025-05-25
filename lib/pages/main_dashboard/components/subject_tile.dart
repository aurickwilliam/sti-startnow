import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class SubjectTile extends StatelessWidget {
  final String subjectName;
  final String subjectCode;
  final String subjectTeacher;
  final String noUnits;

  const SubjectTile({
    super.key,
    required this.subjectName,
    required this.subjectCode,
    required this.subjectTeacher,
    required this.noUnits,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
              // Subject Name
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subjectName,
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  const SizedBox(width: 10,),

                  Text(
                    "Units: $noUnits",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
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
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}