import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CourseTile extends StatelessWidget {

  final String courseName;
  final String imgPath;
  final Function()? onTap;

  const CourseTile({
    super.key,
    required this.courseName,
    required this.imgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: 100,
          margin: EdgeInsets.all(5),
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
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                  width: 80,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const SizedBox(width: 15,),
      
                Expanded(
                  child: Text(
                    courseName,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}