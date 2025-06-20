import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/internet_check/loading_page.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_dashboard.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/providers/enrollee_list_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  final User user;

  const AuthPage({super.key, required this.user});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late DatabaseProvider db;
  late EnrolleeListProvider enroll;

  @override
  void initState() {
    super.initState();
    db = context.read<DatabaseProvider>();
    enroll = context.read<EnrolleeListProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserRoleAndData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          switch (snapshot.data) {
            case 'super_admin':
              return const SuperAdminDashboard();
            case 'admin':
              return const AdminDashboard();
            case 'student':
              return const MainDashboard();
          }
        }
        return const LoadingPage();
      },
    );
  }

  Future<String?> _getUserRoleAndData() async {
    final res = await supabase
        .from("USER_ROLES")
        .select('role')
        .eq('user_id', widget.user.id);

    if (res.isNotEmpty) {
      final role = res[0]['role'];

      if (db.userInitialized) {
        return role;
      }

      switch (role) {
        case 'super_admin' || 'admin':
          if (role == 'super_admin') {
            await db.initializeInstructors();
            await db.initializeCourses();
            await db.initializeStudents();
          }

          if (role == 'admin') {
            await enroll.initializeEnrollees();
            await db.initializeLogs();
            enroll.setCurrentEnrollees();
          }
          // Initialize super_admin/admin
          await db.initializeAdmin(widget.user.email!, role);
        case 'student':
          // Initialize student based on student number
          final studentRes = await supabase
              .from("STUDENT")
              .select('student_id')
              .eq('personal_email', widget.user.email!);

          if (studentRes.isNotEmpty) {
            final int studentNumber = studentRes[0]['student_id'];
            await db.initializeExistingStudent(studentNumber);
            await db.initializeCurrentEnroll();
          }
      }
      // From the bottom of my heart, I apologize for this
      await db.initializePrograms();
      return role;
    }
    return null;
  }
}
