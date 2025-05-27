import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/schedule_card.dart';
import 'package:sti_startnow/pages/drawer/about_page.dart';
import 'package:sti_startnow/pages/drawer/mission_vision_page.dart';
import 'package:sti_startnow/pages/enrollment/student_status_page.dart';
import 'package:sti_startnow/pages/components/drawer_tile.dart';
import 'package:sti_startnow/pages/main_dashboard/components/enrollment_status_card.dart';
import 'package:sti_startnow/pages/settings/settings.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late DatabaseProvider db;
  late Student student;
  late String status;
  late final StreamSubscription enrollmentStatus;

  @override
  void initState() {
    db = context.read<DatabaseProvider>();
    student = db.student;

    if (student.enrollment.enrollmentStatus != null) {
      status = student.enrollment.enrollmentStatus!.toUpperCase();
    } else {
      status = 'NOT ENROLLED';
    }

    // Listen to changes in student's enrollment status if meron
    if (student.enrollmentID != null) {
      enrollmentStatus = supabase
          .from("ENROLLMENT")
          .stream(primaryKey: ['enrollment_id'])
          .eq('enrollment_id', student.enrollmentID!)
          .listen((data) {
            if (mounted) {
              setState(() {
                status = data[0]['enrollment_status'].toUpperCase();
              });
            }
          });
    } else {
      enrollmentStatus = Stream.empty().listen(
        (data) {},
      ); // Para mawala late init error
    }
    super.initState();
  }

  @override
  void dispose() {
    enrollmentStatus.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Scaffold(
      backgroundColor: AppTheme.colors.primary,

      // Drawer
      endDrawer: Drawer(
        backgroundColor: AppTheme.colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 20),
          child: ListView(
            children: [
              DrawerTile(
                title: "Misson & Vision",
                icon: Icons.key,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MissionVisionPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              DrawerTile(
                title: "About",
                icon: Icons.emoji_objects_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),

              const SizedBox(height: 20),

              DrawerTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Header & Greetings
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning!",
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  student.fullName,
                                  style: GoogleFonts.roboto(
                                    color: AppTheme.colors.gold,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: AppTheme.colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Content / Box
                      Expanded(
                        child: Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                status == 'NOT ENROLLED'
                                    ? Column(
                                      children: [
                                        Text(
                                          "New Semester for SY 2025 - 2026",
                                          style: GoogleFonts.roboto(
                                            color: AppTheme.colors.primary,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        BottomButton(
                                          onPressed: () async {
                                            await _loadEnrollmentData();
                                          },
                                          text: "Enroll Now!",
                                        ),

                                        const SizedBox(height: 20),
                                      ],
                                    )
                                    : Container(),
                                EnrollmentStatusCard(
                                  student: student,
                                  status: status,
                                ),

                                const SizedBox(height: 20),

                                const ScheduleCard(),
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

  Future<void> _loadEnrollmentData() async {
    // Show circular progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(child: const CircularProgressIndicator()),
        );
      },
    );

    // Check kung may internet before any interaction
    final isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      if (mounted) {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomBottomSheet(
              isError: true,
              title: "Your Offline",
              subtitle: "No internet connection, reconnect\nand try again",
            );
          },
        );
      }
      return;
    }

    // Initialize sections
    await db.initializeSections();
    await db.initializeSchedules();

    if (mounted) {
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StudentStatusPage()),
      );
    }
  }
}
