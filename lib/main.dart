import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_art/core/view_models/onboard_slider_provider.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/routes/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OnBoardSliderProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteName.onBoardSlider,
      onGenerateRoute: AppRoutes.generateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
