import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(color: Colors.red, height: 300,
        width: 200,
        child: Image.asset("assets/splash.png"),
      ),


    );
  }
}
