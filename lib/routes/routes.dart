import 'package:flutter/material.dart';
import 'package:wall_art/ex.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/OnBoarding/Common/onboard_slider.dart';

import '../ui/views/on_boarding/splash_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashView:
        {
          return MaterialPageRoute(
              builder: (context) => const OnBoardingView());
        }
      case RouteName.onBoardSlider:
        {
          return MaterialPageRoute(builder: (context) => const OnBoardSlider());
        }
      case RouteName.exampleW:
        {
          return MaterialPageRoute(builder: (context) => const ExampleW());
        }

      default:
        {
          return MaterialPageRoute(
              builder: ((context) => const Scaffold(
                    body: Center(
                      child: Text("No Route"),
                    ),
                  )));
        }
    }
  }
}
