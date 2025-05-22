import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/admin_dashboard/admin_dashboard.dart';
import 'package:sti_startnow/pages/main_dashboard/main_dashboard.dart';
import 'package:sti_startnow/pages/super_admin/super_admin_dashboard.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  final User user;
  // ignore: prefer_const_constructors_in_immutables
  AuthPage({super.key, required this.user});

  late final DatabaseProvider db;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<DatabaseProvider>(context);
    return FutureBuilder(
      future: _getUserRoleAndData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data) {
            case 'super_admin':
              return const SuperAdminDashboard();
            case 'admin':
              return const AdminDashboard();
            case 'student':
              return const MainDashboard();
          }
        }
        return Container();
      },
    );
  }

  Future _getUserRoleAndData() async {
    final res = await supabase
        .from("USER_ROLES")
        .select('role')
        .eq('user_id', user.id);

    if (res.isNotEmpty) {
      final role = res[0]['role'];

      switch (role) {
        case 'super_admin':
        // Initialize super_admin
        case 'admin':
        // Initialize admin
        case 'student':
          // Initialize student based on student number
          final studentRes = await supabase
              .from("STUDENT")
              .select('student_id')
              .eq('personal_email', user.email!);

          if (studentRes.isNotEmpty) {
            final studentNumber = studentRes[0]['student_id'];
            await db.initializeExistingStudent(studentNumber);
            return role;
          }
      }
    }
    return null;
  }
}
