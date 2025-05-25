import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/log_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({
    super.key,
  });

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {

  List<List> tempLogList = [
    ["Rejected", "10", "Caseoh", "05/25/25 HH:MM:SS", "Kai Cenat", "02000123456", "Comment 1"],
    ["Verified", "10", "Caseoh", "05/25/25 HH:MM:SS", "Kai Cenat", "02000123456", "Comment 2"],
    ["Verified", "10", "Caseoh", "05/25/25 HH:MM:SS", "Kai Cenat", "02000123456", "Comment 2"],
    ["Verified", "10", "Caseoh", "05/25/25 HH:MM:SS", "Kai Cenat", "02000123456", "Comment 2"],
    ["Unverified", "10", "Caseoh", "05/25/25 HH:MM:SS", "Kai Cenat", "02000123456", "Comment 3"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            PageAppBar(title: "Verification Logs"),
        
            Expanded(
              child: Scrollbar(
                trackVisibility: true,
                thickness: 5,
                radius: Radius.circular(10),
                interactive: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10
                    ),
                    child: Column(
                      children: [
                        ...List.generate(tempLogList.length, (index) {
                          return LogTile(
                            status: tempLogList[index][0], 
                            enrollId: tempLogList[index][1], 
                            adminName: tempLogList[index][2], 
                            dateTime: tempLogList[index][3], 
                            studentName: tempLogList[index][4],
                            studentNo: tempLogList[index][5],
                            comment: tempLogList[index][6],
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}