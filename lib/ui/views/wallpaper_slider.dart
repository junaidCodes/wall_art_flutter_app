import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/floating_action_button.dart';
import 'package:wall_art/utils/image_path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wall_art/utils/snack_bar.dart';

// ignore: must_be_immutable
class WallpaperSlider extends StatefulWidget {
  List<String> images;
  int selectedIndex;

  WallpaperSlider({
    super.key,
    required this.images,
    required this.selectedIndex,
  });

  @override
  State<WallpaperSlider> createState() => _WallpaperSliderState();
}

class _WallpaperSliderState extends State<WallpaperSlider>
    with SingleTickerProviderStateMixin {
  late String pathToSet;
  late Animation<double> animation;
  late AnimationController animationController;

  late Animation<double> _animation;
  String currentImageUrl = "";

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.linear, parent: animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    currentImageUrl = widget.images[widget.selectedIndex];
  }

  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<WallpaperService>(context, listen: false);

    return Consumer<WallpaperService>(builder: (context, value, child) {
      return Scaffold(
        floatingActionButton: const FloatingActionButtonWidget(),
        body: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: widget.images.length,
              itemBuilder: (BuildContext context, index, pageViewIndex) {
                final imagePath = widget.images[index], pathToSet = imagePath;

                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: CachedNetworkImage(
                    imageUrl: pathToSet,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                    placeholder: (context, url) => Image.asset(
                      PathToImage.placeholder,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: double.infinity,
                  initialPage: widget.selectedIndex,
                  onPageChanged: (index, reason) {
                    currentImageUrl = widget.images[index];
                    service.notifyListner();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(118.0),
              child: Container(
                  color: Colors.red,
                  child: ElevatedButton(
                      onPressed: () async {
                        String? filePath =
                            await downloadAndSaveWallpaper(currentImageUrl);
                        if (filePath != null) {
                          context.showSnackBar("image saved in gallery",
                              Colors.green, AppColors.whiteColor);
                        }
                      },
                      child: Text("download"))),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      )),
                  FutureBuilder<bool>(
                    future: service.isFavorite(currentImageUrl),
                    builder: (context, snapshot) {
                      final isFavorite = snapshot.data ?? true;

                      return IconButton(
                        onPressed: () {
                          service.toggleFavorite(currentImageUrl, context);
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                        ),
                        iconSize: 40,
                        color: isFavorite ? Colors.red : Colors.amber,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      print("Storage permission granted.");
    } else {
      print("Storage permission denied.");
    }
  }

  Future<String?> downloadAndSaveWallpaper(String url) async {
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
}
