import 'package:flutter/material.dart';
import 'package:wall_art/core/models/favorite.dart';

class FavoriteService with ChangeNotifier {
  final List<Favorite> _favorites = [];

  List<Favorite> get favorites => _favorites;

  void addToFavorites(Favorite favorite) {
    _favorites.add(favorite);
    notifyListeners();
  }

  void removeFromFavorites(Favorite favorite) {
    _favorites.remove(favorite);
    notifyListeners();
  }

  bool isFavorite(Favorite favorite) {
    return _favorites.contains(favorite);
  }
}
