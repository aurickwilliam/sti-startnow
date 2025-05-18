import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function submitFunc;
  const CustomBottomSheet({
    super.key,
    required this.submitFunc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/img/enrollment/warning.png",
                scale: 5,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20,),

            Text(
              "Are you sure?",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 10,),

            Text(
              "Changes will not be made\nthroughout the enrollment!",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30,),

            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.colors.gray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                ),

                const SizedBox(width: 20,),

                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      submitFunc();
                    }, 
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),

                    child: Text(
                      "Yes, Submit",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                )
              ],  
            )
          ],
        ),
      ),
    );
  }
}