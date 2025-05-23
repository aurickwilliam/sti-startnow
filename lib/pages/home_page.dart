import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/auth_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/internet_check/no_internet_page.dart';
import 'package:sti_startnow/pages/welcome/welcome_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: InternetConnection().onStatusChange,
      builder: (context, status) {
        return StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                status.connectionState == ConnectionState.waiting) {
              return Container();
            }

            if (status.data == InternetStatus.disconnected) {
              FlutterNativeSplash.remove();
              return NoInternetPage();
            }

            final event = snapshot.hasData ? snapshot.data!.event : null;

            if (event == AuthChangeEvent.initialSession) {
              final session = snapshot.data!.session;
              if (session != null) {
                return AuthPage(user: session.user);
              }
            }

            FlutterNativeSplash.remove();
            return isFirstLaunch ? WelcomePage() : EnrollmentDashboard();
          },
        );
      },
    );
  }
}
