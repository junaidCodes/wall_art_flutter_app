import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  List img = PathToImage.weeding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Categories",
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PathToImage.weeding.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      200.0, // Set the maximum width of each item
                  mainAxisExtent: 100.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing:
                      10.0, // Set spacing between items horizontally
                ),
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(PathToImage.weeding[index])),
                        border: Border.all(
                            color: Colors.black), // optional: add border
                        color: Colors.white, // optional: set background color
                      ),
                      child: Center(
                          child: Text(
                        "Nature",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500),
                      )));
                },
              ),
            ),
          ],
        )
      ],
    ));
  }
}
