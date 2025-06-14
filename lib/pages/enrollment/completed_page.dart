import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/enrollment/components/download_toast.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pdf/pre_assessment_api.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({super.key});

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  late Student student;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    student = context.read<DatabaseProvider>().student;

    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String message, bool isSuccess) {
    Widget toast = DownloadToast(
      message: message,
      isSuccess: isSuccess,
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
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
              title: "Completed",
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    "You are now Registered!",
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomOutlineButton(
                    text: "Download Pre-Assessment Form",
                    onPressed: () async {
                      // ipasa nalang sa parameter ung object nandoon lahat ng info about sa pre-assessment
                      final preAssessment = await PreAssessmentApi.generatePreAssessment(student);
                      // await PreAssessmentApi.generatePreAssessment(student);

                      if (preAssessment != null){
                        _showToast("Downloaded", true);
                      }
                      else {
                        _showToast("Error", false);
                      }

                      // IF GUSTO IOPEN PAGTAPOS IDOWNLOAD
                      // SaveAndOpenPdf.openPdf(preAssessment);
                      
                    },
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
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (builder) {
                  return CustomBottomSheet(
                    submitFunc: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainDashboard(),
                        ),
                      );
                    },
                    subtitle:
                        "Make sure you have downloaded your\npre-assessment",
                  );
                },
              );
            },
            text: "Next",
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
