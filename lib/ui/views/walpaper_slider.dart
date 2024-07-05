import 'dart:developer';
import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wall_art/core/view_models/favorite_service.dart';

import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/ui/views/home_screen.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/snack_bar.dart';

// ignore: must_be_immutable
class WalpaperSlider extends StatefulWidget {
  List images;
  int selectedIndex;

  WalpaperSlider({
    super.key,
    required this.images,
    required this.selectedIndex,
  });

  @override
  State<WalpaperSlider> createState() => _WalpaperSliderState();
}

class _WalpaperSliderState extends State<WalpaperSlider>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  final WallpaperService _wallpaperService = WallpaperService();

  late Animation<double> _animation;

  // final NetworkService _networkService = NetworkService();
  // List<WallpapersModel> _wallpapers = [];

//   Future<void> _fetchWallpapers() async {
//     try {
//       List<WallpapersModel> wallpapers =
//           await _networkService.fetchWallpapers();
// setState(() {
//
//   _wallpapers = wallpapers;
//
//
// });
//
//     } catch (e) {
//       log(e.toString());
//     }
//   }

  @override
  void initState() {
    // _fetchWallpapers();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.linear, parent: animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> toggleFavorite(String imagePath) async {
      final isFavorite = await _wallpaperService.isFavorite(imagePath);
      if (isFavorite) {
        await _wallpaperService.removeFromFavorites(imagePath);
        context.showSnackBar('Removed from favorites!');
      } else {
        await _wallpaperService.addToFavorites(imagePath);
        context.showSnackBar('Added to favorites!');
      }
      setState(() {}); // Trigger a rebuild to reflect favorite status
    }

    return Scaffold(
        body: CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, index, pageViewIndex) {
            final imagePath = widget.images[index];
            // final data = _wallpapers[index];
            // String? url = data.categoryWallpapers.first.wallpaperImageUrl;
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(imagePath)
                          // image: url != null
                          //     ? NetworkImage(url)
                          //     : AssetImage('assets/placeholder.png')
                          //         as ImageProvider,
                          )),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: FutureBuilder<bool>(
                    future: _wallpaperService.isFavorite(imagePath),
                    builder: (context, snapshot) {
                      final isFavorite = snapshot.data ?? false;
                      return IconButton(
                        onPressed: () {
                          toggleFavorite(imagePath);
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                        ),
                        iconSize: 40,
                        color: isFavorite ? Colors.red : Colors.amber,
                      );
                    },
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            height: double.infinity,
            initialPage: widget.selectedIndex,
          ),
        ),
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Set Wallpaper",
              iconColor: Colors.black,
              bubbleColor: Colors.white,
              icon: Icons.share,
              titleStyle: TextStyle(fontSize: 16, color: Colors.black),
              onPress: () {
                animationController.reverse();
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Lock Preview",
              iconColor: Colors.black,
              bubbleColor: Colors.white,
              icon: Icons.preview,
              titleStyle: TextStyle(fontSize: 16, color: Colors.black),
              onPress: () {
                animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Home preview",
              iconColor: Colors.black,
              bubbleColor: Colors.white,
              icon: Icons.preview_outlined,
              titleStyle: TextStyle(fontSize: 16, color: Colors.black),
              onPress: () {
                // Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                animationController.reverse();
              },
            ),
            Bubble(
              title: "Favourite",
              iconColor: Colors.black,
              bubbleColor: Colors.white,
              icon: Icons.favorite,
              titleStyle: TextStyle(fontSize: 16, color: Colors.black),
              onPress: () {
                animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Download",
              iconColor: Colors.black,
              bubbleColor: Colors.white,
              icon: Icons.download,
              titleStyle: TextStyle(fontSize: 16, color: Colors.black),
              onPress: () {
                // Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                animationController.reverse();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () => animationController.isCompleted
              ? animationController.reverse()
              : animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.black,

          // Flaoting Action button Icon
          iconData: Icons.menu,
          backGroundColor: Colors.white,
        ));
  }

  Future<void> setWallpaper(String imagePath) async {
    try {
      // Copy asset image to local file
      final filePath = await copyAssetToFile(imagePath);
      // Set the wallpaper
      final bool result = await AsyncWallpaper.setWallpaperFromFile(
        filePath: filePath,
        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
      );
      if (result) {
        context.showSnackBar("Wallpaper set successfully!");
      } else {
        context.showSnackBar('Failed to set wallpaper.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<String> copyAssetToFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File(
        '${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }
}
