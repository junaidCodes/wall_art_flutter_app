import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wall_art/core/network/network_service_home.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';

import 'package:wall_art/utils/app_colors.dart';

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
    getWallpapers();
  }

  var j;
  List<dynamic> list = [];
  void getList() {
    for (int i = 0; i < wallPapers.length; i++) {
      j = wallPapers[i].categoryName;
      log(j);
      // list = list.add(j);
    }
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
                                context, RouteName.walpapersView, arguments: {
                              'arg': PathToImage.animal,
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

Widget categoryNames(String title, String sub, void Function() onPress) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.whiteColor),
        ),
        TexttButton(
            googleFonts: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400),
            text: sub,
            onPressed: onPress)
      ],
    ),
  );
}

// ignore: must_be_immutable
class CustomContainer extends StatefulWidget {
  String path;
  VoidCallback? onPressed;
  CustomContainer({super.key, required this.path, this.onPressed});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppColors.primaryColor),
            // image: DecorationImage(
            //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.asset(
              widget.path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class NetworkImageContainer extends StatefulWidget {
  String path;
  VoidCallback? onPressed;

  NetworkImageContainer({super.key, required this.path, this.onPressed});

  @override
  State<NetworkImageContainer> createState() => _NetworkImageContainerState();
}

class _NetworkImageContainerState extends State<NetworkImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 100,
        width: 100,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: InkWell(
              onTap: widget.onPressed,
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.asset(
                  PathToImage.placeholder,
                  fit: BoxFit.cover,
                ),
                imageUrl: widget.path,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
    ;
  }
}
