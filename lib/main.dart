import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/config/dependency_injection_config.dart';
import 'package:grape_card/config/grape_theme.dart';
import 'package:grape_card/point/bloc/point/add_points_bloc.dart';
import 'package:grape_card/point/bloc/point/points_bloc.dart';
import 'package:grape_card/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage().initializedStorage();
  dependencySetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PointsBloc()),
        BlocProvider(create: (context) => AddPointsBloc()),
      ],
      child: MaterialApp(
        title: 'Grape Card Tracker',
        theme: grapeTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: ScreenRoute.pointsDashboard.route,
      ),
    );
  }
}