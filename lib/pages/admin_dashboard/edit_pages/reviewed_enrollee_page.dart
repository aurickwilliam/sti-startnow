import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/radio_option_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/verify_button.dart';
import 'package:sti_startnow/pages/components/fullscreen_image_page.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/receipt_container.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/option_box.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ReviewedEnrolleePage extends StatefulWidget {
  final Student student;
  final String status;

  const ReviewedEnrolleePage({
    super.key,
    required this.student,
    required this.status,
  });

  @override
  State<ReviewedEnrolleePage> createState() => _ReviewedEnrolleePageState();
}

class _ReviewedEnrolleePageState extends State<ReviewedEnrolleePage> {
  String receiptStatus = "";
  final denyMessageController = TextEditingController();

  String enrollmentStatus = "";

  @override
  void initState() {
    denyMessageController.text = widget.student.denyMessage ?? "";
    enrollmentStatus = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<EnrolleeListProvider>(context);

    receiptStatus = widget.status == "Verified" ? "Approve" : "Deny";

    String adminName = "Kai Cenat";
    String dateTime = "05/25/25 HH:MM:SS";

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
                                  widget.student.course!,
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

                    Divider(),

                    const SizedBox(height: 20),

                    Text(
                      "Select Status:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),

                    OptionBox(
                      children: [
                        RadioOptionTile(
                          text: "Unverified",
                          selectedValue: enrollmentStatus,
                          onTap: (value) {
                            setState(() {
                              enrollmentStatus = value.toString();
                            });
                          },
                        ),

                        RadioOptionTile(
                          text: "Verified",
                          selectedValue: enrollmentStatus,
                          onTap: (value) {
                            setState(() {
                              enrollmentStatus = value.toString();
                            });
                          },
                        ),

                        RadioOptionTile(
                          text: "Rejected",
                          selectedValue: enrollmentStatus,
                          onTap: (value) {
                            setState(() {
                              enrollmentStatus = value.toString();
                            });
                          },
                          isLastItem: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

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
                                ),
                          ),
                        );
                      },
                      child: ReceiptContainer(
                        imgPath: widget.student.receiptImg,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Name of ADMIN
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receiptStatus == "Deny" ? 
                            "Denied By: " : "Approved By: ",
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                        ),

                        Text(
                          adminName,
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10,),

                    // Date of Reviewed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date & Time Reviewed:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),

                        Text(
                          dateTime,
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20,),

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
                                receiptStatus = value.toString();
                              });
                            },
                            selectedValue: receiptStatus,
                          ),

                          // Denied Button
                          VerifyButton(
                            title: "Deny",
                            onTap: (value) {
                              setState(() {
                                receiptStatus = value.toString();
                              });
                            },
                            selectedValue: receiptStatus,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receiptStatus == "Deny" ? "Reason for Denial:" : "Approval Note:",
                          style: GoogleFonts.roboto(
                            color: AppTheme.colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          enabled: false,
                          controller: denyMessageController,
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

                            disabledBorder: OutlineInputBorder(
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
                      onPressed: () {
                        if (enrollmentStatus.isNotEmpty) {
                          students.changeStudentStatus(
                            widget.student,
                            enrollmentStatus,
                          );
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => AdminDashboard(selectedIndex: 1),
                          ),
                        );
                      },
                      text: "Save",
                    ),
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
