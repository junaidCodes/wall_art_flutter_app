import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wall_art/core/view_models/download_wallpaper.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    String url = "http://res.cloudinary.com/dc0ihk3oj/image/upload/v1720524406/svbobhockpu0lquaj4v6.jpg" ;


    return  Scaffold(body:  Column(children: [
      CachedNetworkImage(imageUrl: url),
      ElevatedButton(onPressed: (){

        Downloadwallpaper.setWallpaperFromUrl(url, WallpaperManager.LOCK_SCREEN,context);
      }, child: Text("sett wallpaper "))
    ],),);
  }
}
