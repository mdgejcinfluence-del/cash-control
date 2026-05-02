
import 'package:flutter/material.dart';
import 'screens/pin_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/employee_screen.dart';
import 'screens/report_screen.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => const PinScreen());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case '/employee':
        return MaterialPageRoute(builder: (_) => const EmployeeScreen());

      case '/report':
        return MaterialPageRoute(builder: (_) => const ReportScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route inconnue")),
          ),
        );
    }
  }
}
