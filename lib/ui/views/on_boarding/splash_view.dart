import 'package:flutter/material.dart';

import '../../../utils/image_path.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        height: 300,
        width: 250,
        child: Image.asset(PathToImage.onBoard2),
      ),
    );
  }
}
