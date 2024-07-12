import 'package:flutter/material.dart';
import 'package:wall_art/ui/views/favorite_wallpapers_view.dart';
import 'package:wall_art/ui/views/home_screen.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/onboard_slider.dart';
import 'package:wall_art/ui/views/splash_veiw/splash_view.dart';
import 'package:wall_art/ui/views/wallpaper_slider.dart';
import 'package:wall_art/ui/views/wallpapers_view.dart';

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
      case RouteName.splashView:
        {
          return MaterialPageRoute(builder: (context) => const SplashView());
        }
      case RouteName.walpapersView:
        {
          final args = settings.arguments as Map<String, dynamic>;
          if (args.containsKey('arg') && args.containsKey('title')) {
            return MaterialPageRoute(
                builder: (context) => WallpapersView(
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
                builder: (context) => WallpaperSlider(
                      images: args['images'],
                      selectedIndex: args['selectedIndex'],
                    ));
          }
          return MaterialPageRoute(builder: ((context) => routeError()));
        }
      case RouteName.favoritesScreen:
        {
          return MaterialPageRoute(
              builder: (context) => const FavoritesWallpapersView());
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
