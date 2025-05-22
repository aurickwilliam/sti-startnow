import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sti_startnow/pages/enrollment/completed_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/welcome/welcome_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:sti_startnow/providers/subject_list_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await checkIfFirstLaunch();
  await Supabase.initialize(
    url: 'https://uhudqizaeyecqkftcxyl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVodWRxaXphZXllY3FrZnRjeHlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc3OTc4MTMsImV4cCI6MjA2MzM3MzgxM30._590W8qSdRFd-NeVeKW41GY43T8bJJLKyISqUD-apyo',
  );

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}


late final bool isFirstLaunch;
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubjectListProvider()),
        ChangeNotifierProvider(create: (context) => EnrolleeListProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.define(),
        // home: isFirstLaunch ? WelcomePage() : EnrollmentDashboard(),
        home: CompletedPage(),
      ),
    );
  }
}

Future<void> checkIfFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();

  isFirstLaunch = prefs.getBool('first_launch') ?? true;

  if (isFirstLaunch) {
    await prefs.setBool('first_launch', false);
  }
}
