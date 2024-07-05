import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/utils/app_colors.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final WallpaperService _wallpaperService = WallpaperService();
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    favorites = await _wallpaperService.getFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Wallpapers'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites yet'))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.63,
                children: List.generate(
                  favorites.length,
                  (index) {
                    final imagePath = favorites[index];
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imagePath)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: IconButton(
                            onPressed: () async {
                              // toggleFavorite(imagePath.urls!.small!);
                              await _wallpaperService
                                  .removeFromFavorites(imagePath);
                              _loadFavorites();
                            },
                            icon: Icon(
                              Icons.delete,
                            ),
                            iconSize: 40,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),

      // ListView.builder(
      //     itemCount: favorites.length,
      //     itemBuilder: (context, index) {
      //       final imagePath = favorites[index];
      //       return ListTile(
      //         leading: Image.network(imagePath,
      //             width: 50, height: 50, fit: BoxFit.cover),
      //         // title: Text(imagePath.split('/').last),
      //         trailing: IconButton(
      //           icon: Icon(Icons.delete),
      //           onPressed: () async {
      //             await _wallpaperService.removeFromFavorites(imagePath);
      //             _loadFavorites();
      //           },
      //         ),
      //       );
      //     },
      //   ),
    );
  }
}
