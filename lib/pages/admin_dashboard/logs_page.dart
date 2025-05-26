import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/log_tile.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  late DatabaseProvider db;
  late final StreamSubscription<List<Map<String, dynamic>>> logStream;
  late List<List> logList;

  String getDateTime(String timestampString) {
    final DateTime parsedDate = DateTime.parse(timestampString).toLocal();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDate);
  }

  void getLogs(List<Map<String, dynamic>> newLogs) {
    db.setLogs = newLogs;
    setState(() {
      logList = [];
      for (final log in newLogs) {
        logList.add([
          log['status'],
          log['enrollment_id'].toString(),
          log['admin_name'],
          getDateTime(log['log_time']),
          log['student_name'],
          "0${log['student_number']}",
          log['comment'],
        ]);
      }
    });
  }

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    getLogs(db.logs); // Initial logs

    // Listen to changes in logs database
    logStream = supabase
        .from("VERIFICATION_LOG")
        .stream(primaryKey: ['log_id'])
        .order('log_time', ascending: true)
        .listen((logs) {
          getLogs(logs);
        });

    super.initState();
  }

  @override
  void dispose() {
    logStream.cancel();
    super.dispose();
  }

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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Column(
                      children: [
                        ...List.generate(logList.length, (index) {
                          return LogTile(
                            status: logList[index][0],
                            enrollId: logList[index][1],
                            adminName: logList[index][2],
                            dateTime: logList[index][3],
                            studentName: logList[index][4],
                            studentNo: logList[index][5],
                            comment: logList[index][6],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
