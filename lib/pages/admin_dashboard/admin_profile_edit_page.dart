import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/components/bottom_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminProfileEditPage extends StatefulWidget {
  final String profileImg;
  final String coverImg;

  const AdminProfileEditPage({
    super.key,
    required this.profileImg,
    required this.coverImg,
  });

  @override
  State<AdminProfileEditPage> createState() => _AdminProfileEditPageState();
}

class _AdminProfileEditPageState extends State<AdminProfileEditPage> {

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

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            PageAppBar(
              title: "Profile Edit", 
              onPressed: () {
                Navigator.pop(context);
              }
            ),
        
            const SizedBox(height: 10,),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10
              ),
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
              
                  OutlinedButton.icon(
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
                      foregroundColor: AppTheme.colors.primary,
                      backgroundColor: AppTheme.colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      side: BorderSide(
                        color: AppTheme.colors.primary,
                        width: 2.0
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
              
                  OutlinedButton.icon(
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
                      foregroundColor: AppTheme.colors.primary,
                      backgroundColor: AppTheme.colors.white,
                      minimumSize: Size(double.infinity, 46) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      side: BorderSide(
                        color: AppTheme.colors.primary,
                        width: 2.0
                      )
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
            vertical: isLandscape ? 10 : 0
          ),
          child: BottomButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => 
              AdminDashboard(selectedIndex: 2,)));
            }, 
            text: "Save"
          ),
        )
      ],
    );

    // Choosing the parent widget based on orientation
    Widget parentWidget = isLandscape
      ? SingleChildScrollView(
        child: content,
      )
      : Container(
        child: content,
      );

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: parentWidget
      ),
    );
  }

}