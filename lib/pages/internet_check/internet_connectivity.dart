import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/pages/internet_check/no_internet_page.dart';
import 'package:sti_startnow/pages/welcome/welcome_page.dart';

class InternetConnectivity extends StatefulWidget {
  const InternetConnectivity({super.key});

  @override
  State<InternetConnectivity> createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  bool isConnectedToInternet = true;

  StreamSubscription? internetConnectionStreamSubscription;

  @override
  void initState() {
    super.initState();
    internetConnectionStreamSubscription = 
      InternetConnection().onStatusChange.listen((event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isConnectedToInternet = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isConnectedToInternet = false;
            });
            break;
          }
        
        debugPrint(isConnectedToInternet.toString());
      });
  }

  @override
  void dispose() {
    internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isConnectedToInternet ? 
      isFirstLaunch ? WelcomePage() : EnrollmentDashboard() 
      : 
      NoInternetPage();
  }
}