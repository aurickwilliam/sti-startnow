import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/verify_button.dart';
import 'package:sti_startnow/pages/components/fullscreen_image_page.dart';
import 'package:sti_startnow/pages/components/option_box.dart';
import 'package:sti_startnow/pages/components/option_tile.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/receipt_container.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EnrolleeInformationPage extends StatefulWidget {
  final Student student;

  const EnrolleeInformationPage({
    super.key,
    required this.student,
  });

  @override
  State<EnrolleeInformationPage> createState() => _EnrolleeInformationPageState();
}

class _EnrolleeInformationPageState extends State<EnrolleeInformationPage> {

  String selectedStatus = "";
  final denyMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    
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
                }
              ),
                    
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                          
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
                                  width: 3.0
                                ),
                                image: DecorationImage(
                                  image: AssetImage(widget.student.profileImg),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                        
                            const SizedBox(width: 20,),
                        
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
                        
                                const SizedBox(height: 10,),
                        
                                // Course
                                Text(
                                  widget.student.course,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                        
                                // Student Number
                                Text(
                                  widget.student.studentNo,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                        
                                // Email Address
                                Text(
                                  widget.student.email,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                        
                                // Contact Number
                                Text(
                                  widget.student.contactNo,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                          
                    const SizedBox(height: 20,),
                          
                    // // Option Label
                    // Text(
                    //   "Select Status:",
                    //   style: GoogleFonts.roboto(
                    //     color: AppTheme.colors.black,
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                          
                    // const SizedBox(height: 10,),
                          
                    // OptionBox(
                    //   children: [
                          
                    //     // Unverified
                    //     OptionTile(
                    //       text: "Unverified", 
                    //       icon: Icons.sentiment_dissatisfied_rounded, 
                    //       onTap: () {
                          
                    //       }
                    //     ),
                          
                    //     // Pending
                    //     OptionTile(
                    //       text: "Pending", 
                    //       icon: Icons.schedule_rounded, 
                    //       onTap: () {
                          
                    //       }
                    //     ),
                          
                    //     // Verified
                    //     OptionTile(
                    //       text: "Verified", 
                    //       icon: Icons.sentiment_satisfied_rounded, 
                    //       onTap: () {
                          
                    //       },
                    //       isLastItem: true,
                    //     ),
                    //   ]
                    // ),
                              
                    // const SizedBox(height: 20,),

                    Divider(),
                    
                    const SizedBox(height: 20,),
                              
                    // Receipt Approval label
                    Text(
                      "Payment Receipt:",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                              
                    const SizedBox(height: 10,),
                              
                    // Image of Receipt
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => 
                        FullscreenImagePage(imgPath: widget.student.receiptImg)));
                      },
                      child: ReceiptContainer(
                        imgPath: widget.student.receiptImg
                      ),
                    ),
                              
                    const SizedBox(height: 20,),
                              
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 2.0
                        ),
                        borderRadius: BorderRadius.circular(15)
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
                              });
                            },
                            selectedValue: selectedStatus,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20,),

                      selectedStatus == "Deny" ? TextField(
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
                            borderRadius: BorderRadius.circular(15)
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.colors.gray,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),

                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14
                        ),
                      ) 
                      : SizedBox(),
                    
                    const SizedBox(height: 50,),
                              
                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => AdminDashboard(selectedIndex: 1,)));
                      }, 
                      text: "Save",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}