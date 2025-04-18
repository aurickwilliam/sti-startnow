import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class ProfileEditPage extends StatefulWidget {
  final String profileImg;
  final String coverImg;

  const ProfileEditPage({
    super.key,
    required this.profileImg,
    required this.coverImg,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {

  File? newProfilePhoto;
  File? newCoverPhoto;

  // Asynchronous Function to access the gallery and return an image

  // Profile Photo
  Future pickNewProfileFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      newProfilePhoto = File(returnedImage!.path);
    });
  }

  // Cover Photo
  Future pickNewCoverFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      newCoverPhoto = File(returnedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              PageAppBar(
                title: "Profile Edit", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),

              const SizedBox(height: 10,),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.colors.primary,
                                width: 2.0
                              ),
                              image: DecorationImage(
                                image: newProfilePhoto != null ? FileImage(newProfilePhoto!) : AssetImage(widget.profileImg),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          
                          const SizedBox(height: 10,),
                      
                          FilledButton.icon(
                            onPressed: () {
                              pickNewProfileFromGallery();
                            }, 
                            label: Text(
                              "Change Profile Photo",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            icon: Icon(
                              Icons.edit
                            ),
                            style: FilledButton.styleFrom(
                              foregroundColor: AppTheme.colors.white,
                              backgroundColor: AppTheme.colors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                      
                          const SizedBox(height: 30,),
                      
                          Container(
                            width: double.infinity,
                            height: 175,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppTheme.colors.primary,
                                width: 2.0,
                              ),
                              image: DecorationImage(
                                image: newCoverPhoto != null ? FileImage(newCoverPhoto!) : AssetImage(widget.coverImg),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                      
                          const SizedBox(height: 10,),
                      
                          FilledButton.icon(
                            onPressed: () {
                              pickNewCoverFromGallery();
                            }, 
                            label: Text(
                              "Change Cover Photo",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            icon: Icon(
                              Icons.edit
                            ),
                            style: FilledButton.styleFrom(
                              foregroundColor: AppTheme.colors.white,
                              backgroundColor: AppTheme.colors.primary,
                              minimumSize: Size(double.infinity, 46) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                      
                        ],
                      ),
                    ),
                
                    BottomButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => 
                        AdminDashboard(selectedIndex: 2,)));
                      }, 
                      text: "Save"
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}