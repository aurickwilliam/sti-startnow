import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/internet_check/loading_page.dart';
import 'package:sti_startnow/pages/welcome/welcome_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';

class Initialization extends StatefulWidget {
  const Initialization({super.key});

  @override
  State<Initialization> createState() => _InitializationState();
}

class _InitializationState extends State<Initialization> {
  late DatabaseProvider db;

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return db.programsInitialized
        ? isFirstLaunch
            ? const WelcomePage()
            : const EnrollmentDashboard()
        : FutureBuilder(
          future: _initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                FlutterNativeSplash.remove();
                return isFirstLaunch
                    ? const WelcomePage()
                    : const EnrollmentDashboard();
              }
            }
            return const LoadingPage();
          },
        );
  }

  // Sa pag-initialize ng programs
  Future<bool> _initialize() async {
    try {
      await db.initializePrograms();
      return true; // success
    } catch (error) {
      return false; // failure
    }
  }
}
