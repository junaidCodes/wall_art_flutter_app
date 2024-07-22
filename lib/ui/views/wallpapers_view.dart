import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/routes/route_names.dart';

import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/blue_green_container.dart';

// ignore: must_be_immutable
class WallpapersView extends StatefulWidget {
  List images;
  String title;
  WallpapersView({super.key, required this.images, this.title = "Wallpapers"});

  @override
  State<WallpapersView> createState() => _WallpapersViewState();
}

class _WallpapersViewState extends State<WallpapersView> {
  @override
  Widget build(BuildContext context) {
    return BlueGreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            widget.title,
            style:
                GoogleFonts.inter(fontSize: 24, color: AppColors.primaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.63,
            children: List.generate(
                widget.images.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.walpaperSlider,
                            arguments: {
                              'images': widget.images,
                              'selectedIndex': index
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          // image: DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image: AssetImage(widget.images[index])
                          // )
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
