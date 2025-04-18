import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/announcement_mini_tile.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard({super.key});

  // Temporary data for announcement
  final List<List> announceList = [
    ["P200 to retake EXAM!", "Apr. 12, 2025"],
    ["No Uniform, No Entry!", "Mar. 1, 2025"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Announcements:",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),

                // Direct to Announcement Page
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.colors.primary,
                    size: 25,
                  )
                )
              ],
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
            child: Column(
              children: List.generate(
                announceList.length, 
                (index) {
                  return AnnouncementMiniTile(
                    title: announceList[index][0],
                    date: announceList[index][1],
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}