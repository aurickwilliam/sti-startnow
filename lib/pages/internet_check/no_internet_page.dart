import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Image(
                    image: AssetImage("assets/img/no_connection_img.png"),
                    fit: BoxFit.contain,
                  ),
                ),
            
                const SizedBox(height: 40,),
            
                Text(
                  "You're Offline",
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 10,),
            
                Text(
                  "It looks like you lost connection. Reconnect to continue.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: AppTheme.colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}