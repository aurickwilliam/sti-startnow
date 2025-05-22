import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/auth_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/welcome/welcome_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final event = snapshot.hasData ? snapshot.data!.event : null;

        if (event == AuthChangeEvent.initialSession) {
          final session = snapshot.data!.session;
          if (session != null) {
            return AuthPage(user: session.user);
          }
        }

        FlutterNativeSplash.remove();
        return isFirstLaunch
            ? const WelcomePage()
            : const EnrollmentDashboard();
      },
    );
  }
}
