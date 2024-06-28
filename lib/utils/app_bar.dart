import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: SizedBox(
          height: 350,
          child: PageView.builder(
              controller: pageController,
              itemCount: PathToImage.weeding.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      PathToImage.weeding[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              })),
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
        const SizedBox(
          width: 20,
        )
      ],
      pinned: true,
      title: Container(
        height: 28,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            "wallArt",
            style: GoogleFonts.aboreto(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      expandedHeight: 300,
    );
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
