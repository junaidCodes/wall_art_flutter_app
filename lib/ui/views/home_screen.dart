import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wall_art/ui/views/tab_bars/category_tab_bar.dart';
import 'package:wall_art/ui/views/tab_bars/home_tab_bar.dart';
import 'package:wall_art/utils/app_bar.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

import 'package:wall_art/utils/side_menue.dart';

import 'package:wall_art/utils/tab_bar.dart';

class ExampleW extends StatefulWidget {
  const ExampleW({super.key});

  @override
  State<ExampleW> createState() => _ExampleWState();
}

class _ExampleWState extends State<ExampleW> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawerr(),
        backgroundColor: Colors.blueGrey,
        body: CustomScrollView(
          slivers: [
            AppBarHome(),

            // Expanded(
            //   child: SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //           childCount: PathToImage.weeding.length,
            //           (BuildContext context, int index) {
            //     return SizedBox(
            //       // height: 2800,
            //       child: CustomTabBar(tabTitles: const [
            //         'Home',
            //         'Category'
            //       ], pages: const [
            //         HomeTabBar(),
            //         CategoryTabBar(),
            //       ]),
            //     );
            //   })),
            // )

            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 2.7,
                child: CustomTabBar(tabTitles: const [
                  'Home',
                  'Category'
                ], pages: const [
                  HomeTabBar(),
                  CategoryTabBar(),
                ]),
              ),
            ),

            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text('Item $index'),
            //       );
            //     },
            //     childCount: 50,
            //   ),
            // ),
          ],
        ));
  }
}
