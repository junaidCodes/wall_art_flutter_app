import 'package:flutter/material.dart';
import 'package:wall_art/ex.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/onboard_slider.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
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
