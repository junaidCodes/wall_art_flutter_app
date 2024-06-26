import 'package:flutter/material.dart';
import 'package:wall_art/ui/views/on_boarding/common/on_boarding.dart';
import 'package:wall_art/utils/image_path.dart';

// ignore: must_be_immutable
class OnBoarding1View extends StatelessWidget {
  String title = "Welcome to WallArt";

  String subtitle = "Transform Your Screen with Stunning Wallpapers";

  String imgPath = PathToImage.onBoard1;

  OnBoarding1View({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoarding(path: imgPath, title: title, subtitle: subtitle);
  }
}
