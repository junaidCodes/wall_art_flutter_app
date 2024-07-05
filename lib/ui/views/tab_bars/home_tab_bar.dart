import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';

import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/button.dart';
import 'package:wall_art/utils/image_path.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  List img = PathToImage.weeding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            categoryNames("Fantasy and Sci-Fi", "See More", () {
              Navigator.pushNamed(context, RouteName.walpapersView, arguments: {
                'arg': PathToImage.animal,
                'title': "Fantasy and Sci-Fi"
              });
            }),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: PathToImage.animal.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: PathToImage.animal.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.animal[index],
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.walpaperSlider,
                                    arguments: {
                                      'images': PathToImage.animal,
                                      'selectedIndex': index
                                    });
                              },
                            );
                          });
                    })),
            categoryNames("Abstract and Patterns", "See More", () {
              Navigator.pushNamed(context, RouteName.walpapersView, arguments: {
                'arg': PathToImage.abstract,
                'title': "Abstract and Patterns"
              });
            }),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: PathToImage.abstract.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: PathToImage.abstract.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.abstract[index],
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.walpaperSlider,
                                    arguments: {
                                      'images': PathToImage.abstract,
                                      'selectedIndex': index
                                    });
                              },
                            );
                          });
                    })),
            categoryNames("Art and Illustrations", "See More", () {
              Navigator.pushNamed(context, RouteName.walpapersView, arguments: {
                'arg': PathToImage.weeding,
                'title': "Art and Illustrations"
              });
            }),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: PathToImage.weeding.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: PathToImage.weeding.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.weeding[index],
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.walpaperSlider,
                                    arguments: {
                                      'images': PathToImage.weeding,
                                      'selectedIndex': index
                                    });
                              },
                            );
                          });
                    })),
            categoryNames("Animals", "See More", () {
              Navigator.pushNamed(context, RouteName.walpapersView,
                  arguments: {'arg': PathToImage.animal, 'title': "Animal"});
            }),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: PathToImage.animal.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.animal[index],
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.walpaperSlider,
                                    arguments: {
                                      'images': PathToImage.animal,
                                      'selectedIndex': index
                                    });
                              },
                            );
                          });
                    })),
            categoryNames("Fantasy and Sci-Fi", "See More", () {}),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.weeding[index],
                              onPressed: () {},
                            );
                          });
                    })),
            categoryNames("Abstract and Patterns", "See More", () {}),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.weeding[index],
                              onPressed: () {},
                            );
                          });
                    })),
            categoryNames("Art and Illustrations", "See More", () {}),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.weeding[index],
                              onPressed: () {},
                            );
                          });
                    })),
            categoryNames("Animals", "See More", () {}),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    itemCount: PathToImage.animal.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              path: PathToImage.weeding[index],
                              onPressed: () {},
                            );
                          });
                    })),
          ],
        ),
      ),
    );
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
          style: GoogleFonts.inter(
              fontSize: 20,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500),
        ),
        TexttButton(
            googleFonts: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400),
            text: sub,
            onPressed: onPress)
      ],
    ),
  );
}

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
    ;
  }
}
