import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wall_art/core/view_models/onboard_slider_provider.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/routes/routes.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/button.dart';
import 'package:wall_art/utils/ex.dart';
import 'package:wall_art/utils/image_path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: true,
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
      ],
      child: MaterialApp(
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6B4897)),
          useMaterial3: true,
        ),
        initialRoute: RouteName.exampleW,

        onGenerateRoute: AppRoutes.generateRoutes,
        // home: SalonServicesView(),
      ),
    );
  }
}
