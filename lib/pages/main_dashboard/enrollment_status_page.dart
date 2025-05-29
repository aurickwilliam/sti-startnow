import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';
import 'package:sti_startnow/pages/components/information_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment/components/download_toast.dart';
import 'package:sti_startnow/pdf/pre_assessment_api.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrollmentStatusPage extends StatefulWidget {
  final Student student;
  final String status;

  const EnrollmentStatusPage({
    super.key,
    required this.student,
    required this.status,
  });

  @override
  State<EnrollmentStatusPage> createState() => _EnrollmentStatusPageState();
}

class _EnrollmentStatusPageState extends State<EnrollmentStatusPage> {
  TextStyle getStatusColor() {
    switch (widget.status) {
      case 'NOT ENROLLED':
        return GoogleFonts.roboto(color: AppTheme.colors.black);
      case 'UNVERIFIED':
        return GoogleFonts.roboto(color: AppTheme.colors.gold);
      case 'VERIFIED':
        return GoogleFonts.roboto(color: AppTheme.colors.green);
      case 'REJECTED':
        return GoogleFonts.roboto(color: AppTheme.colors.red);
    }
    return GoogleFonts.roboto(color: AppTheme.colors.gray);
  }

  late FToast fToast;

    @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String message, bool isSuccess){
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
    // if it is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageAppBar(title: "Enrollment Status"),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "Status: "),

                          // Status Text
                          TextSpan(text: widget.status, style: getStatusColor()),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 2.0
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Student Information:",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Divider(),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                InformationTile(
                                  label: "Name:", 
                                  data: widget.student.fullName
                                ),

                                const SizedBox(height: 10),

                                InformationTile(
                                  label: "Student No.:",
                                  data: widget.student.studentNo!,
                                ),

                                const SizedBox(height: 10),

                                InformationTile(
                                  label: "Term and Year:",
                                  data:
                                      widget.status != 'NOT ENROLLED'
                                          ? "${widget.student.enrollment.yearLevel} ${widget.student.enrollment.semester} SY. 2025 - 2026"
                                          : "Not Yet Enrolled",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // widget.status != 'NOT ENROLLED' ? CustomOutlineButton(
                    //   text: "Download Pre-Assessment", 
                    //   onPressed: () async {
                    //     await PreAssessmentApi.generatePreAssessment(widget.student);
                    //     _showToast();
                    //   }
                    // )
                    // : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
