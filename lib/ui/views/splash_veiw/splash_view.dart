import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/utils/image_path.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => SplashViewtState();
}

class SplashViewtState extends State<SplashView> {
  int? initScreen;

  checkOnBoard(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool firstTime = prefs.getBool('first_time') ?? true;
    initScreen = prefs.getInt("initScreen");
    await prefs.setInt("initScreen", 1);

    // initialRoute:
    //         initScreen == 0 || initScreen == null ? "firstTime" : "secondTime";
    if (initScreen == 0 || initScreen == null) {
      Timer(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.onBoardSlider, (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.homeScreen, (route) => false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkOnBoard(context);
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, RouteName.onBoardSlider, (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Image.asset(
        PathToImage.splashview,
        fit: BoxFit.cover,
      ),
    );
  }
}
