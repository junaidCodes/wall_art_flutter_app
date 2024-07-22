// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_art/core/network/network_service_home.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/tab_bars/common/category_names.dart';
import 'package:wall_art/ui/views/tab_bars/common/network_image_container.dart';
import 'package:wall_art/utils/image_path.dart';
import '../../../core/models/home_wallpapers_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List img = PathToImage.weeding;
  NetworkServiceHome serviceHome = NetworkServiceHome();
  WallpaperService wallpaperService = WallpaperService();
  List<HomeWallpapersModel> wallPapers = [];
  Future getWallpapers() async {
    List<HomeWallpapersModel> walls = await serviceHome.getService();
    wallPapers = walls;
    wallpaperService.notifyListner();
  }

  @override
  void initState() {
    super.initState();
    getWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    log("buildinggg");
    return Consumer<WallpaperService>(builder: (context, value, child) {
      return wallPapers.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  itemCount: wallPapers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, categoryIndex) {
                    HomeWallpapersModel homeWallpapersModel =
                        wallPapers[categoryIndex];
                    return Column(
                      children: [
                        categoryNames(
                          homeWallpapersModel.categoryName,
                          "See More",
                          () {
                            Navigator.pushNamed(
                                context, RouteName.walpapersView,
                                arguments: {
                                  'arg': wallPapers[categoryIndex]
                                      .categoryWallpapers
                                      .map((e) => e.wallpaperImageUrl)
                                      .toList(),
                                  'title': homeWallpapersModel.categoryName
                                });
                          },
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  homeWallpapersModel.categoryWallpapers.length,
                              itemBuilder: (context, wallpaperIndex) {
                                CategoryWallpaper wallPaperData =
                                    homeWallpapersModel
                                        .categoryWallpapers[wallpaperIndex];
                                return NetworkImageContainer(
                                    onPressed: () {
                                      log("message");

                                      Navigator.pushNamed(
                                          context, RouteName.walpaperSlider,
                                          arguments: {
                                            'images': homeWallpapersModel
                                                .categoryWallpapers
                                                .map((e) => e.wallpaperImageUrl)
                                                .toList(),
                                            'selectedIndex': wallpaperIndex
                                          });
                                    },
                                    path: wallPaperData.wallpaperImageUrl);
                              }),
                        ),
                      ],
                    );
                  }),
            );
    });
  }
}
