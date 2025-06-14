import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/enrollees_card.dart';
import 'package:sti_startnow/pages/admin_dashboard/components/pie_chart_card.dart';
import 'package:sti_startnow/pages/admin_dashboard/logs_page.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/enrollment_dashboard.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.primary,

      // Need ng layout builder para get ung size ng parent/screen
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              // Specify na sakupin ung max height
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                // Para proportion ung child inside the ConstrainedBox
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // App Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hi, Admin",
                              style: GoogleFonts.roboto(
                                color: AppTheme.colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Logs Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (context) => LogsPage()));
                                  }, 
                                  icon: Icon(
                                    Icons.description_rounded,
                                    color: AppTheme.colors.primary,
                                  ),
                                  label: Text(
                                    "Logs",
                                    style: GoogleFonts.roboto(
                                      color: AppTheme.colors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppTheme.colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                ),

                                const SizedBox(width: 5,),
                                
                                IconButton(
                                  onPressed: () async {
                                    await supabase.auth.signOut();
                                
                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  const EnrollmentDashboard(),
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    Icons.logout_rounded,
                                    color: AppTheme.colors.gold,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Content
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppTheme.colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isLandscape ? 200 : 24,
                              vertical: 25,
                            ),
                            child: Column(
                              children: [
                                // Enrollees Card
                                EnrolleesCard(),

                                const SizedBox(height: 20,),

                                PieChartCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
