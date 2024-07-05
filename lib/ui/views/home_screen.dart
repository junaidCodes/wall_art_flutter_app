import 'package:flutter/material.dart';

import 'package:wall_art/ui/views/tab_bars/category_tab_bar.dart';
import 'package:wall_art/ui/views/tab_bars/home_tab_bar.dart';
import 'package:wall_art/utils/app_bar.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/blue_green_container.dart';
import 'package:wall_art/utils/button.dart';

import 'package:wall_art/utils/side_menue.dart';

import 'package:wall_art/utils/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlueGreenContainer(
      child: Scaffold(
        drawer: Container(color: AppColors.whiteColor, child: Drawerr()),
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          // floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppBarHome(),
              // const SliverAppBar(
              //   title: Text("data"),
              //   centerTitle: true,
              //   pinned: true,
              //   floating: false,
              //   primary: false,
              // ),

              // SliverAppBar(
              //   backgroundColor: Colors.white,
              //   // toolbarHeight:
              //   //     // MediaQuery.of(context).size.height * 1 * 0.72,
              //   //     457,
              //   toolbarHeight: 70,
              //   automaticallyImplyLeading: true,
              //   flexibleSpace: Column(
              //     children: [
              //       // const AppBarHome(),

              //       Container(
              //         color: Colors.red,
              //         height: 100,
              //         width: double.infinity,
              //       )
              //     ],
              //   ),
              //   pinned: false,
              // ),
              // SliverPersistentHeader(
              //     floating: false,
              //     pinned: false,
              //     delegate:
              //         MySliverAppBarDelegate(maxHeight: 100, minHeight: 100)),

              SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: TabbarPersistence(
                      minHeight: 100,
                      maxHeight: 100,
                      customWidget: CustomTabTitles(
                          tabTitles: const ['Home', 'Categories'],
                          tabController: tabController)))
            ];
          },
          body: Column(
            children: [
              CustomTabPages(
                  pages: [HomeTabBar(), CategoryTabBar()],
                  tabController: tabController)
            ],
          ),
        ),
      ),
    );
  }
}

//  Scaffold(
//         drawer: const Drawerr(),
//         backgroundColor: Colors.blueGrey,
//         body: CustomScrollView(
//           slivers: [
//             // ignore: prefer_const_constructors
//             AppBarHome(),

//             SliverToBoxAdapter(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height * 2.7,
//                 child: CustomTabBar(tabTitles: const [
//                   'Home',
//                   'Category'
//                 ], pages: const [
//                   HomeTabBar(),
//                   CategoryTabBar(),
//                 ]),
//               ),
//             ),

//           ],
//         ));

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  MySliverAppBarDelegate({required this.minHeight, required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Sliver Persistent Header',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TabbarPersistence extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  Widget customWidget;

  TabbarPersistence(
      {required this.minHeight,
      required this.maxHeight,
      required this.customWidget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return customWidget;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
