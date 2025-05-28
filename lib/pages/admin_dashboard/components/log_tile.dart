import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class LogTile extends StatefulWidget {
  final String status;
  final String enrollId;
  final String adminName;
  final String dateTime;
  final String studentName;
  final String studentNo;
  final String comment;
  
  const LogTile({
    super.key,
    required this.status,
    required this.enrollId,
    required this.adminName,
    required this.dateTime,
    required this.studentName,
    required this.studentNo,
    required this.comment,
  });

  @override
  State<LogTile> createState() => _LogTileState();
}

class _LogTileState extends State<LogTile> {

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    messageController.text = widget.comment;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppTheme.colors.gray,
            width: 2.0
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.status,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
                  Text(
                    widget.enrollId,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
      
              Divider(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.studentName,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  ),
    
                  Text(
                    widget.studentNo,
                    style: GoogleFonts.roboto(
                      color: AppTheme.colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Admin:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
          
                      Text(
                        "Date & Time:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.adminName,
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                        ),
                      ),
          
                      Text(
                        widget.dateTime,
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),

              

              const SizedBox(height: 8,),
      
              widget.status == "Verified" || widget.status == "Rejected" ? 
                TextField(
                  enabled: false,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  controller: messageController,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppTheme.colors.gray,
                        width: 1.0
                      )
                    )
                  ),
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 14,
                  ),
                ) : SizedBox(),
            ],
          )
        ),
      ),
    );
  }
}