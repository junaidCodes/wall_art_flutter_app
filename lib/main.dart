import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wall_art/core/view_models/favorite_service.dart';
import 'package:wall_art/core/view_models/onboard_slider_provider.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/routes/routes.dart';
import 'package:wall_art/utils/ex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Future.delayed(const Duration(seconds: 10));
  // FlutterNativeSplash.remove();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardSliderProvider()),
        ChangeNotifierProvider(create: (_) => WallpaperService()),
        ChangeNotifierProvider(create: (_) => WallpaperService()),
        ChangeNotifierProvider(create: (_) => FavoriteService()),
      ],
      child: MaterialApp(
        // ignore: deprecated_member_use
        useInheritedMediaQuery: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6B4897)),
          useMaterial3: true,
        ),
        initialRoute: RouteName.splashView,

        onGenerateRoute: AppRoutes.generateRoutes,
        // home: MyApp1()
      ),
    );
  }
}
