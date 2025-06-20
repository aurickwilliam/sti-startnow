import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/verify_button.dart';
import 'package:sti_startnow/pages/components/fullscreen_image_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/receipt_container.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class UnverifiedEnrolleePage extends StatefulWidget {
  final Student student;

  const UnverifiedEnrolleePage({super.key, required this.student});

  @override
  State<UnverifiedEnrolleePage> createState() => _UnverifiedEnrolleePageState();
}

class _UnverifiedEnrolleePageState extends State<UnverifiedEnrolleePage> {
  late DatabaseProvider db;
  late EnrolleeListProvider enroll;
  final messageController = TextEditingController();

  String selectedStatus = "";

  Future<void> changeEnrollmentStatus() async {
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

    final status = selectedStatus == "Approve" ? "Verified" : "Rejected";
    final time = DateTime.now().toIso8601String(); // Time of review
    enroll.changeStudentStatus(widget.student, status);
    enroll.setComment(widget.student, messageController.text);
    enroll.setReviewer(widget.student, db.admin.fullName, time);

    // Update enrollment status of student's current enrollment
    final enrollmentID = widget.student.enrollmentID;
    await supabase
        .from("ENROLLMENT")
        .update({'enrollment_status': status})
        .eq('enrollment_id', enrollmentID!);

    // Create log based on earlier interaction
    await supabase.from("VERIFICATION_LOG").insert({
      'enrollment_id': enrollmentID,
      'log_time': time,
      'status': status,
      'comment': messageController.text,
      'admin_name': db.admin.fullName,
      'student_name': widget.student.fullName,
      'student_number': int.parse(widget.student.studentNo!),
    });

    if (mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    db = context.read<DatabaseProvider>();
    enroll = context.read<EnrolleeListProvider>();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageAppBar(
                title: "Enrollee Information",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
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
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.colors.primary,
                                  width: 3.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(widget.student.profileImg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Enrollee Name
                                Text(
                                  "${widget.student.firstName} ${widget.student.lastName}",
                                  softWrap: true,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Course
                                Text(
                                  widget.student.programAcronym,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),

                                // Student Number
                                Text(
                                  widget.student.studentNo!,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),

                                // Email Address
                                Text(
                                  widget.student.email!,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),

                                // Contact Number
                                Text(
                                  widget.student.contactNo!,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // const SizedBox(height: 20,),
                    Divider(),

                    const SizedBox(height: 20),

                    // Receipt Approval label
                    Text(
                      "Payment Receipt:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Image of Receipt
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => FullscreenImagePage(
                                  imgPath: widget.student.receiptImg,
                                  imgUrl: widget.student.enrollment.receiptUrl,
                                ),
                          ),
                        );
                      },
                      child: ReceiptContainer(
                        imgPath: widget.student.receiptImg,
                        imgUrl: widget.student.enrollment.receiptUrl,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Approve checkbox
                        children: [
                          VerifyButton(
                            title: "Approve",
                            onTap: (value) {
                              setState(() {
                                selectedStatus = value.toString();
                                messageController.clear();
                              });
                            },
                            selectedValue: selectedStatus,
                          ),

                          // Denied Button
                          VerifyButton(
                            title: "Deny",
                            onTap: (value) {
                              setState(() {
                                selectedStatus = value.toString();
                                messageController.clear();
                              });
                            },
                            selectedValue: selectedStatus,
                          ),
                        ],
                      ),
                    ),

                    selectedStatus.isNotEmpty
                        ? Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),

                                Text(
                                  selectedStatus == "Deny"
                                      ? "Reason for Denial:"
                                      : "Approval Note:",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                TextField(
                                  controller: messageController,
                                  maxLines: 7,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: 'Enter a message...',
                                    border: OutlineInputBorder(),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.colors.primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.colors.gray,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),

                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 50),

                            BottomButton(
                              onPressed: () async {
                                if (selectedStatus.isNotEmpty &&
                                    messageController.text.isNotEmpty) {
                                  await changeEnrollmentStatus();
                                }
                              },
                              text: "Save",
                            ),
                          ],
                        )
                        : Container(),
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
