import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/auth_page.dart';
import 'package:sti_startnow/pages/initialization.dart';
import 'package:sti_startnow/pages/internet_check/loading_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, netSnapshot) {
        return StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, authSnapshot) {
            if (authSnapshot.connectionState == ConnectionState.waiting ||
                netSnapshot.connectionState == ConnectionState.waiting) {
              return const LoadingPage();
            }

            final status = netSnapshot.hasData ? netSnapshot.data! : null;

            if (status != null && status.contains(ConnectivityResult.none)) {
              FlutterNativeSplash.remove();
              return const LoadingPage();
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
