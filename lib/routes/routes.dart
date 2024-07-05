import 'package:flutter/material.dart';
import 'package:wall_art/ui/views/home_screen.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/onboard_slider.dart';
import 'package:wall_art/ui/views/walpaper_slider.dart';
import 'package:wall_art/ui/views/walpapers_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onBoardSlider:
        {
          return MaterialPageRoute(builder: (context) => const OnBoardSlider());
        }
      case RouteName.homeScreen:
        {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
      case RouteName.walpapersView:
        {
          final args = settings.arguments as Map<String, dynamic>;
          if (args.containsKey('arg') && args.containsKey('title')) {
            return MaterialPageRoute(
                builder: (context) => WalpapersView(
                      images: args['arg'],
                      title: args['title'],
                    ));
          }
          return MaterialPageRoute(builder: ((context) => routeError()));
        }
      case RouteName.walpaperSlider:
        {
          final args = settings.arguments as Map<String, dynamic>;
          if (args.containsKey('images') && args.containsKey('selectedIndex')) {
            return MaterialPageRoute(
                builder: (context) => WalpaperSlider(
                      images: args['images'],
                      selectedIndex: args['selectedIndex'],
                    ));
          }
          return MaterialPageRoute(builder: ((context) => routeError()));
        }

      default:
        {
          return MaterialPageRoute(builder: ((context) => routeError()));
        }
    }
  }
}

Widget routeError() {
  return const Scaffold(
    body: Center(
      child: Text("No Route"),
    ),
  );
}
