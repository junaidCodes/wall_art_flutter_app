import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wall_art/core/view_models/wallpaper_service.dart';
import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/blue_green_container.dart';
import 'package:wall_art/utils/image_path.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Container(
        height: 28,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            "wallArt",
            style: GoogleFonts.aboreto(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(width: 20),
      ],
      backgroundColor: Colors.teal,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      // collapsedHeight: 50,
      // stretch: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: BlueGreenContainer(child: const AppBarDetails()),
      ),
    );
  }
}

class AppBarDetails extends StatefulWidget {
  const AppBarDetails({super.key});

  @override
  State<AppBarDetails> createState() => _AppBarDetailsState();
}

class _AppBarDetailsState extends State<AppBarDetails> {
  PageController pageController = PageController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WallpaperService>(context, listen: false);

    return Consumer<WallpaperService>(builder: (context, value, child) {
      return Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: PathToImage.walpapers.length,
                itemBuilder: (BuildContext context, index, pageViewIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.walpaperSlider,
                          arguments: {
                            'images': PathToImage.walpapers,
                            'selectedIndex': index
                          });
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Image.asset(
                        PathToImage.walpapers[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      provider.activeIndex = index;
                      provider.notifyListner();
                    },
                    viewportFraction: 1,
                    disableCenter: true,
                    autoPlay: true)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedSmoothIndicator(
                  activeIndex: provider.activeIndex,
                  effect: const ScrollingDotsEffect(
                      dotColor: AppColors.whiteColor,
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 8,
                      dotWidth: 8),
                  count: PathToImage.walpapers.length),
            ),
          ),
        ],
      );
    });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> items = ['apple', 'mango', 'banana'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // List<String> match = [];
    // for (var fruit in items) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     match.add(fruit);
    //   }
    // }
    // return Container(
    //   color: Colors.green,
    // );
    // return ListView.builder(itemBuilder: (context, index) {
    //   var result = match[index];
    //   return ListTile(
    //     title: Text(result),
    //   );
    // });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> match = [];
    for (var fruit in items) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        match.add(fruit);
      }
    }
    // return ListView.builder(
    //     itemCount: match.length,
    //     itemBuilder: (context, index) {
    //       var result = match[index];
    //       return ListTile(
    //         title: Text(result[index]),
    //       );
    //     });
    return Container();
  }
}
