import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/ui/views/on_boarding/common/text_button.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  List img = [PathToImage.onBoard1, PathToImage.onBoard2, PathToImage.onBoard3];
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
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // image: DecorationImage(
                          //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                        ),
                        child: Image.asset(
                          img[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  })),
          categoryNames("Abstract and Patterns", "See More", () {}),
          SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // image: DecorationImage(
                          //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                        ),
                        child: Image.asset(
                          img[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  })),
          categoryNames("Art and Illustrations", "See More", () {}),
          SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // image: DecorationImage(
                          //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                        ),
                        child: Image.asset(
                          img[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  })),
          categoryNames("Animals", "See More", () {}),
          SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // image: DecorationImage(
                          //     fit: BoxFit.fitWidth, image: AssetImage(assetName))
                        ),
                        child: Image.asset(
                          img[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
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
