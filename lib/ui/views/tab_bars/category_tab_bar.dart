import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  List<String> categoryNames = [
    'Nature',
    'Art',
    'Scify',
    'Animal',
    'Weeding',
    'Nature',
    'Art',
    'Scify',
    'Animal',
    'Weeding',
  ];
  // final NetworkService _networkService = NetworkService();
  // List<WallpapersModel> _wallpapers = [];

  // Future<void> _fetchWallpapers() async {
  //   try {
  //     List<WallpapersModel> wallpapers =
  //     await _networkService.fetchWallpapers();

  //     setState(() {
  //       _wallpapers = wallpapers;

  //     });

  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  List img = PathToImage.weeding;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Categories",
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: img.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      200.0, // Set the maximum width of each item
                  mainAxisExtent: 100.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing:
                      10.0, // Set spacing between items horizontally
                ),
                itemBuilder: (context, index) {
                  // var data = _wallpapers[index];
                  // var category = data.categoryName;
                  // var catWallpapers = data.categoryImage;
                  // var catWallpapers = data.categoryWallpapers.first.wallpaperImageUrl;
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(context, RouteName.walpapersView,
                              arguments: {
                                'arg': PathToImage.weeding,
                                'title': categoryNames[index]
                              });
                          break;

                        case 1:
                          Navigator.pushNamed(context, RouteName.walpapersView,
                              arguments: {
                                'arg': PathToImage.abstract,
                                'title': categoryNames[index]
                              });
                          break;
                        case 2:
                          Navigator.pushNamed(context, RouteName.walpapersView,
                              arguments: {
                                'arg': PathToImage.animal,
                                'title': categoryNames[index]
                              });
                          break;
                        case 3:
                          Navigator.pushNamed(context, RouteName.walpapersView,
                              arguments: {
                                'arg': PathToImage.walpapers,
                                'title': categoryNames[index]
                              });
                          break;
                        default:
                          log("default");
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // image:  NetworkImage(catWallpapers!),
                            image: AssetImage(PathToImage.walpapers[index]),
                          ),
                          border: Border.all(
                              color: Colors.black), // optional: add border
                          color: Colors.white, // optional: set background color
                        ),
                        child: Center(
                            child: Text(
                          categoryNames[index],
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ))),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
