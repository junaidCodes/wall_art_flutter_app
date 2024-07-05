import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WallpaperService with ChangeNotifier {
  Future<void> addToFavorites(String path) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(path)) {
      favorites.add(path);
      await prefs.setStringList('favorites', favorites);
    }
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
    return favorites.contains(path);
  }

  Future<void> toggleFavorite(String imagePath) async {
    final isFavorite = await this.isFavorite(imagePath);
    if (isFavorite) {
      await removeFromFavorites(imagePath);
      // context.showSnackBar('Removed from favorites!');
      log("added");
    } else {
      await addToFavorites(imagePath);
      // context.showSnackBar('Added to favorites!');
      log("removed");
    }
    notifyListeners();
    // setState(() {}); // Trigger a rebuild to reflect favorite status
  }
}
