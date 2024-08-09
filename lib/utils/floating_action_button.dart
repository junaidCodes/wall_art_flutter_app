import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wall_art/utils/app_colors.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  void Function()? onTap ;
  void Function()? onTapLock ;
  void Function()? onTapBoth ;

   FloatingActionButtonWidget({super.key, required this.onTap, this.onTapLock, this.onTapBoth});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      gradient: const LinearGradient(
        colors: [Colors.black, Colors.cyan],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      icon: Icons.menu_open_outlined,
      iconTheme: const IconThemeData(color: Colors.white),
      // backgroundColor: Colors.amber.withOpacity(0.2),
      elevation: 0,
      // mini: mini,
      gradientBoxShape: BoxShape.circle,
      overlayOpacity: 0,

      children: [
        SpeedDialChild(
            backgroundColor: Colors.transparent,
            onTap: widget.onTap ,
            label: "Download",
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.cyan.withOpacity(0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: const Icon(
                Icons.download,
                color: AppColors.whiteColor,
              ),
            )),
        SpeedDialChild(
            label: "Favorites",
            onTap: () {},
            child: const Icon(Icons.favorite)),
        SpeedDialChild(
            onTap: () {},
            label: "Home Preview",
            child: const Icon(Icons.preview)),
        SpeedDialChild(
            label: "Lock preview",
            onTap: () {},
            child: const Icon(Icons.preview_outlined)),
        SpeedDialChild(
            onTap: () {},
            label: "Set Wallpaper",
            child: const Icon(Icons.wallpaper)),
        SpeedDialChild(
            onTap: widget.onTapLock,
            label: "Set Lock Screen",
            child: const Icon(Icons.wallpaper_outlined)),
        SpeedDialChild(
            onTap: widget.onTapBoth,
            label: "Set Both",
            child: const Icon(Icons.lock)),
      ],
    );
  }
}
