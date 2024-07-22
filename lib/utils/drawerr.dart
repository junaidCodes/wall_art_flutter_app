import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wall_art/ui/views/favorite_wallpapers_view.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/blue_green_container.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return BlueGreenContainer(
      child: Drawer(
          // surfaceTintColor: Colors.amber,
          width: 250,
          // shadowColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(),
                child: Text(
                  'WallArt',
                  style: GoogleFonts.aboreto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              listTile(
                  title: "Favorite",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const FavoritesWallpapersView()));
                  },
                  icon: Icons.favorite),
              listTile(title: "Share", onPress: () {}, icon: Icons.share),
              listTile(title: "Setting", onPress: () {}, icon: Icons.settings),
            ],
          )),
    );
  }

  Widget listTile(
      {required String title, required VoidCallback onPress, required icon}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.whiteColor),
      title: Text(
        title,
        style: GoogleFonts.inter(color: AppColors.whiteColor),
      ),
      onTap: onPress,
    );
  }
}
