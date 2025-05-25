import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/auth_page.dart';
import 'package:sti_startnow/pages/initialization.dart';
import 'package:sti_startnow/pages/internet_check/no_internet_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: InternetConnection().onStatusChange,
      builder: (context, netSnapshot) {
        return StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, authSnapshot) {
            if (authSnapshot.connectionState == ConnectionState.waiting ||
                netSnapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            final status = netSnapshot.hasData ? netSnapshot.data! : null;

            if (status == InternetStatus.disconnected) {
              FlutterNativeSplash.remove();
              return const NoInternetPage();
            }

            final event =
                authSnapshot.hasData ? authSnapshot.data!.event : null;

            if (event == AuthChangeEvent.initialSession ||
                event == AuthChangeEvent.tokenRefreshed ||
                event == AuthChangeEvent.signedIn) {
              final session = authSnapshot.data!.session;
              if (session != null) {
                return AuthPage(user: session.user);
              }
            }

            // Para ma-initialize ang programs bago matanggal ang splash screen
            return const Initialization();
          },
        );
      },
    );
  }
}
