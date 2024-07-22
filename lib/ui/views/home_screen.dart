import 'package:flutter/material.dart';

import 'package:wall_art/ui/views/tab_bars/category_tab.dart';
import 'package:wall_art/ui/views/tab_bars/home_tab.dart';
import 'package:wall_art/utils/app_bar.dart';
import 'package:wall_art/utils/blue_green_container.dart';
import 'package:wall_art/utils/drawerr.dart';
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
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlueGreenContainer(
      child: Scaffold(
        drawer: const Drawerr(),
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const AppBarHome(),
              SliverAppBar(
                leading: const SizedBox(),
                backgroundColor: Colors.transparent,
                pinned: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(-20.0),
                  child: SizedBox(),
                ),
                flexibleSpace: CustomTabTitles(
                  tabTitles: const ['Home', 'Categories'],
                  tabController: tabController,
                ),
              ),
            ];
          },
          body: Column(
            children: [
              CustomTabPages(
                pages: const [HomeTab(), CategoryTab()],
                tabController: tabController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
