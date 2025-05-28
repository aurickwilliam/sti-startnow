import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/completed_page.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReservationFeePage extends StatefulWidget {
  const ReservationFeePage({super.key});

  @override
  State<ReservationFeePage> createState() => _ReservationFeePageState();
}

class _ReservationFeePageState extends State<ReservationFeePage> {
  late DatabaseProvider db;
  late Student student;

  XFile? reservationImg;
  File? reservationImgName;

  // Asynchronous Function to access the gallery and return an image
  // Reservation Photo
  Future pickReservationPhotoFromGallery() async {
    reservationImg = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (reservationImg != null) {
      setState(() {
        reservationImgName = File(reservationImg!.name);
      });
    }
  }

  Future<void> _finishNewStudentEnrollment() async {
    // Check image file size
    int fileSize = await reservationImg!.length(); // bytes toh
    const int maxSizeInBytes = 10 * 1024 * 1024;

    if (fileSize > maxSizeInBytes) {
      if (mounted) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "File Size",
              subtitle: "Image needs to be below 10MB",
            );
          },
        );
      }
      return;
    }

    student.enrollment.receiptImg = reservationImg;

    if (mounted) {
      // Show circular progress indicator
      showDialog(
        context: context,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: Center(child: const CircularProgressIndicator()),
          );
        },
      );
    }

    // Create student account
    try {
      await db.createNewStudent();
    } on AuthException {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Something went wrong",
              subtitle: "Student already exists",
            );
          },
        );
      }
      return;
    }

    // Pop circular progress indicator
    if (mounted) {
      Navigator.pop(context);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CompletedPage()),
        (context) => false,
      );
    }
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnrollmentHeader(
              step1: true,
              step2: true,
              step3: true,
              step4: true,
              title: "Reservation Fee",
            ),

            const SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                          ),

                          children: [
                            TextSpan(
                              text:
                                  "Pay the reservation fee online or over-the-counter thru our ",
                            ),

                            TextSpan(
                              text: "Alternative Payment Partners.",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                textStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            TextSpan(
                              text:
                                  "\n\nAttach the screenshot or a photo of your proof of payment below:",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      CustomOutlineButton(
                        text: "Attach a Photo",
                        onPressed: () {
                          pickReservationPhotoFromGallery();
                        },
                      ),

                      const SizedBox(height: 10),

                      Text(
                        reservationImg == null
                            ? "No selected Image"
                            : "$reservationImgName",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 200 : 24,
            vertical: 10,
          ),
          child: BottomButton(
            onPressed: () {
              if (reservationImg == null) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return CustomBottomSheet(
                      isError: true,
                      title: "Reservation Image",
                      subtitle:
                          "Please upload the picture\nof your reservation",
                    );
                  },
                );
              } else {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return CustomBottomSheet(
                      submitFunc: () async {
                        await _finishNewStudentEnrollment();
                      },
                    );
                  },
                );
              }
            },
            text: "Submit Application",
          ),
        ),
      ],
    );

    // Choosing the parent widget
    Widget parentWidget =
        isLandscape
            ? SingleChildScrollView(child: content)
            : Container(child: content);

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(child: parentWidget),
    );
  }
}
