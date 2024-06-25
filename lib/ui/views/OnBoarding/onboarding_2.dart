import 'package:flutter/material.dart';
import 'package:wall_art/ui/views/OnBoarding/Common/on_boarding.dart';
import 'package:wall_art/utils/image_path.dart';

// ignore: must_be_immutable
class OnBoarding2View extends StatelessWidget {
  String title = "Discover Your Perfect Wallpaper";

  String subtitle = "Thousands of Designs at Your Fingertips.";

  String imgPath = PathToImage.onBoard2;

  @override
  Widget build(BuildContext context) {
    return OnBoarding(path: imgPath, title: title, subtitle: subtitle);
  }
}
