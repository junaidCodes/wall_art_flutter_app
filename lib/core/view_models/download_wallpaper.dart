import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/snack_bar.dart';

class Downloadwallpaper {

 static Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      print("Storage permission granted.");
    } else {
      print("Storage permission denied.");
    }
  }

 // static Future<String?> downloadAndSaveWallpaper(String url) async {
 //    try {
 //      await requestStoragePermission();
 //
 //      var dio = Dio();
 //      Directory? directory;
 //
 //      if (Platform.isAndroid) {
 //        directory = await getExternalStorageDirectory();
 //        String newPath = "";
 //        List<String> paths = directory!.path.split("/");
 //        for (int i = 1; i < paths.length; i++) {
 //          String path = paths[i];
 //          if (path != "Android") {
 //            newPath += "/" + path;
 //          } else {
 //            break;
 //          }
 //        }
 //        newPath = newPath + "/Pictures/Wallpapers";
 //        directory = Directory(newPath);
 //      } else {
 //        directory = await getApplicationDocumentsDirectory();
 //      }
 //
 //      if (!await directory.exists()) {
 //        await directory.create(recursive: true);
 //      }
 //
 //      String fileName = url.split('/').last;
 //      String filePath = "${directory.path}/$fileName";
 //
 //      await dio.download(url, filePath, );
 //      return filePath;
 //    } catch (e) {
 //      print("Error downloading wallpaper: $e");
 //      return null;
 //    }
 //  }

static Future<void> setWallpaperFromUrl(String url, int location,BuildContext context) async {
   try {
     // Download the image
     final filePath = await downloadAndSaveWallpaper(url);
     if (filePath != null) {
       // Set the wallpaper
       await setWallpaper(filePath, location);
       context.showSnackBar("Set successfully" , AppColors.primaryColor, AppColors.whiteColor );

     }
   } catch (e) {
     print("Error: $e");
   }
 }

 static Future<String?> downloadAndSaveWallpaper(String url) async {
   try {
     await requestStoragePermission();

     var dio = Dio();
     Directory? directory;

     if (Platform.isAndroid) {
       directory = await getExternalStorageDirectory();
       String newPath = "";
       List<String> paths = directory!.path.split("/");
       for (int i = 1; i < paths.length; i++) {
         String path = paths[i];
         if (path != "Android") {
           newPath += "/" + path;
         } else {
           break;
         }
       }
       newPath = newPath + "/Pictures/Wallpapers";
       directory = Directory(newPath);
     } else {
       directory = await getApplicationDocumentsDirectory();
     }

     if (!await directory.exists()) {
       await directory.create(recursive: true);
     }

     String fileName = url.split('/').last;
     String filePath = "${directory.path}/$fileName";

     await dio.download(url, filePath);
     return filePath;
   } catch (e) {
     print("Error downloading wallpaper: $e");
     return null;
   }
 }

static Future<void> setWallpaper(String imagePath, int location) async {
   try {
     await WallpaperManager.setWallpaperFromFile(imagePath, location);
   } catch (e) {
     print("Error setting wallpaper: $e");
   }
 }


}
