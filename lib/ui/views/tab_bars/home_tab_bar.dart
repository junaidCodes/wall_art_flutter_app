import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';
import 'package:wall_art/utils/app_colors.dart';
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
      child: Column(
        children: [
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        });
                  })),
          categoryNames("Animals", "See More", () {}),
          SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: img.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        });
                  })),
          categoryNames("Animals", "See More", () {}),
          SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: img.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                // image: DecorationImage(
                                //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        });
                  })),
        ],
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
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
        ),
        TexttButton(
            googleFonts: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400),
            text: sub,
            onPressed: onPress)
      ],
    ),
  );
}
