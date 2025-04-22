import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/pages/welcome/page1.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
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

        ChangeNotifierProvider(
          create: (context) => EnrolleeListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.define(),
        home: Page1(),
      ),
    );
  }
}
