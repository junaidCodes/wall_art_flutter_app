// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_art/utils/snack_bar.dart';

class WallpaperService with ChangeNotifier {
  bool loading = false;
  int activeIndex = 0;
  bool isVisible = true;

  void notifyListner() {
    notifyListeners();
  }

  Future<void> setWallpaper(String imagePath, BuildContext context) async {
    loading = true;
    log("runnging");
    try {
      // Copy asset image to local file
      final filePath = await copyAssetToFile(imagePath);
      // Set the wallpaper
      final bool result = await AsyncWallpaper.setWallpaperFromFile(
        filePath: filePath,
        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
      );

      if (result) {
        loading = false;

        context.showSnackBar(
            "Wallpaper Applied successfully!", Colors.green, Colors.white);
        log("success");
      } else {
        loading = false;
        context.showSnackBar(
            'Failed to set wallpaper.', Colors.grey, Colors.white);
        log("failed");
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> addToFavorites(String path) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(path)) {
      favorites.add(path);
      await prefs.setStringList('favorites', favorites);
    }
  }

  Future<String> copyAssetToFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File(
        '${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    notifyListeners();
    return file.path;
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }

  Future<void> removeFromFavorites(String path) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(path);
    await prefs.setStringList('favorites', favorites);
  }

  Future<bool> isFavorite(String path) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    debugPrint("isFavorite ${favorites.contains(path)}");
    return favorites.contains(path);
  }

  Future<void> toggleFavorite(String imagePath, BuildContext context) async {
    final isFavorite = await this.isFavorite(imagePath);
    if (isFavorite) {
      await removeFromFavorites(imagePath);
      context.showSnackBar(
          'Removed from favorites!', Colors.grey, Colors.white);
    } else {
      await addToFavorites(imagePath);

      context.showSnackBar('Added to favorites!', Colors.green, Colors.white);
    }

    notifyListeners();
  }
}
