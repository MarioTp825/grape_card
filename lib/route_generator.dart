import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grape_card/error/view/error_screen.dart';
import 'package:grape_card/point/view/add_points_screen.dart';
import 'package:grape_card/point/view/point_dashboard_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const PointDashboardScreen());
      case '/points/add':
        return MaterialPageRoute(builder: (_) => const AddPointsScreen());
      default:
        final msg = args?.toString();
        return MaterialPageRoute(
          builder: (_) => ErrorScreen(
            message: msg ?? "An unexpected error has occurred, please contact your provider.",
          ),
        );
    }
  }
}
