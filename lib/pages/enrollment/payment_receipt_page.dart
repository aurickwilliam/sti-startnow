import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/student_information_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PaymentReceiptPage extends StatefulWidget {
  const PaymentReceiptPage({super.key});

  @override
  State<PaymentReceiptPage> createState() => _PaymentReceiptPageState();
}

class _PaymentReceiptPageState extends State<PaymentReceiptPage> {
  late DatabaseProvider db;
  late Student student;
  late final String name;

  File? selectedImage;
  File? selectedImageName;

  // Asynchronous Function to access the gallery and return an image
  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      selectedImage = File(returnedImage!.path);
      selectedImageName = File(returnedImage.name);
    });
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;
    student.enrollment.yearLevel = null; // I am sorry for this
    name = student.fullName;
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
              step3: false,
              step4: false,
              title: "Payment Receipt",
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greetings to the student
                  Text(
                    "Hello, $name",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Kindly upload your official receipt for payment verification. Please note that uploading fraudulent invoice may result in disciplinary action.",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  CustomOutlineButton(
                    text: "Attached a Photo",
                    onPressed: () {
                      pickImageFromGallery();
                    },
                  ),

                  const SizedBox(height: 10),

                  // Text for displaying the File Name of the image
                  Text(
                    selectedImageName != null
                        ? "$selectedImageName"
                        : "No selected image",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
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
              if (selectedImage == null) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return CustomBottomSheet(
                      isError: true,
                      title: "Payment Receipt",
                      subtitle:
                          "Please upload a picture\nof your payment receipt",
                    );
                  },
                );
              } else {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return CustomBottomSheet(
                      submitFunc: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => const StudentInformationPage(),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
            text: "Submit",
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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          bool userPop = false;

          if (!didPop) {
            userPop = await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (builder) {
                return CustomBottomSheet(
                  submitFunc: () async {
                    await supabase.auth.signOut();
                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  },
                  subtitle: "All of your entered information\nwill be deleted",
                );
              },
            );
          }

          if (userPop && context.mounted) {
            Navigator.of(context).pop(result);
          }
        },
        child: SafeArea(child: parentWidget),
      ),
    );
  }
}
