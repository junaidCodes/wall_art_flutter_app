// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:wall_art/ui/views/on_boarding/common/on_boarding.dart';
import 'package:wall_art/utils/image_path.dart';

// ignore: must_be_immutable
class OnBoarding3View extends StatelessWidget {
  String title = "Elevate Your Display";

  String subtitle = "Curate Your Home Screen with Art and Style";

  String imgPath = PathToImage.onBoard3;

  @override
  Widget build(BuildContext context) {
    return OnBoarding(path: imgPath, title: title, subtitle: subtitle);
  }
}
