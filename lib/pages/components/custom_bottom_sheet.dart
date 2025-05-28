import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function? submitFunc;
  final String? title;
  final String? subtitle;
  final bool isError; // Kapag user error
  final bool noNet; // Kapag offline si user

  const CustomBottomSheet({
    super.key,
    this.submitFunc,
    this.title,
    this.subtitle,
    this.isError = false,
    this.noNet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/enrollment/warning.png",
              scale: 5,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            Text(
              title ?? "Are you sure?",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              subtitle ?? "Changes will not be made\nthroughout the enrollment",
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            noNet
                ? Container()
                : Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              isError
                                  ? AppTheme.colors.green
                                  : AppTheme.colors.gray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: Text(
                          isError ? "Confirm" : "Cancel",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Isa lang button kapag user error, goods lang ba?
                    isError
                        ? Container()
                        : Expanded(
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                              submitFunc!();
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: AppTheme.colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            child: Text(
                              "Yes, I'm sure",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
