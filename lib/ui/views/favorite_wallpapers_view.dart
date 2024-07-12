import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/blue_green_container.dart';

class FavoritesWallpapersView extends StatefulWidget {
  const FavoritesWallpapersView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritesWallpapersViewState createState() =>
      _FavoritesWallpapersViewState();
}

class _FavoritesWallpapersViewState extends State<FavoritesWallpapersView> {
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

  void load() {}

  @override
  Widget build(BuildContext context) {
    return BlueGreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Favorite Wallpapers',
            style:
                GoogleFonts.inter(fontSize: 24, color: AppColors.primaryColor),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Consumer<WallpaperService>(builder: (context, value, child) {
          return favorites.isEmpty
              ? const Center(child: Text('No favorites yet'))
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
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.walpaperSlider,
                                    arguments: {
                                      'images': favorites,
                                      'selectedIndex': index
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(imagePath)),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: () async {
                                  await _wallpaperService
                                      .removeFromFavorites(imagePath);
                                  _loadFavorites();
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                ),
                                iconSize: 30,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ));
        }),
      ),
    );
  }
}
