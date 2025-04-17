import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/providers/subject_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SubjectListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.define(),
        home: EnrollmentDashboard(),
      ),
    );
  }
}
