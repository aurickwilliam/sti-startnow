import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/bullet_list.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class RequirementPage extends StatelessWidget {

  final String information = "The following requirements must be submitted to the Registrar's Office before admission to any academic program:";

  const RequirementPage({super.key});

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // App Bar
              PageAppBar(
                title: "Requirements",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          
              const SizedBox(height: 10,),
          
              // Information
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      information,
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                              
                    const SizedBox(height: 20,),
                              
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppTheme.colors.gray,
                          width: 1.0
                        )
                      ),
                      child: Column(
                        children: [
                              
                          // COLLEGE REQUIREMENTS
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  "College Requirements",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              
                                backgroundColor: AppTheme.colors.white,
                                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                              
                                // Content
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Freshmen",
                                          style: GoogleFonts.roboto(
                                            color: AppTheme.colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        
                                        BulletList(
                                          strings: [
                                            "Original Form 138 / SF9-SHS (Learner's Progress Report Card)",
                                            "Original Form 137 / SF10-SHS (Learner's Permanent Academic Record)",
                                            "PSA-issued Birth Certificate",
                                            "Original Copy of Certificate of Good Moral Character or Recommendation from the Principal",
                                            "Medical Certificate of Chest X-ray results",
                                            "Specifically for applicants in BS Hospitality Management, BS Culinary Management, Hotel & Restaurant Administration, or Hospitality and Restaurant Services: Medical Certificate of Hepatitis A & B Screening"
                                          ]
                                        ),
                                        
                                        Text(
                                          "Transferee",
                                          style: GoogleFonts.roboto(
                                            color: AppTheme.colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),               
                                        
                                        BulletList(
                                          strings: [
                                            "Certificate of Transfer (Honorable Dismissal)",
                                            "Official Transcript of Records",
                                            "PSA-issued Birth Certificate",
                                            "Original Copy of Certificate of Good Moral Character or Recommendation from the Dean/Program or Department Head",
                                            "Medical Certificate of Chest X-ray results",
                                            "Specifically for applicants in BS Hospitality Management, BS Culinary Management, Hotel & Restaurant Administration, or Hospitality and Restaurant Services: Medical Certificate of Hepatitis A & B Screening",
                                          ]
                                        ),
                                      ],
                                    ),
                                  ),
                              
                                ],
                              ),
                            ),
                          ),
                              
                          Divider(),
                              
                          // ALS PASSERS
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  "ALS Passers",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              
                                backgroundColor: AppTheme.colors.white,
                              
                                // Content
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BulletList(
                                          strings: [
                                            "Certificate of Rating (COR) indicating eligibility",
                                            "PSA-issued Birth Certificate",
                                            "Any of the following clearances: Barangay, Police, or NBI",
                                            "Original Copy of Certificate of Good Moral Character or Recommendation from the Principal",
                                            "Medical Certificate of Chest X-ray results",
                                            "For applicants in Culinary Arts or Restaurant and Café Operations: Medical Certificate of Hepatitis A & B Screening",
                                          ]
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                              
                          Divider(),
                              
                          // Foreign Student with Scholastic Record from Foreign School
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  "Foreign Student with Scholastic Record from Foreign School",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              
                                backgroundColor: AppTheme.colors.white,
                              
                                // Content
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BulletList(
                                          strings: [
                                            "Five (5) copies of the Student's Personal History Statement (PHS) containing his/her left and right thumb-prints and a 2” x 2” photograph on plain white background taken not more than six months prior to submission, among others",
                                            "Transcript of Records/Scholastic Records duly authenticated by the Philippine Foreign Service Post (PFSP) located in the student-applicant's country of origin or legal residence",
                                            "Notarized Affidavit of Support including bank statements or notarized grant for institutional scholars",
                                            "Photocopy of the student's passport showing date and place of birth and birth certificate or its equivalent duly authenticated by the PFSP",
                                          ]
                                        ),
                              
                                        const SizedBox(height: 20,),
                              
                                        Text(
                                          "Student Visa and Special Study Permit (SSP) from the Bureau of Immigration shall not be required of the spouses and unmarried dependent children below 21 years old of aliens under the following categories:",
                                          style: GoogleFonts.roboto(
                                            color: AppTheme.colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                              
                                        BulletList(
                                          strings: [
                                            "Permanent foreign residents",
                                            "Aliens with valid working permits under Section 9(d), 9(g) and 47(a) (2) of the Philippine Immigration Act of 1940, as amended",
                                            "Personnel of foreign diplomatic and consular missions residing in the Philippines and their dependents",
                                            "Personnel of duly accredited international organizations residing in the Philippines and their dependents",
                                            "Holders of Special Investor's Resident Visa (SIRV) and Special Retiree's Resident Visa (SRRV)",
                                            "Foreign students coming to the Philippines with 47(a)(2) visas issued pursuant to existing laws, e.g. PD 2021"
                                          ]
                                        ),
                              
                                        Divider(
                                          height: 30,
                                        ),
                              
                                        BulletList(
                                          strings: [
                                            "Original Copy of Certificate of Good Moral Character or Recommendation from the Principal/Dean/Program or Department Head",
                                            "Medical Certificate of Chest X-ray results",
                                            "For applicants in Culinary Arts or Restaurant and Café Operations: Medical Certificate of Hepatitis A & B Screening",
                                          ]
                                        ),
                                      ],
                                    ),
                                  )
                                ],  
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                              
                    const SizedBox(height: 30,),
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